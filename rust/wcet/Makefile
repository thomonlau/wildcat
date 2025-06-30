# Rust integration (WCET)
ROOT_DIR := $(realpath ../..)
PROJECT_NAME = wcet
PATH_FROM_ROOT = rust/$(PROJECT_NAME)
PATH_TO_COMPILED = target

hello:
	echo $(HELLO)

help: ## Show this help.
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST)

compile: ## Compiles using 'rustc' to emit LLVM-IR and 'clang' as driver for code and PML generation.
	mkdir -p $(PATH_TO_COMPILED)
	rustc --emit=llvm-ir --target=riscv32imc-unknown-none-elf -C opt-level=3 src/main.rs --out-dir=$(PATH_TO_COMPILED)
	clang -target riscv32-unknown-elf -c -mserialize-auto -mllvm -mserialize-all -march=rv32i -mabi=ilp32 $(PATH_TO_COMPILED)/main.ll -o $(PATH_TO_COMPILED)/main.o

wcet-analysis: ## Runs the Platin WCET tool on 'main.o' and 'main.ll.pml' using entry defined by ENTRY_POINT.
	make compile
	platin wcet -i $(PATH_TO_COMPILED)/main.ll.pml -b $(PATH_TO_COMPILED)/main.o --report --analysis-entry $(ENTRY_POINT)

link: ## Links the compiled 'main.o' to 'main.out' using 'riscv64-unknown-elf-ld' (necessary for ISA and hardware simulator).
	make compile
	riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 linking/crt0.c -c -o $(PATH_TO_COMPILED)/crt0.o
	riscv64-unknown-elf-ld -o $(PATH_TO_COMPILED)/main.out main.o crt0.o -m elf32lriscv -Ttext 0

run-isa-sim: ## Runs the ISA simulator.
	make link
	cd $(ROOT_DIR) && sbt "runMain wildcat.isasim.SimRV $(PATH_FROM_ROOT)/$(PATH_TO_COMPILED)/main.out"

run-hw-sim: ## Runs the pipeline simulator.
	make link
	cd $(ROOT_DIR) && sbt -Dtest-file=$(PATH_FROM_ROOT)/$(PATH_TO_COMPILED)/$(PROJECT_NAME).out "testOnly wildcat.WildcatWcetTest"

disassembly: ## Shows disassembly using 'riscv64-unknown-elf-objdump'.
	make link
	riscv64-unknown-elf-objdump -dfh $(PATH_TO_COMPILED)/main.out

clean: ## Cleans the compiled sources.
	rm -rf target