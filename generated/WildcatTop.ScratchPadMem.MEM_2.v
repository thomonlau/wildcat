module BindsTo_2_ScratchPadMem(
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
  $readmemh("data2.hex", ScratchPadMem.MEM_2);
end
                      endmodule

bind ScratchPadMem BindsTo_2_ScratchPadMem BindsTo_2_ScratchPadMem_Inst(.*);