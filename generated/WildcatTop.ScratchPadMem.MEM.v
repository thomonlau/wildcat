module BindsTo_0_ScratchPadMem(
  input         clock,
  input  [31:0] io_rdAddress,
  output [31:0] io_rdData,
  input  [31:0] io_wrAddress,
  input  [31:0] io_wrData,
  input         io_wrEnable_0,
  input         io_wrEnable_1,
  input         io_wrEnable_2,
  input         io_wrEnable_3
);

initial begin
  $readmemh("data0.hex", ScratchPadMem.MEM);
end
                      endmodule

bind ScratchPadMem BindsTo_0_ScratchPadMem BindsTo_0_ScratchPadMem_Inst(.*);