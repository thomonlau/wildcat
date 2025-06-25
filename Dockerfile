# This Dockerfile is based on https://github.com/icyphy/pretvm-artifacts/blob/main/docker/Dockerfile

# Setup "Patmos" LLVM and clang
FROM wcet-base

# Setup for Platin
WORKDIR /root
RUN git clone https://github.com/tanneberger/platin.git
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

# Install Rust (upstream)
WORKDIR /
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
RUN . "$HOME/.cargo/env"
ENV PATH=/root/.cargo/bin:$PATH
RUN rustup target add riscv32i-unknown-none-elf
RUN rustup component add llvm-tools-preview

# Install Rust 1.36.0 (for LLVM 8) for WCET project
WORKDIR /root/wildcat/rust/wcet
RUN rustup install 1.36.0
RUN rustup override set 1.36.0
RUN rustup target add riscv32imc-unknown-none-elf

# Entrypoint
WORKDIR /root
ENTRYPOINT ["/bin/bash"]