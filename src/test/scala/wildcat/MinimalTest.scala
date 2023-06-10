package wildcat

import chisel3._
import chiseltest._
import scala.sys.process._
import org.scalatest.flatspec.AnyFlatSpec
import wildcat.pipeline.Wildcat
class MinimalTest extends AnyFlatSpec with ChiselScalatestTester {

  val files = Util.getAsmFiles()
  for (f <- files) {
    s"Minimal $f" should "pass" in {
       s"make app APP=$f".!
      test(new Wildcat(Array("a.bin"))) {
        d => {
          d.clock.step(3)
        }
      }
    }
  }
}
