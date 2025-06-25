# Rust integration (WCET)
ROOT_DIR := $(realpath ../..)
PROJECT_NAME = wcet-project
PATH_FROM_ROOT = rust/$(PROJECT_NAME)
PATH_TO_COMPILED = target

hello:
	echo $(HELLO)

help: ## Show this help.
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST)

compile: ## Compiles using 'rustc' to emit LLVM-IR and 'clang' as driver for code and PML generation.
	cd $(PATH_TO_COMPILED) && rustc --emit=llvm-ir -C opt-level=3 src/main.rs
	cd $(PATH_TO_COMPILED) && clang -target riscv32-unknown-elf -c -mserialize-auto -mllvm -mserialize-all -march=rv32i -mabi=ilp32 main.ll -o main.o

wcet-analysis: ## Runs the Platin WCET tool on 'main.o' and 'main.ll.pml' using entry defined by ENTRY_POINT.
	compile
	platin wcet -i $(PATH_TO_COMPILED)/main.ll.pml -b $(PATH_TO_COMPILED)/main.o --report --analysis-entry $(ENTRY_POINT)

link: ## Links the compiled 'main.o' to 'main.out' using 'riscv64-unknown-elf-ld' (necessary for ISA and hardware simulator).
	compile
	cd $(PATH_TO_COMPILED) && riscv64-unknown-elf-ld -o main.out main.o -m elf32lriscv -Ttext 0

run-isa-sim: ## Runs the ISA simulator.
	link
	cd $(ROOT_DIR) && sbt "runMain wildcat.isasim.SimRV $(PATH_FROM_ROOT)/$(PATH_TO_COMPILED)/main.out"

run-pipeline: ## Runs the pipeline simulator.
	link
	cd $(ROOT_DIR) && sbt "runMain wildcat.pipeline.WildcatTop $(PATH_FROM_ROOT)/$(PATH_TO_COMPILED)/main.out"

disassemble: ## Shows disassembly using 'riscv64-unknown-elf-objdump'.
	link
	cd $(PATH_TO_COMPILED) && riscv64-unknown-elf-objdump -d main.out

clean: ## Cleans the compiled sources.
	rm -rf target