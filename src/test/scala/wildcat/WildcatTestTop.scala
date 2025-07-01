package wildcat

import chisel3._
import chisel3.util.experimental.BoringUtils
import wildcat.pipeline._


/*
 * Top-level for testing and verification
 *
 */
class WildcatTestTop(file: String) extends Module {

  val io = IO(new Bundle {
    val regFile = Output(Vec(32,UInt(32.W)))
    val led = Output(UInt(8.W))
    val tx = Output(UInt(1.W))
    val rx = Input(UInt(1.W))
    val stop = Output(Bool())
    val cycles = Output(UInt(32.W))
    // For also debug -> TODO: Should be removed at some point
    val pc = Output(UInt(32.W))
    val pcRegReg = Output(UInt(32.W))
    val decExReg = Output(UInt(32.W))
    val doBranch = Output(Bool())
    val instr = Output(UInt(32.W))
    val instrReg = Output(UInt(32.W))
  })
  val cpuTop = Module(new WildcatTop(file))

  io.regFile := DontCare
  BoringUtils.bore(cpuTop.cpu.debugRegs, Seq(io.regFile))
  io.stop := DontCare
  BoringUtils.bore(cpuTop.cpu.stop, Seq(io.stop))
  io.led := DontCare
  BoringUtils.bore(cpuTop.ledReg, Seq(io.led))
  io.cycles := DontCare
  // For also debug -> TODO: Should be removed at some point
  BoringUtils.bore(cpuTop.cpu.cyclesReg, Seq(io.cycles))
  io.pc := DontCare
  BoringUtils.bore(cpuTop.cpu.pcReg, Seq(io.pc))
  io.pcRegReg := DontCare
  BoringUtils.bore(cpuTop.cpu.pcRegReg, Seq(io.pcRegReg))
  io.decExReg := DontCare
  BoringUtils.bore(cpuTop.cpu.decExReg.pc, Seq(io.decExReg))
  io.doBranch := DontCare
  BoringUtils.bore(cpuTop.cpu.doBranch, Seq(io.doBranch))
  io.instr := DontCare
  BoringUtils.bore(cpuTop.cpu.instr, Seq(io.instr))
  io.instrReg := DontCare
  BoringUtils.bore(cpuTop.cpu.instrReg, Seq(io.instrReg))

  cpuTop.io.rx := io.rx
  io.tx := cpuTop.io.tx
}