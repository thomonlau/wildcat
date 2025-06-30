package wildcat.pipeline

import chisel3._

// Only for synthesis tests leave all connections open
// Maybe add registers for fmax
class SynthTopFmax() extends Wildcat {

  // Here we can switch designs
  val start = 0.U;
  val cpu = Module(new ThreeCats(start))
  // val cpu = Module(new WildFour())
  // val cpu = Module(new StandardFive())
  cpu.io.imem <> io.imem
  cpu.io.dmem <> io.dmem
}

object SynthTopFmax extends App {
  emitVerilog(new SynthTopFmax(), Array("--target-dir", "generated"))
}