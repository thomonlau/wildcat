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
          d.clock.step(1)
          printf(s"pc_cur = 0x${d.io.pc.peekInt().toString(16)}\n")
          if (d.io.stop.peekBoolean()) {
            stop = true
            assert(d.io.regFile(10).peekInt() == 0, s"Failed test case ${d.io.regFile(3).peekInt()}")
          }
        }
        assert(stop, "Timeout")
        println(s"Total cycle count: ${d.io.cycles.peekInt() + 1}")
      }
    }
  }
}
