# Rust integration (upstream integration)
ROOT_DIR := $(realpath ../..)
PROJECT_NAME = upstream
PATH_FROM_ROOT = rust/$(PROJECT_NAME)
TARGET = riscv32i-unknown-none-elf
PATH_TO_COMPILED = target/$(TARGET)/release

help: ## Show this help.
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST)

compile: ## Compiles using 'cargo build'.
	cargo build --release
	mv $(PATH_TO_COMPILED)/$(PROJECT_NAME){,.out}

run-isa-sim: ## Runs the ISA simulator.
	make compile
	cd $(ROOT_DIR) && sbt "runMain wildcat.isasim.SimRV $(PATH_FROM_ROOT)/$(PATH_TO_COMPILED)/$(PROJECT_NAME).out"

run-hw-sim: ## Runs the pipeline simulator.
	make compile
	cd $(ROOT_DIR) && sbt -Dtest-file=$(PATH_FROM_ROOT)/$(PATH_TO_COMPILED)/$(PROJECT_NAME).out "testOnly wildcat.WildcatWcetTest"

disassembly: ## Shows disassembly using 'rust-objdump'.
	make compile
	rust-objdump -dfh --arch=riscv32 $(PATH_TO_COMPILED)/$(PROJECT_NAME).out

clean: ## Cleans the compiled sources.
	cargo clean