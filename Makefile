#
# Makefile (work in progress) for Wildcat, a RISC-V implementation.
#
# Include user makefile for local configurations, e.g., path to RISC-V tools
-include config.mk
RISCV?=$(HOME)/data/repository/rocket-chip/riscv-tools

#
# sbt looks for default into a folder ./project and . for build.sdt and Build.scala
# sbt creates per default a ./target folder

# Using sbt with a .jar file in the repository. Better install sbt
# SBT = java -Xmx1024M -Xss8M -XX:MaxPermSize=128M -jar sbt/sbt-launch.jar

SBT = sbt

# This generates the Verilog and C++ files by invoking main from
# class HelloMain in package hello.
# The source directory is configured in build.sbt.
# The Scala/Java build directory is default ./target.

# The first two arguments are consumed by sbt, the rest is
# forwarded to the Scala/Chisel main().


# Generate Verilog code
hdl:
	$(SBT) "run-main hello.HelloMain --targetDir generated --backend v"

# Generate C++ code (simulation)
cpp:
	$(SBT) "run-main hello.HelloMain --backend c --compile --targetDir generated"

# Assume RISC-V tools are built and installed.
# Set the path here or outside.
TEST_DIR=$(RISCV)/riscv-tests/isa
test:
	cp $(TEST_DIR)/rv32ui-p-add.hex asm/a.hex

	

# get the test cases from Sodor as simple hex files
# not really used (yet)
test-sodor:
	-rm -rf riscv-sodor
	git clone https://github.com/ucb-bar/riscv-sodor.git
	cp -r riscv-sodor/install/riscv-tests/ tests
	rm -rf riscv-sodor
