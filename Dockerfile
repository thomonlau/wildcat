# This Dockerfile is based on https://github.com/icyphy/pretvm-artifacts/blob/main/docker/Dockerfile

# Setup "Patmos" LLVM and clang
FROM wcet-base

# Setup for Platin
WORKDIR /root
RUN git clone https://github.com/thomonlau/platin.git
RUN mkdir -p /root/gems
ENV GEM_HOME=/root/gems
WORKDIR /root/platin
# Replacement for Platins setup.sh
RUN bundler || { echo "Bundler not found. Aborting." >&2; exit 1; }
RUN bundle install

## Wildcat setup
# Copy Wildcat project
WORKDIR /root
COPY . /root/wildcat

# Java setup (OpenJDK 17) for Scala
WORKDIR /
RUN apt update -y
RUN apt install -y openjdk-17-jdk
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=${JAVA_HOME}/bin:$PATH

# sbt setup
RUN echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | tee /etc/apt/sources.list.d/sbt.list
RUN echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | tee /etc/apt/sources.list.d/sbt_old.list
RUN curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo -H gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/scalasbt-release.gpg --import
RUN sudo chmod 644 /etc/apt/trusted.gpg.d/scalasbt-release.gpg
RUN sudo apt-get update
RUN sudo apt-get install -y sbt
WORKDIR /root/wildcat
RUN sbt clean
RUN sbt compile

# Install Rust (upstream)
WORKDIR /
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
RUN . "$HOME/.cargo/env"
ENV PATH=/root/.cargo/bin:$PATH
RUN rustup target add riscv32i-unknown-none-elf
RUN rustup component add llvm-tools-preview

# Install Rust 1.37.0 (for LLVM 8) for WCET project
WORKDIR /root/wildcat/rust/wcet
RUN rustup install 1.37.0 --profile=minimal
RUN rustup override set 1.37.0
RUN rustup target add riscv32imc-unknown-none-elf

# Extract libraries for Rust linking (using Rust 1.38.0 for riscv32i-unknown-none-elf)
WORKDIR /root/wildcat/rust/wcet/lib
RUN rustup install 1.38.0 --profile=minimal
RUN rustup override set 1.38.0
RUN rustup target add riscv32i-unknown-none-elf
RUN ar -x $(rustc --print sysroot)/lib/rustlib/riscv32i-unknown-none-elf/lib/libcompiler_builtins*.rlib
RUN mv compiler_builtins*.o compiler_builtins.o
RUN rm *.z *.bin

# Entrypoint
WORKDIR /root/wildcat
ENTRYPOINT ["/bin/bash"]

## The following setup is for building the wcet-base image.
## Note that it can take a while to build (>30 min from experience).
## Therefore, it is not included above, but build separatly, as it is a static dependency for this project.
## However, it is included here, so it can be build if the wcet image is not available.
## Finally, in the following, comments are marked with '##', while commands are marked with '#'.

# FROM ubuntu:20.04

## Timezone
#ENV TZ="UTC"
#RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
#RUN echo $TZ > /etc/timezone && rm -rf /var/lib/apt/lists/*
#ENV HOME=/root

## Base Configuration
#RUN apt update -y
#RUN apt install -y git wget curl tar sudo apt-utils nano
#ENV LANG=en_US.utf8

## Platin and patmos-clang setup

## Install dependencies for patmos-clang / Platin
#RUN apt update -y
#RUN apt install -y build-essential
#RUN apt install -y ninja-build
#RUN apt install -y cmake
#RUN apt install -y ruby
#RUN apt install -y ruby-dev
#RUN apt install -y python3
#RUN apt install -y liblpsolve55-dev
#RUN apt install -y lp-solve
#RUN apt install -y pkg-config
#RUN apt install -y libssl-dev
#RUN apt install -y gcc-riscv64-unknown-elf

#RUN gem install bundler -v 2.4.22

## Setup patmos llvm and clang
#WORKDIR /root
#RUN git clone --branch llvm_70_pml_arm https://gitlab.cs.fau.de/fusionclock/llvm.git /root/patmos-llvm
#WORKDIR /root/patmos-llvm/tools
#RUN git clone --branch clang_70_pml_arm https://gitlab.cs.fau.de/fusionclock/clang-riscv.git clang
#WORKDIR /root/patmos-llvm
#RUN mkdir -p /root/build/patmos-llvm
#WORKDIR /root/build/patmos-llvm
#RUN LD=ld.gold cmake -G "Ninja" -DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
#       -DCMAKE_BUILD_TYPE=Debug \
#       -DLLVM_TARGETS_TO_BUILD="ARM;X86;AArch64" \
#       -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD="RISCV" \
#       -DLLVM_INCLUDE_EXAMPLES=OFF \
#       -DLLVM_INCLUDE_TESTS=OFF \
#       -DCLANG_ENABLE_ARCMT=OFF \
#       -DCLANG_ENABLE_STATIC_ANALYZER=OFF \
#       -DLLVM_BUILD_TOOLS=OFF \
#       /root/patmos-llvm/
#RUN ninja clang llvm-dis llvm-ar llvm-as llvm-objdump -j 8
#WORKDIR /root/build/patmos-llvm/bin
#RUN ls -l
#RUN for file in *; do \
#               if [[ -x "$file" ]]; then \
#                   ln -sr "$file" patmos-"$(basename "$file")"; \
#               fi; \
#           done
#ENV PATH=/root/build/patmos-llvm/bin:/root/platin:$PATH

## Fixing quirks for Platin
#ENV LD_LIBRARY_PATH=/usr/lib/lp_solve

## Entrypoint
#WORKDIR /root
#ENTRYPOINT ["/bin/bash"]