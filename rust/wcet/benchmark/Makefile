FILE = fib.rs
BUILT_DIR = target
ROOT_DIR := $(realpath ../../..)
WCET_ENTRY_POINT = main

create-built-dir:
	mkdir -p $(BUILT_DIR)

# Compiles Rust files
# Step 0: Ensure directory exists
# Step 1: Compile Rust source file to LLVM-IR
# Step 2: Find and replace any LLVM intrinsics
# Step 3: Compile LLVM-IR to binary + metadata file (.pml)
compile-rust:
	make create-built-dir
	rustc --emit=llvm-ir --target=riscv32imc-unknown-none-elf -C opt-level=3 $(FILE) -o $(BUILT_DIR)/$(FILE).ll
	rustc flow_facts_handle.rs && ./flow_facts_handle $(BUILT_DIR)/$(FILE).ll
	clang -target riscv32-unknown-none-elf -c -o $(BUILT_DIR)/$(FILE).o -mserialize-auto -mllvm -mserialize-all -march=rv32i -mabi=ilp32 $(BUILT_DIR)/$(FILE).ll

compile-c:
	make create-built-dir
	cp $(FILE) $(BUILT_DIR)
	clang -target riscv32-unknown-none-elf -c -o $(BUILT_DIR)/$(FILE).o -mserialize-auto -mllvm -mserialize-all -march=rv32i -mabi=ilp32 -O3 $(BUILT_DIR)/$(FILE)
	rm $(BUILT_DIR)/$(FILE)

compile:
ifeq ($(suffix $(FILE)), .rs)
	make compile-rust
else ifeq ($(suffix $(FILE)), .c)
	make compile-c
else
	@echo "Unknown file extension: $(suffix $(FILE))"
	exit 1
endif

wcet-analysis:
	make compile
ifeq ($(suffix $(FILE)), .rs)
	platin wcet -i $(BUILT_DIR)/$(FILE).ll.pml -b $(BUILT_DIR)/$(FILE).o --report --analysis-entry $(WCET_ENTRY_POINT) --disable-ait
else ifeq ($(suffix $(FILE)), .c)
	platin wcet -i $(BUILT_DIR)/$(FILE).pml -b $(BUILT_DIR)/$(FILE).o --report --analysis-entry $(WCET_ENTRY_POINT) --disable-ait
else
	@echo "Unknown file extension: $(suffix $(FILE))"
	exit 1
endif


# Links for Wildcat execution
# Step 0: Compile
# Step 1: Compile crt0
# Step 2: Link with library function + Rust built-ins
link:
	make compile
	riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 ../linking/crt0.c -c -o $(BUILT_DIR)/crt0.o
	riscv64-unknown-elf-ld -o $(BUILT_DIR)/$(FILE).out $(BUILT_DIR)/$(FILE).o $(BUILT_DIR)/crt0.o -m elf32lriscv -Ttext 0 \
	/usr/lib/gcc/riscv64-unknown-elf/9.3.0/rv32i/ilp32/libgcc.a ../lib/libmem.o --gc-sections

run-isa-sim:
	make link
	cd $(ROOT_DIR) && sbt "runMain wildcat.isasim.SimRV $(realpath .)/$(BUILT_DIR)/$(FILE).out"

run-hw-sim:
	make link
	cd $(ROOT_DIR) && sbt -Dtest-file=$(realpath .)/$(BUILT_DIR)/$(FILE).out "testOnly wildcat.WildcatWcetTest"

disassembly:
	make link
	riscv64-unknown-elf-objdump -dfh $(BUILT_DIR)/$(FILE).out

run-benchmark:
	bash run_benchmark.sh

clean:
	rm -rf $(BUILT_DIR)

clean-results:
	rm -rf results