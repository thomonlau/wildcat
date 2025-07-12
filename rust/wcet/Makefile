# Rust integration (WCET)
ROOT_DIR := $(realpath ../..)
PATH_FROM_ROOT = rust/wcet
PATH_TO_COMPILED = target
SOURCE_FILE = main
SOURCE_PATH = src
WCET_ENTRY_POINT = main

help: ## Show this help.
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST)

compile: ## Compiles using 'rustc' to emit LLVM-IR and 'clang' as driver for code and PML generation.
	mkdir -p $(PATH_TO_COMPILED)
	rustc --emit=llvm-ir --target=riscv32imc-unknown-none-elf -C opt-level=3 $(SOURCE_PATH)/$(SOURCE_FILE).rs --out-dir=$(PATH_TO_COMPILED)
	clang -target riscv32-unknown-none-elf -c -o $(PATH_TO_COMPILED)/$(SOURCE_FILE).o -mserialize-auto -mllvm -mserialize-all -march=rv32i -mabi=ilp32 $(PATH_TO_COMPILED)/$(SOURCE_FILE).ll

link: ## Links the compiled '$(SOURCE_FILE).o' to '$(SOURCE_FILE).out' using 'riscv64-unknown-elf-ld' (necessary for ISA and hardware simulator).
	make compile
	riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 linking/crt0.c -c -o $(PATH_TO_COMPILED)/crt0.o
	riscv64-unknown-elf-ld -o $(PATH_TO_COMPILED)/$(SOURCE_FILE).out $(PATH_TO_COMPILED)/$(SOURCE_FILE).o $(PATH_TO_COMPILED)/crt0.o -m elf32lriscv -Ttext 0 \
	lib/compiler_builtins.o --gc-sections
	#/usr/lib/gcc/riscv64-unknown-elf/9.3.0/rv32i/ilp32/libgcc.a lib/libmem.o --gc-sections
	#lib/core.o lib/compiler_builtins.o --gc-sections

wcet-analysis: ## Runs the Platin WCET tool on '$(SOURCE_FILE).out' and '$(SOURCE_FILE).ll.pml' using entry defined by WCET_ENTRY_POINT (defaults to 'main').
	make compile
	platin wcet -i $(PATH_TO_COMPILED)/$(SOURCE_FILE).ll.pml -b $(PATH_TO_COMPILED)/$(SOURCE_FILE).o --report --analysis-entry $(WCET_ENTRY_POINT) --disable-ait

run-isa-sim: ## Runs the ISA simulator.
	make link
	cd $(ROOT_DIR) && sbt "runMain wildcat.isasim.SimRV $(PATH_FROM_ROOT)/$(PATH_TO_COMPILED)/$(SOURCE_FILE).out"

run-hw-sim: ## Runs the pipeline simulator.
	make link
	cd $(ROOT_DIR) && sbt -Dtest-file=$(PATH_FROM_ROOT)/$(PATH_TO_COMPILED)/$(SOURCE_FILE).out "testOnly wildcat.WildcatWcetTest"

disassembly: ## Shows disassembly using 'riscv64-unknown-elf-objdump'.
	make link
	riscv64-unknown-elf-objdump -dfh $(PATH_TO_COMPILED)/$(SOURCE_FILE).out

clean: ## Cleans the compiled sources.
	rm -rf target