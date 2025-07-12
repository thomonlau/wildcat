package wildcat

import scala.util.Properties

import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class WildcatWcetTest() extends AnyFlatSpec with ChiselScalatestTester {

  val file: String = Properties.propOrNone("test-file") match {
    case Some(t) => t
    case None => throw new IllegalArgumentException("No file provided")
  }
  println(s"Running test: $file")
  s"Program $file" should "pass" in {
    val app = file
    test(new WildcatTestTop(app)).withAnnotations(Seq(WriteVcdAnnotation)) {
      d => {
        var stop = false
        d.clock.setTimeout(10000)
        while(!stop) {
          if(d.clock % 100 == 0) { // Also for debug -> TODO: Should be removed at some point
            printf(s"pcReg = 0x${d.io.pc.peekInt().toString(16)}\n")
            printf(s"pcRegReg = 0x${d.io.pcRegReg.peekInt().toString(16)}\n")
            printf(s"decExReg = 0x${d.io.decExReg.peekInt().toString(16)}\n")
            printf(s"doBranch = ${d.io.doBranch.peekBoolean()}\n")
            printf(s"instr = ${d.io.instr.peekInt().toString(16)}\n")
            printf(s"instrReg = ${d.io.instrReg.peekInt().toString(16)}\n")
            println(f"reg(ra) = 0x${d.io.regFile(1).peekInt().toString(16)}")
            println(f"reg(sp) = 0x${d.io.regFile(2).peekInt().toString(16)}")
            println(f"reg(a0) = 0x${d.io.regFile(10).peekInt().toString(16)}")
            println()
          }
          if (d.io.stop.peekBoolean()) {
            stop = true
            assert(d.io.regFile(10).peekInt() == 0, s"Failed test case ${d.io.regFile(3).peekInt()}")
          }
          d.clock.step(1)
        }
        assert(stop, "Timeout")
        println(s"Total cycle count: ${d.io.cycles.peekInt() + 1}")
      }
    }
  }
}
