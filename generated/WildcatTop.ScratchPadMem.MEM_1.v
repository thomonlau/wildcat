module BindsTo_1_ScratchPadMem(
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
  $readmemh("data1.hex", ScratchPadMem.MEM_1);
end
                      endmodule

bind ScratchPadMem BindsTo_1_ScratchPadMem BindsTo_1_ScratchPadMem_Inst(.*);