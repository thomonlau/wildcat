module Csr(
  input  [11:0] io_address,
  output [31:0] io_data
);
  wire [31:0] _GEN_0 = 12'hf12 == io_address ? 32'h2f : 32'h0; // @[Csr.scala 22:22 48:12 19:25]
  wire [31:0] _GEN_1 = 12'hb81 == io_address ? 32'h0 : _GEN_0; // @[Csr.scala 22:22 45:12]
  wire [31:0] _GEN_2 = 12'hb01 == io_address ? 32'h0 : _GEN_1; // @[Csr.scala 22:22 42:12]
  wire [31:0] _GEN_3 = 12'hb80 == io_address ? 32'h0 : _GEN_2; // @[Csr.scala 22:22 39:12]
  wire [31:0] _GEN_4 = 12'hb00 == io_address ? 32'h0 : _GEN_3; // @[Csr.scala 22:22 36:12]
  wire [31:0] _GEN_5 = 12'hc81 == io_address ? 32'h4 : _GEN_4; // @[Csr.scala 22:22 33:12]
  wire [31:0] _GEN_6 = 12'hc01 == io_address ? 32'h3 : _GEN_5; // @[Csr.scala 22:22 30:12]
  wire [31:0] _GEN_7 = 12'hc80 == io_address ? 32'h2 : _GEN_6; // @[Csr.scala 22:22 27:12]
  assign io_data = 12'hc00 == io_address ? 32'h1 : _GEN_7; // @[Csr.scala 22:22 24:12]
endmodule
module ThreeCats(
  input         clock,
  input         reset,
  output [31:0] io_imem_address,
  input  [31:0] io_imem_data,
  output [31:0] io_dmem_rdAddress,
  input  [31:0] io_dmem_rdData,
  output        io_dmem_rdEnable,
  output [31:0] io_dmem_wrAddress,
  output [31:0] io_dmem_wrData,
  output        io_dmem_wrEnable_0,
  output        io_dmem_wrEnable_1,
  output        io_dmem_wrEnable_2,
  output        io_dmem_wrEnable_3
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] regs [0:31]; // @[Functions.scala 194:29]
  wire  regs_rs1Val_MPORT_en; // @[Functions.scala 194:29]
  wire [4:0] regs_rs1Val_MPORT_addr; // @[Functions.scala 194:29]
  wire [31:0] regs_rs1Val_MPORT_data; // @[Functions.scala 194:29]
  wire  regs_rs2Val_MPORT_en; // @[Functions.scala 194:29]
  wire [4:0] regs_rs2Val_MPORT_addr; // @[Functions.scala 194:29]
  wire [31:0] regs_rs2Val_MPORT_data; // @[Functions.scala 194:29]
  wire [31:0] regs_MPORT_data; // @[Functions.scala 194:29]
  wire [4:0] regs_MPORT_addr; // @[Functions.scala 194:29]
  wire  regs_MPORT_mask; // @[Functions.scala 194:29]
  wire  regs_MPORT_en; // @[Functions.scala 194:29]
  reg  regs_rs1Val_MPORT_en_pipe_0;
  reg [4:0] regs_rs1Val_MPORT_addr_pipe_0;
  reg  regs_rs2Val_MPORT_en_pipe_0;
  reg [4:0] regs_rs2Val_MPORT_addr_pipe_0;
  wire [11:0] csr_io_address; // @[ThreeCats.scala 70:19]
  wire [31:0] csr_io_data; // @[ThreeCats.scala 70:19]
  reg  exFwdReg_valid; // @[ThreeCats.scala 40:25]
  reg [4:0] exFwdReg_wbDest; // @[ThreeCats.scala 40:25]
  reg [31:0] exFwdReg_wbData; // @[ThreeCats.scala 40:25]
  reg [31:0] pcReg; // @[ThreeCats.scala 45:22]
  wire [31:0] _pcNext_T_1 = pcReg + 32'h4; // @[ThreeCats.scala 46:62]
  reg [2:0] decExReg_func3; // @[ThreeCats.scala 125:25]
  wire  _doBranch_T = 3'h0 == decExReg_func3; // @[Functions.scala 143:20]
  reg [4:0] decExReg_rs1; // @[ThreeCats.scala 125:25]
  reg [31:0] decExReg_rs1Val; // @[ThreeCats.scala 125:25]
  wire [31:0] v1 = exFwdReg_valid & exFwdReg_wbDest == decExReg_rs1 ? exFwdReg_wbData : decExReg_rs1Val; // @[ThreeCats.scala 129:15]
  reg [4:0] decExReg_rs2; // @[ThreeCats.scala 125:25]
  reg [31:0] decExReg_rs2Val; // @[ThreeCats.scala 125:25]
  wire [31:0] v2 = exFwdReg_valid & exFwdReg_wbDest == decExReg_rs2 ? exFwdReg_wbData : decExReg_rs2Val; // @[ThreeCats.scala 130:15]
  wire  _doBranch_T_1 = 3'h1 == decExReg_func3; // @[Functions.scala 143:20]
  wire  _doBranch_T_2 = 3'h4 == decExReg_func3; // @[Functions.scala 143:20]
  wire [31:0] _doBranch_res_T_2 = exFwdReg_valid & exFwdReg_wbDest == decExReg_rs1 ? exFwdReg_wbData : decExReg_rs1Val; // @[Functions.scala 151:20]
  wire [31:0] _doBranch_res_T_3 = exFwdReg_valid & exFwdReg_wbDest == decExReg_rs2 ? exFwdReg_wbData : decExReg_rs2Val; // @[Functions.scala 151:33]
  wire  _doBranch_T_3 = 3'h5 == decExReg_func3; // @[Functions.scala 143:20]
  wire  _GEN_328 = 3'h7 == decExReg_func3 & v1 >= v2; // @[Functions.scala 143:20 160:13 142:9]
  wire  _GEN_329 = 3'h6 == decExReg_func3 ? v1 < v2 : _GEN_328; // @[Functions.scala 143:20 157:13]
  wire  _GEN_330 = 3'h5 == decExReg_func3 ? $signed(_doBranch_res_T_2) >= $signed(_doBranch_res_T_3) : _GEN_329; // @[Functions.scala 143:20 154:13]
  wire  _GEN_331 = 3'h4 == decExReg_func3 ? $signed(_doBranch_res_T_2) < $signed(_doBranch_res_T_3) : _GEN_330; // @[Functions.scala 143:20 151:13]
  wire  _GEN_332 = 3'h1 == decExReg_func3 ? v1 != v2 : _GEN_331; // @[Functions.scala 143:20 148:13]
  wire  doBranch_res = 3'h0 == decExReg_func3 ? v1 == v2 : _GEN_332; // @[Functions.scala 143:20 145:13]
  reg  decExReg_decOut_isBranch; // @[ThreeCats.scala 125:25]
  reg  decExReg_decOut_isJal; // @[ThreeCats.scala 125:25]
  reg  decExReg_decOut_isJalr; // @[ThreeCats.scala 125:25]
  reg  decExReg_valid; // @[ThreeCats.scala 125:25]
  wire  doBranch = (doBranch_res & decExReg_decOut_isBranch | decExReg_decOut_isJal | decExReg_decOut_isJalr) &
    decExReg_valid; // @[ThreeCats.scala 155:130]
  reg  decExReg_decOut_isLoad; // @[ThreeCats.scala 125:25]
  wire  _T_13 = ~doBranch; // @[ThreeCats.scala 159:34]
  reg [1:0] decExReg_memLow; // @[ThreeCats.scala 125:25]
  wire  _res_T_17 = 2'h0 == decExReg_memLow; // @[Functions.scala 259:24]
  wire [23:0] _res_res_T_21 = io_dmem_rdData[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _res_res_T_23 = {_res_res_T_21,io_dmem_rdData[7:0]}; // @[Functions.scala 261:38]
  wire  _res_T_18 = 2'h1 == decExReg_memLow; // @[Functions.scala 259:24]
  wire [23:0] _res_res_T_26 = io_dmem_rdData[15] ? 24'hffffff : 24'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _res_res_T_28 = {_res_res_T_26,io_dmem_rdData[15:8]}; // @[Functions.scala 264:39]
  wire  _res_T_19 = 2'h2 == decExReg_memLow; // @[Functions.scala 259:24]
  wire [23:0] _res_res_T_31 = io_dmem_rdData[23] ? 24'hffffff : 24'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _res_res_T_33 = {_res_res_T_31,io_dmem_rdData[23:16]}; // @[Functions.scala 267:39]
  wire  _res_T_20 = 2'h3 == decExReg_memLow; // @[Functions.scala 259:24]
  wire [23:0] _res_res_T_36 = io_dmem_rdData[31] ? 24'hffffff : 24'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _res_res_T_38 = {_res_res_T_36,io_dmem_rdData[31:24]}; // @[Functions.scala 271:39]
  wire [31:0] _GEN_334 = 2'h3 == decExReg_memLow ? _res_res_T_38 : io_dmem_rdData; // @[Functions.scala 259:24 271:17 256:9]
  wire [31:0] _GEN_335 = 2'h2 == decExReg_memLow ? _res_res_T_33 : _GEN_334; // @[Functions.scala 259:24 267:17]
  wire [31:0] _GEN_336 = 2'h1 == decExReg_memLow ? _res_res_T_28 : _GEN_335; // @[Functions.scala 259:24 264:17]
  wire [31:0] _GEN_337 = 2'h0 == decExReg_memLow ? _res_res_T_23 : _GEN_336; // @[Functions.scala 259:24 261:17]
  wire [15:0] _res_res_T_41 = io_dmem_rdData[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _res_res_T_43 = {_res_res_T_41,io_dmem_rdData[15:0]}; // @[Functions.scala 278:39]
  wire [15:0] _res_res_T_46 = io_dmem_rdData[31] ? 16'hffff : 16'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _res_res_T_48 = {_res_res_T_46,io_dmem_rdData[31:16]}; // @[Functions.scala 281:39]
  wire [31:0] _GEN_338 = _res_T_19 ? _res_res_T_48 : io_dmem_rdData; // @[Functions.scala 276:24 281:17 256:9]
  wire [31:0] _GEN_339 = _res_T_17 ? _res_res_T_43 : _GEN_338; // @[Functions.scala 276:24 278:17]
  wire [31:0] _GEN_340 = _res_T_20 ? {{24'd0}, io_dmem_rdData[31:24]} : io_dmem_rdData; // @[Functions.scala 286:24 297:17 256:9]
  wire [31:0] _GEN_341 = _res_T_19 ? {{24'd0}, io_dmem_rdData[23:16]} : _GEN_340; // @[Functions.scala 286:24 294:17]
  wire [31:0] _GEN_342 = _res_T_18 ? {{24'd0}, io_dmem_rdData[15:8]} : _GEN_341; // @[Functions.scala 286:24 291:17]
  wire [31:0] _GEN_343 = _res_T_17 ? {{24'd0}, io_dmem_rdData[7:0]} : _GEN_342; // @[Functions.scala 286:24 288:17]
  wire [31:0] _GEN_344 = _res_T_19 ? {{16'd0}, io_dmem_rdData[31:16]} : io_dmem_rdData; // @[Functions.scala 302:24 307:17 256:9]
  wire [31:0] _GEN_345 = _res_T_17 ? {{16'd0}, io_dmem_rdData[15:0]} : _GEN_344; // @[Functions.scala 302:24 304:17]
  wire [31:0] _GEN_346 = _doBranch_T_3 ? _GEN_345 : io_dmem_rdData; // @[Functions.scala 257:19 256:9]
  wire [31:0] _GEN_347 = _doBranch_T_2 ? _GEN_343 : _GEN_346; // @[Functions.scala 257:19]
  wire [31:0] _GEN_348 = _doBranch_T_1 ? _GEN_339 : _GEN_347; // @[Functions.scala 257:19]
  wire [31:0] res_res_1 = _doBranch_T ? _GEN_337 : _GEN_348; // @[Functions.scala 257:19]
  reg  decExReg_decOut_isCssrw; // @[ThreeCats.scala 125:25]
  reg [31:0] decExReg_csrVal; // @[ThreeCats.scala 125:25]
  reg  decExReg_decOut_isAuiPc; // @[ThreeCats.scala 125:25]
  reg [31:0] decExReg_pc; // @[ThreeCats.scala 125:25]
  reg [31:0] decExReg_decOut_imm; // @[ThreeCats.scala 125:25]
  wire [31:0] _res_T_15 = $signed(decExReg_pc) + $signed(decExReg_decOut_imm); // @[ThreeCats.scala 139:55]
  reg  decExReg_decOut_isLui; // @[ThreeCats.scala 125:25]
  reg [3:0] decExReg_decOut_aluOp; // @[ThreeCats.scala 125:25]
  reg  decExReg_decOut_isImm; // @[ThreeCats.scala 125:25]
  wire [31:0] val2 = decExReg_decOut_isImm ? decExReg_decOut_imm : v2; // @[ThreeCats.scala 133:17]
  wire [31:0] _res_res_T_1 = v1 + val2; // @[Functions.scala 221:18]
  wire [31:0] _res_res_T_3 = v1 - val2; // @[Functions.scala 224:18]
  wire [31:0] _res_res_T_4 = v1 & val2; // @[Functions.scala 227:18]
  wire [31:0] _res_res_T_5 = v1 | val2; // @[Functions.scala 230:18]
  wire [31:0] _res_res_T_6 = v1 ^ val2; // @[Functions.scala 233:18]
  wire [62:0] _GEN_0 = {{31'd0}, v1}; // @[Functions.scala 236:18]
  wire [62:0] _res_res_T_8 = _GEN_0 << val2[4:0]; // @[Functions.scala 236:18]
  wire [31:0] _res_res_T_10 = v1 >> val2[4:0]; // @[Functions.scala 239:18]
  wire [31:0] _res_res_T_14 = $signed(_doBranch_res_T_2) >>> val2[4:0]; // @[Functions.scala 242:38]
  wire [31:0] _res_res_T_16 = decExReg_decOut_isImm ? decExReg_decOut_imm : v2; // @[Functions.scala 245:30]
  wire  _res_res_T_18 = v1 < val2; // @[Functions.scala 248:19]
  wire  _GEN_314 = 4'h3 == decExReg_decOut_aluOp ? $signed(_doBranch_res_T_2) < $signed(_res_res_T_16) : _res_res_T_18; // @[Functions.scala 219:16 245:13]
  wire [31:0] _GEN_315 = 4'h7 == decExReg_decOut_aluOp ? _res_res_T_14 : {{31'd0}, _GEN_314}; // @[Functions.scala 219:16 242:13]
  wire [31:0] _GEN_316 = 4'h6 == decExReg_decOut_aluOp ? _res_res_T_10 : _GEN_315; // @[Functions.scala 219:16 239:13]
  wire [62:0] _GEN_317 = 4'h2 == decExReg_decOut_aluOp ? _res_res_T_8 : {{31'd0}, _GEN_316}; // @[Functions.scala 219:16 236:13]
  wire [62:0] _GEN_318 = 4'h5 == decExReg_decOut_aluOp ? {{31'd0}, _res_res_T_6} : _GEN_317; // @[Functions.scala 219:16 233:13]
  wire [62:0] _GEN_319 = 4'h8 == decExReg_decOut_aluOp ? {{31'd0}, _res_res_T_5} : _GEN_318; // @[Functions.scala 219:16 230:13]
  wire [62:0] _GEN_320 = 4'h9 == decExReg_decOut_aluOp ? {{31'd0}, _res_res_T_4} : _GEN_319; // @[Functions.scala 219:16 227:13]
  wire [62:0] _GEN_321 = 4'h1 == decExReg_decOut_aluOp ? {{31'd0}, _res_res_T_3} : _GEN_320; // @[Functions.scala 219:16 224:13]
  wire [62:0] _GEN_322 = 4'h0 == decExReg_decOut_aluOp ? {{31'd0}, _res_res_T_1} : _GEN_321; // @[Functions.scala 219:16 221:13]
  wire [31:0] res_res = _GEN_322[31:0]; // @[Functions.scala 217:19]
  wire [31:0] _GEN_323 = decExReg_decOut_isLui ? decExReg_decOut_imm : res_res; // @[ThreeCats.scala 135:31 134:7 136:9]
  wire [31:0] _GEN_324 = decExReg_decOut_isAuiPc ? _res_T_15 : _GEN_323; // @[ThreeCats.scala 138:33 139:9]
  wire [31:0] _GEN_325 = decExReg_decOut_isCssrw ? decExReg_csrVal : _GEN_324; // @[ThreeCats.scala 141:33 142:9]
  wire [31:0] res = decExReg_decOut_isLoad & ~doBranch ? res_res_1 : _GEN_325; // @[ThreeCats.scala 159:45 160:9]
  wire [31:0] branchTarget = decExReg_decOut_isJalr ? res : _res_T_15; // @[ThreeCats.scala 151:16 152:32 153:18]
  reg  firstIter; // @[ThreeCats.scala 47:26]
  wire [31:0] instr = firstIter ? 32'h13 : io_imem_data; // @[ThreeCats.scala 53:19 54:11 52:26]
  reg [31:0] pcRegReg; // @[ThreeCats.scala 62:25]
  reg [31:0] instrReg; // @[ThreeCats.scala 63:25]
  reg [4:0] rs1Val_REG; // @[Functions.scala 196:31]
  wire [31:0] rs1Val = rs1Val_REG == 5'h0 ? 32'h0 : regs_rs1Val_MPORT_data; // @[Functions.scala 196:23]
  reg [4:0] rs2Val_REG; // @[Functions.scala 197:31]
  wire [31:0] rs2Val = rs2Val_REG == 5'h0 ? 32'h0 : regs_rs2Val_MPORT_data; // @[Functions.scala 197:23]
  reg [4:0] decExReg_rd; // @[ThreeCats.scala 125:25]
  wire  _T = decExReg_rd != 5'h0; // @[Functions.scala 198:24]
  reg  decExReg_decOut_rfWrite; // @[ThreeCats.scala 125:25]
  wire  wrEna = decExReg_valid & decExReg_decOut_rfWrite; // @[ThreeCats.scala 156:27]
  wire  _T_1 = wrEna & decExReg_rd != 5'h0; // @[Functions.scala 198:18]
  wire  _T_12 = decExReg_decOut_isJal | decExReg_decOut_isJalr; // @[ThreeCats.scala 147:30]
  wire [31:0] _wbData_T_1 = decExReg_pc + 32'h4; // @[ThreeCats.scala 148:27]
  wire [31:0] wbData = decExReg_decOut_isJal | decExReg_decOut_isJalr ? _wbData_T_1 : res; // @[ThreeCats.scala 146:10 147:57 148:12]
  wire [6:0] decOut_opcode = instrReg[6:0]; // @[Functions.scala 17:29]
  wire [2:0] decOut_func3 = instrReg[14:12]; // @[Functions.scala 18:28]
  wire  _GEN_79 = decOut_func3 == 3'h0 ? 1'h0 : 1'h1; // @[Functions.scala 31:20 84:30 87:26]
  wire  _GEN_82 = 7'h73 == decOut_opcode & _GEN_79; // @[Functions.scala 31:20 34:20]
  wire  _GEN_83 = 7'h67 == decOut_opcode | 7'h73 == decOut_opcode; // @[Functions.scala 34:20 77:26]
  wire  _GEN_85 = 7'h67 == decOut_opcode | _GEN_82; // @[Functions.scala 34:20 79:24]
  wire  _GEN_87 = 7'h67 == decOut_opcode ? 1'h0 : 7'h73 == decOut_opcode & _GEN_79; // @[Functions.scala 31:20 34:20]
  wire [2:0] _GEN_88 = 7'h6f == decOut_opcode ? 3'h5 : {{2'd0}, _GEN_83}; // @[Functions.scala 34:20 72:26]
  wire  _GEN_89 = 7'h6f == decOut_opcode | _GEN_85; // @[Functions.scala 34:20 73:24]
  wire  _GEN_91 = 7'h6f == decOut_opcode ? 1'h0 : 7'h67 == decOut_opcode; // @[Functions.scala 21:18 34:20]
  wire  _GEN_93 = 7'h6f == decOut_opcode ? 1'h0 : _GEN_87; // @[Functions.scala 31:20 34:20]
  wire [2:0] _GEN_94 = 7'h17 == decOut_opcode ? 3'h4 : _GEN_88; // @[Functions.scala 34:20 67:26]
  wire  _GEN_95 = 7'h17 == decOut_opcode | _GEN_89; // @[Functions.scala 34:20 68:24]
  wire  _GEN_97 = 7'h17 == decOut_opcode ? 1'h0 : 7'h6f == decOut_opcode; // @[Functions.scala 27:18 34:20]
  wire  _GEN_98 = 7'h17 == decOut_opcode ? 1'h0 : _GEN_91; // @[Functions.scala 21:18 34:20]
  wire  _GEN_100 = 7'h17 == decOut_opcode ? 1'h0 : _GEN_93; // @[Functions.scala 31:20 34:20]
  wire [2:0] _GEN_101 = 7'h37 == decOut_opcode ? 3'h4 : _GEN_94; // @[Functions.scala 34:20 62:26]
  wire  _GEN_102 = 7'h37 == decOut_opcode | _GEN_95; // @[Functions.scala 34:20 63:24]
  wire  _GEN_104 = 7'h37 == decOut_opcode ? 1'h0 : 7'h17 == decOut_opcode; // @[Functions.scala 23:20 34:20]
  wire  _GEN_105 = 7'h37 == decOut_opcode ? 1'h0 : _GEN_97; // @[Functions.scala 27:18 34:20]
  wire  _GEN_106 = 7'h37 == decOut_opcode ? 1'h0 : _GEN_98; // @[Functions.scala 21:18 34:20]
  wire  _GEN_108 = 7'h37 == decOut_opcode ? 1'h0 : _GEN_100; // @[Functions.scala 31:20 34:20]
  wire [2:0] _GEN_109 = 7'h23 == decOut_opcode ? 3'h2 : _GEN_101; // @[Functions.scala 34:20 58:26]
  wire  _GEN_111 = 7'h23 == decOut_opcode ? 1'h0 : _GEN_102; // @[Functions.scala 29:20 34:20]
  wire  _GEN_112 = 7'h23 == decOut_opcode ? 1'h0 : 7'h37 == decOut_opcode; // @[Functions.scala 22:18 34:20]
  wire  _GEN_113 = 7'h23 == decOut_opcode ? 1'h0 : _GEN_104; // @[Functions.scala 23:20 34:20]
  wire  _GEN_114 = 7'h23 == decOut_opcode ? 1'h0 : _GEN_105; // @[Functions.scala 27:18 34:20]
  wire  _GEN_115 = 7'h23 == decOut_opcode ? 1'h0 : _GEN_106; // @[Functions.scala 21:18 34:20]
  wire  _GEN_117 = 7'h23 == decOut_opcode ? 1'h0 : _GEN_108; // @[Functions.scala 31:20 34:20]
  wire [2:0] _GEN_118 = 7'h3 == decOut_opcode ? 3'h1 : _GEN_109; // @[Functions.scala 34:20 53:26]
  wire  _GEN_119 = 7'h3 == decOut_opcode | _GEN_111; // @[Functions.scala 34:20 54:24]
  wire  _GEN_121 = 7'h3 == decOut_opcode ? 1'h0 : 7'h23 == decOut_opcode; // @[Functions.scala 25:20 34:20]
  wire  _GEN_122 = 7'h3 == decOut_opcode ? 1'h0 : _GEN_112; // @[Functions.scala 22:18 34:20]
  wire  _GEN_123 = 7'h3 == decOut_opcode ? 1'h0 : _GEN_113; // @[Functions.scala 23:20 34:20]
  wire  _GEN_124 = 7'h3 == decOut_opcode ? 1'h0 : _GEN_114; // @[Functions.scala 27:18 34:20]
  wire  _GEN_125 = 7'h3 == decOut_opcode ? 1'h0 : _GEN_115; // @[Functions.scala 21:18 34:20]
  wire  _GEN_127 = 7'h3 == decOut_opcode ? 1'h0 : _GEN_117; // @[Functions.scala 31:20 34:20]
  wire [2:0] _GEN_128 = 7'h63 == decOut_opcode ? 3'h3 : _GEN_118; // @[Functions.scala 34:20 48:26]
  wire  _GEN_129 = 7'h63 == decOut_opcode | _GEN_125; // @[Functions.scala 34:20 49:22]
  wire  _GEN_131 = 7'h63 == decOut_opcode ? 1'h0 : _GEN_119; // @[Functions.scala 29:20 34:20]
  wire  _GEN_132 = 7'h63 == decOut_opcode ? 1'h0 : 7'h3 == decOut_opcode; // @[Functions.scala 24:19 34:20]
  wire  _GEN_133 = 7'h63 == decOut_opcode ? 1'h0 : _GEN_121; // @[Functions.scala 25:20 34:20]
  wire  _GEN_134 = 7'h63 == decOut_opcode ? 1'h0 : _GEN_122; // @[Functions.scala 22:18 34:20]
  wire  _GEN_135 = 7'h63 == decOut_opcode ? 1'h0 : _GEN_123; // @[Functions.scala 23:20 34:20]
  wire  _GEN_136 = 7'h63 == decOut_opcode ? 1'h0 : _GEN_124; // @[Functions.scala 27:18 34:20]
  wire  _GEN_137 = 7'h63 == decOut_opcode ? 1'h0 : _GEN_125; // @[Functions.scala 28:19 34:20]
  wire  _GEN_139 = 7'h63 == decOut_opcode ? 1'h0 : _GEN_127; // @[Functions.scala 31:20 34:20]
  wire [2:0] _GEN_140 = 7'h33 == decOut_opcode ? 3'h0 : _GEN_128; // @[Functions.scala 34:20 42:26]
  wire  _GEN_141 = 7'h33 == decOut_opcode | _GEN_131; // @[Functions.scala 34:20 43:24]
  wire  _GEN_143 = 7'h33 == decOut_opcode ? 1'h0 : _GEN_129; // @[Functions.scala 21:18 34:20]
  wire  _GEN_145 = 7'h33 == decOut_opcode ? 1'h0 : _GEN_132; // @[Functions.scala 24:19 34:20]
  wire  _GEN_146 = 7'h33 == decOut_opcode ? 1'h0 : _GEN_133; // @[Functions.scala 25:20 34:20]
  wire [2:0] decOut_instrType = 7'h13 == decOut_opcode ? 3'h1 : _GEN_140; // @[Functions.scala 34:20 36:26]
  wire  decOut_isImm = 7'h13 == decOut_opcode | _GEN_143; // @[Functions.scala 34:20 37:22]
  wire  decOut_rfWrite = 7'h13 == decOut_opcode | _GEN_141; // @[Functions.scala 34:20 38:24]
  wire  decOut_isLoad = 7'h13 == decOut_opcode ? 1'h0 : _GEN_145; // @[Functions.scala 24:19 34:20]
  wire  decOut_isStore = 7'h13 == decOut_opcode ? 1'h0 : _GEN_146; // @[Functions.scala 25:20 34:20]
  wire [6:0] decOut_decOut_aluOp_func7 = instrReg[31:25]; // @[Functions.scala 101:28]
  wire  _decOut_decOut_aluOp_T = 3'h0 == decOut_func3; // @[Functions.scala 104:19]
  wire  _decOut_decOut_aluOp_T_5 = decOut_opcode != 7'h13 & decOut_opcode != 7'h67 & decOut_decOut_aluOp_func7 != 7'h0; // @[Functions.scala 107:55]
  wire  _decOut_decOut_aluOp_T_6 = 3'h1 == decOut_func3; // @[Functions.scala 104:19]
  wire  _decOut_decOut_aluOp_T_7 = 3'h2 == decOut_func3; // @[Functions.scala 104:19]
  wire [2:0] _GEN_168 = decOut_decOut_aluOp_func7 == 7'h0 ? 3'h6 : 3'h7; // @[Functions.scala 124:29 125:17 127:17]
  wire [3:0] _GEN_169 = 3'h7 == decOut_func3 ? 4'h9 : 4'h0; // @[Functions.scala 104:19 134:15 103:28]
  wire [3:0] _GEN_170 = 3'h6 == decOut_func3 ? 4'h8 : _GEN_169; // @[Functions.scala 104:19 131:15]
  wire [3:0] _GEN_171 = 3'h5 == decOut_func3 ? {{1'd0}, _GEN_168} : _GEN_170; // @[Functions.scala 104:19]
  wire [3:0] _GEN_172 = 3'h4 == decOut_func3 ? 4'h5 : _GEN_171; // @[Functions.scala 104:19 121:15]
  wire [3:0] _GEN_173 = 3'h3 == decOut_func3 ? 4'h4 : _GEN_172; // @[Functions.scala 104:19 118:15]
  wire [3:0] _GEN_174 = 3'h2 == decOut_func3 ? 4'h3 : _GEN_173; // @[Functions.scala 104:19 115:15]
  wire [11:0] _decOut_decOut_imm_imm_T_1 = instrReg[31:20]; // @[Functions.scala 169:32]
  wire [19:0] _decOut_decOut_imm_imm_T_4 = instrReg[31] ? 20'hfffff : 20'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _decOut_decOut_imm_imm_T_7 = {_decOut_decOut_imm_imm_T_4,instrReg[31:20]}; // @[Functions.scala 172:67]
  wire [31:0] _decOut_decOut_imm_imm_T_15 = {_decOut_decOut_imm_imm_T_4,decOut_decOut_aluOp_func7,instrReg[11:7]}; // @[Functions.scala 175:89]
  wire [18:0] _decOut_decOut_imm_imm_T_18 = instrReg[31] ? 19'h7ffff : 19'h0; // @[Bitwise.scala 77:12]
  wire [30:0] _decOut_decOut_imm_imm_T_26 = {_decOut_decOut_imm_imm_T_18,instrReg[7],instrReg[30:25],instrReg[11:8],1'h0
    }; // @[Functions.scala 178:119]
  wire [31:0] _decOut_decOut_imm_imm_T_30 = {instrReg[31:12],12'h0}; // @[Functions.scala 181:55]
  wire [10:0] _decOut_decOut_imm_imm_T_33 = instrReg[31] ? 11'h7ff : 11'h0; // @[Bitwise.scala 77:12]
  wire [30:0] _decOut_decOut_imm_imm_T_41 = {_decOut_decOut_imm_imm_T_33,instrReg[19:12],instrReg[20],instrReg[30:21],1'h0
    }; // @[Functions.scala 184:121]
  wire [30:0] _GEN_177 = 3'h5 == decOut_instrType ? $signed(_decOut_decOut_imm_imm_T_41) : $signed({{19{
    _decOut_decOut_imm_imm_T_1[11]}},_decOut_decOut_imm_imm_T_1}); // @[Functions.scala 170:23 184:13 169:9]
  wire [31:0] _GEN_178 = 3'h4 == decOut_instrType ? $signed(_decOut_decOut_imm_imm_T_30) : $signed({{1{_GEN_177[30]}},
    _GEN_177}); // @[Functions.scala 170:23 181:13]
  wire [31:0] _GEN_179 = 3'h3 == decOut_instrType ? $signed({{1{_decOut_decOut_imm_imm_T_26[30]}},
    _decOut_decOut_imm_imm_T_26}) : $signed(_GEN_178); // @[Functions.scala 170:23 178:13]
  wire [31:0] _GEN_180 = 3'h2 == decOut_instrType ? $signed(_decOut_decOut_imm_imm_T_15) : $signed(_GEN_179); // @[Functions.scala 170:23 175:13]
  wire [31:0] decOut_decOut_imm_imm = 3'h1 == decOut_instrType ? $signed(_decOut_decOut_imm_imm_T_7) : $signed(_GEN_180)
    ; // @[Functions.scala 170:23 172:13]
  wire [4:0] decEx_rs1 = instrReg[19:15]; // @[ThreeCats.scala 92:24]
  wire [4:0] decEx_rs2 = instrReg[24:20]; // @[ThreeCats.scala 93:24]
  wire [31:0] data = _T_1 & decExReg_rd == decEx_rs2 ? wbData : rs2Val; // @[ThreeCats.scala 102:17]
  wire [31:0] _memAddress_T = _T_1 & decExReg_rd == decEx_rs1 ? wbData : rs1Val; // @[ThreeCats.scala 104:29]
  wire [31:0] memAddress = $signed(_memAddress_T) + $signed(decOut_decOut_imm_imm); // @[ThreeCats.scala 104:50]
  wire [1:0] decEx_memLow = memAddress[1:0]; // @[ThreeCats.scala 105:29]
  wire [31:0] _wrData_T_6 = {data[7:0],data[7:0],data[7:0],data[7:0]}; // @[Functions.scala 320:58]
  wire  _GEN_183 = 2'h0 == decEx_memLow; // @[Functions.scala 321:{26,26} 317:27]
  wire  _GEN_184 = 2'h1 == decEx_memLow; // @[Functions.scala 321:{26,26} 317:27]
  wire  _GEN_185 = 2'h2 == decEx_memLow; // @[Functions.scala 321:{26,26} 317:27]
  wire  _GEN_186 = 2'h3 == decEx_memLow; // @[Functions.scala 321:{26,26} 317:27]
  wire [31:0] _wrData_T_9 = {data[15:0],data[15:0]}; // @[Functions.scala 324:31]
  wire  _GEN_189 = _GEN_183 ? 1'h0 : _GEN_185; // @[Functions.scala 325:24 317:27]
  wire [31:0] _GEN_194 = _decOut_decOut_aluOp_T_6 ? _wrData_T_9 : data; // @[Functions.scala 318:19 324:16 316:29]
  wire  _GEN_195 = _decOut_decOut_aluOp_T_6 ? _GEN_183 : _decOut_decOut_aluOp_T_7; // @[Functions.scala 318:19]
  wire  _GEN_197 = _decOut_decOut_aluOp_T_6 ? _GEN_189 : _decOut_decOut_aluOp_T_7; // @[Functions.scala 318:19]
  wire [31:0] wrd = _decOut_decOut_aluOp_T ? _wrData_T_6 : _GEN_194; // @[Functions.scala 318:19 320:16]
  wire  wre_0 = _decOut_decOut_aluOp_T ? _GEN_183 : _GEN_195; // @[Functions.scala 318:19]
  wire  wre_1 = _decOut_decOut_aluOp_T ? _GEN_184 : _GEN_195; // @[Functions.scala 318:19]
  wire  wre_2 = _decOut_decOut_aluOp_T ? _GEN_185 : _GEN_197; // @[Functions.scala 318:19]
  wire  wre_3 = _decOut_decOut_aluOp_T ? _GEN_186 : _GEN_197; // @[Functions.scala 318:19]
  wire [31:0] decEx_csrVal = csr_io_data; // @[ThreeCats.scala 76:19 97:16]
  wire  _GEN_351 = firstIter ? 1'h0 : firstIter; // @[ThreeCats.scala 173:19 174:15 47:26]
  Csr csr ( // @[ThreeCats.scala 70:19]
    .io_address(csr_io_address),
    .io_data(csr_io_data)
  );
  assign regs_rs1Val_MPORT_en = regs_rs1Val_MPORT_en_pipe_0;
  assign regs_rs1Val_MPORT_addr = regs_rs1Val_MPORT_addr_pipe_0;
  assign regs_rs1Val_MPORT_data = regs[regs_rs1Val_MPORT_addr]; // @[Functions.scala 194:29]
  assign regs_rs2Val_MPORT_en = regs_rs2Val_MPORT_en_pipe_0;
  assign regs_rs2Val_MPORT_addr = regs_rs2Val_MPORT_addr_pipe_0;
  assign regs_rs2Val_MPORT_data = regs[regs_rs2Val_MPORT_addr]; // @[Functions.scala 194:29]
  assign regs_MPORT_data = _T_12 ? _wbData_T_1 : res;
  assign regs_MPORT_addr = decExReg_rd;
  assign regs_MPORT_mask = 1'h1;
  assign regs_MPORT_en = wrEna & _T;
  assign io_imem_address = doBranch ? branchTarget : _pcNext_T_1; // @[ThreeCats.scala 46:31]
  assign io_dmem_rdAddress = $signed(_memAddress_T) + $signed(decOut_decOut_imm_imm); // @[ThreeCats.scala 104:50]
  assign io_dmem_rdEnable = decOut_isLoad & _T_13; // @[ThreeCats.scala 112:22]
  assign io_dmem_wrAddress = $signed(_memAddress_T) + $signed(decOut_decOut_imm_imm); // @[ThreeCats.scala 104:50]
  assign io_dmem_wrData = decOut_isStore & _T_13 ? wrd : data; // @[ThreeCats.scala 110:18 115:37 117:20]
  assign io_dmem_wrEnable_0 = decOut_isStore & _T_13 & wre_0; // @[ThreeCats.scala 111:20 115:37 118:22]
  assign io_dmem_wrEnable_1 = decOut_isStore & _T_13 & wre_1; // @[ThreeCats.scala 111:20 115:37 118:22]
  assign io_dmem_wrEnable_2 = decOut_isStore & _T_13 & wre_2; // @[ThreeCats.scala 111:20 115:37 118:22]
  assign io_dmem_wrEnable_3 = decOut_isStore & _T_13 & wre_3; // @[ThreeCats.scala 111:20 115:37 118:22]
  assign csr_io_address = instrReg[31:20]; // @[ThreeCats.scala 71:29]
  always @(posedge clock) begin
    if (regs_MPORT_en & regs_MPORT_mask) begin
      regs[regs_MPORT_addr] <= regs_MPORT_data; // @[Functions.scala 194:29]
    end
    regs_rs1Val_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      regs_rs1Val_MPORT_addr_pipe_0 <= instr[19:15];
    end
    regs_rs2Val_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      regs_rs2Val_MPORT_addr_pipe_0 <= instr[24:20];
    end
    if (reset) begin // @[ThreeCats.scala 40:25]
      exFwdReg_valid <= 1'h0; // @[ThreeCats.scala 40:25]
    end else begin
      exFwdReg_valid <= _T_1; // @[ThreeCats.scala 165:18]
    end
    if (reset) begin // @[ThreeCats.scala 40:25]
      exFwdReg_wbDest <= 5'h0; // @[ThreeCats.scala 40:25]
    end else begin
      exFwdReg_wbDest <= decExReg_rd; // @[ThreeCats.scala 166:19]
    end
    if (reset) begin // @[ThreeCats.scala 40:25]
      exFwdReg_wbData <= 32'h0; // @[ThreeCats.scala 40:25]
    end else if (decExReg_decOut_isJal | decExReg_decOut_isJalr) begin // @[ThreeCats.scala 147:57]
      exFwdReg_wbData <= _wbData_T_1; // @[ThreeCats.scala 148:12]
    end else if (decExReg_decOut_isLoad & ~doBranch) begin // @[ThreeCats.scala 159:45]
      if (_doBranch_T) begin // @[Functions.scala 257:19]
        exFwdReg_wbData <= _GEN_337;
      end else begin
        exFwdReg_wbData <= _GEN_348;
      end
    end else if (decExReg_decOut_isCssrw) begin // @[ThreeCats.scala 141:33]
      exFwdReg_wbData <= decExReg_csrVal; // @[ThreeCats.scala 142:9]
    end else begin
      exFwdReg_wbData <= _GEN_324;
    end
    if (reset) begin // @[ThreeCats.scala 45:22]
      pcReg <= 32'hfffffffc; // @[ThreeCats.scala 45:22]
    end else if (doBranch) begin // @[ThreeCats.scala 46:31]
      if (decExReg_decOut_isJalr) begin // @[ThreeCats.scala 152:32]
        if (decExReg_decOut_isLoad & ~doBranch) begin // @[ThreeCats.scala 159:45]
          pcReg <= res_res_1; // @[ThreeCats.scala 160:9]
        end else begin
          pcReg <= _GEN_325;
        end
      end else begin
        pcReg <= _res_T_15; // @[ThreeCats.scala 151:16]
      end
    end else begin
      pcReg <= _pcNext_T_1;
    end
    if (reset) begin // @[ThreeCats.scala 125:25]
      decExReg_func3 <= 3'h0; // @[ThreeCats.scala 125:25]
    end else if (doBranch) begin // @[ThreeCats.scala 126:18]
      decExReg_func3 <= 3'h0;
    end else begin
      decExReg_func3 <= decOut_func3;
    end
    if (reset) begin // @[ThreeCats.scala 125:25]
      decExReg_rs1 <= 5'h0; // @[ThreeCats.scala 125:25]
    end else if (doBranch) begin // @[ThreeCats.scala 126:18]
      decExReg_rs1 <= 5'h0;
    end else begin
      decExReg_rs1 <= decEx_rs1;
    end
    if (reset) begin // @[ThreeCats.scala 125:25]
      decExReg_rs1Val <= 32'h0; // @[ThreeCats.scala 125:25]
    end else if (doBranch) begin // @[ThreeCats.scala 126:18]
      decExReg_rs1Val <= 32'h0;
    end else if (rs1Val_REG == 5'h0) begin // @[Functions.scala 196:23]
      decExReg_rs1Val <= 32'h0;
    end else begin
      decExReg_rs1Val <= regs_rs1Val_MPORT_data;
    end
    if (reset) begin // @[ThreeCats.scala 125:25]
      decExReg_rs2 <= 5'h0; // @[ThreeCats.scala 125:25]
    end else if (doBranch) begin // @[ThreeCats.scala 126:18]
      decExReg_rs2 <= 5'h0;
    end else begin
      decExReg_rs2 <= decEx_rs2;
    end
    if (reset) begin // @[ThreeCats.scala 125:25]
      decExReg_rs2Val <= 32'h0; // @[ThreeCats.scala 125:25]
    end else if (doBranch) begin // @[ThreeCats.scala 126:18]
      decExReg_rs2Val <= 32'h0;
    end else if (rs2Val_REG == 5'h0) begin // @[Functions.scala 197:23]
      decExReg_rs2Val <= 32'h0;
    end else begin
      decExReg_rs2Val <= regs_rs2Val_MPORT_data;
    end
    if (reset) begin // @[ThreeCats.scala 125:25]
      decExReg_decOut_isBranch <= 1'h0; // @[ThreeCats.scala 125:25]
    end else if (doBranch) begin // @[ThreeCats.scala 126:18]
      decExReg_decOut_isBranch <= 1'h0;
    end else if (7'h13 == decOut_opcode) begin // @[Functions.scala 34:20]
      decExReg_decOut_isBranch <= 1'h0; // @[Functions.scala 26:21]
    end else if (7'h33 == decOut_opcode) begin // @[Functions.scala 34:20]
      decExReg_decOut_isBranch <= 1'h0; // @[Functions.scala 26:21]
    end else begin
      decExReg_decOut_isBranch <= 7'h63 == decOut_opcode;
    end
    if (reset) begin // @[ThreeCats.scala 125:25]
      decExReg_decOut_isJal <= 1'h0; // @[ThreeCats.scala 125:25]
    end else if (doBranch) begin // @[ThreeCats.scala 126:18]
      decExReg_decOut_isJal <= 1'h0;
    end else if (7'h13 == decOut_opcode) begin // @[Functions.scala 34:20]
      decExReg_decOut_isJal <= 1'h0; // @[Functions.scala 27:18]
    end else if (7'h33 == decOut_opcode) begin // @[Functions.scala 34:20]
      decExReg_decOut_isJal <= 1'h0; // @[Functions.scala 27:18]
    end else begin
      decExReg_decOut_isJal <= _GEN_136;
    end
    if (reset) begin // @[ThreeCats.scala 125:25]
      decExReg_decOut_isJalr <= 1'h0; // @[ThreeCats.scala 125:25]
    end else if (doBranch) begin // @[ThreeCats.scala 126:18]
      decExReg_decOut_isJalr <= 1'h0;
    end else if (7'h13 == decOut_opcode) begin // @[Functions.scala 34:20]
      decExReg_decOut_isJalr <= 1'h0; // @[Functions.scala 28:19]
    end else if (7'h33 == decOut_opcode) begin // @[Functions.scala 34:20]
      decExReg_decOut_isJalr <= 1'h0; // @[Functions.scala 28:19]
    end else begin
      decExReg_decOut_isJalr <= _GEN_137;
    end
    if (reset) begin // @[ThreeCats.scala 125:25]
      decExReg_valid <= 1'h0; // @[ThreeCats.scala 125:25]
    end else if (doBranch) begin // @[ThreeCats.scala 126:18]
      decExReg_valid <= 1'h0;
    end else begin
      decExReg_valid <= _T_13;
    end
    if (reset) begin // @[ThreeCats.scala 125:25]
      decExReg_decOut_isLoad <= 1'h0; // @[ThreeCats.scala 125:25]
    end else if (doBranch) begin // @[ThreeCats.scala 126:18]
      decExReg_decOut_isLoad <= 1'h0;
    end else if (7'h13 == decOut_opcode) begin // @[Functions.scala 34:20]
      decExReg_decOut_isLoad <= 1'h0; // @[Functions.scala 24:19]
    end else if (7'h33 == decOut_opcode) begin // @[Functions.scala 34:20]
      decExReg_decOut_isLoad <= 1'h0; // @[Functions.scala 24:19]
    end else begin
      decExReg_decOut_isLoad <= _GEN_132;
    end
    if (reset) begin // @[ThreeCats.scala 125:25]
      decExReg_memLow <= 2'h0; // @[ThreeCats.scala 125:25]
    end else if (doBranch) begin // @[ThreeCats.scala 126:18]
      decExReg_memLow <= 2'h0;
    end else begin
      decExReg_memLow <= decEx_memLow;
    end
    if (reset) begin // @[ThreeCats.scala 125:25]
      decExReg_decOut_isCssrw <= 1'h0; // @[ThreeCats.scala 125:25]
    end else if (doBranch) begin // @[ThreeCats.scala 126:18]
      decExReg_decOut_isCssrw <= 1'h0;
    end else if (7'h13 == decOut_opcode) begin // @[Functions.scala 34:20]
      decExReg_decOut_isCssrw <= 1'h0; // @[Functions.scala 31:20]
    end else if (7'h33 == decOut_opcode) begin // @[Functions.scala 34:20]
      decExReg_decOut_isCssrw <= 1'h0; // @[Functions.scala 31:20]
    end else begin
      decExReg_decOut_isCssrw <= _GEN_139;
    end
    if (reset) begin // @[ThreeCats.scala 125:25]
      decExReg_csrVal <= 32'h0; // @[ThreeCats.scala 125:25]
    end else if (doBranch) begin // @[ThreeCats.scala 126:18]
      decExReg_csrVal <= 32'h0;
    end else begin
      decExReg_csrVal <= decEx_csrVal;
    end
    if (reset) begin // @[ThreeCats.scala 125:25]
      decExReg_decOut_isAuiPc <= 1'h0; // @[ThreeCats.scala 125:25]
    end else if (doBranch) begin // @[ThreeCats.scala 126:18]
      decExReg_decOut_isAuiPc <= 1'h0;
    end else if (7'h13 == decOut_opcode) begin // @[Functions.scala 34:20]
      decExReg_decOut_isAuiPc <= 1'h0; // @[Functions.scala 23:20]
    end else if (7'h33 == decOut_opcode) begin // @[Functions.scala 34:20]
      decExReg_decOut_isAuiPc <= 1'h0; // @[Functions.scala 23:20]
    end else begin
      decExReg_decOut_isAuiPc <= _GEN_135;
    end
    if (reset) begin // @[ThreeCats.scala 125:25]
      decExReg_pc <= 32'h0; // @[ThreeCats.scala 125:25]
    end else if (doBranch) begin // @[ThreeCats.scala 126:18]
      decExReg_pc <= 32'h0;
    end else begin
      decExReg_pc <= pcRegReg;
    end
    if (reset) begin // @[ThreeCats.scala 125:25]
      decExReg_decOut_imm <= 32'sh0; // @[ThreeCats.scala 125:25]
    end else if (doBranch) begin // @[ThreeCats.scala 126:18]
      decExReg_decOut_imm <= 32'sh0;
    end else if (3'h1 == decOut_instrType) begin // @[Functions.scala 170:23]
      decExReg_decOut_imm <= _decOut_decOut_imm_imm_T_7; // @[Functions.scala 172:13]
    end else if (3'h2 == decOut_instrType) begin // @[Functions.scala 170:23]
      decExReg_decOut_imm <= _decOut_decOut_imm_imm_T_15; // @[Functions.scala 175:13]
    end else begin
      decExReg_decOut_imm <= _GEN_179;
    end
    if (reset) begin // @[ThreeCats.scala 125:25]
      decExReg_decOut_isLui <= 1'h0; // @[ThreeCats.scala 125:25]
    end else if (doBranch) begin // @[ThreeCats.scala 126:18]
      decExReg_decOut_isLui <= 1'h0;
    end else if (7'h13 == decOut_opcode) begin // @[Functions.scala 34:20]
      decExReg_decOut_isLui <= 1'h0; // @[Functions.scala 22:18]
    end else if (7'h33 == decOut_opcode) begin // @[Functions.scala 34:20]
      decExReg_decOut_isLui <= 1'h0; // @[Functions.scala 22:18]
    end else begin
      decExReg_decOut_isLui <= _GEN_134;
    end
    if (reset) begin // @[ThreeCats.scala 125:25]
      decExReg_decOut_aluOp <= 4'h0; // @[ThreeCats.scala 125:25]
    end else if (doBranch) begin // @[ThreeCats.scala 126:18]
      decExReg_decOut_aluOp <= 4'h0;
    end else if (3'h0 == decOut_func3) begin // @[Functions.scala 104:19]
      decExReg_decOut_aluOp <= {{3'd0}, _decOut_decOut_aluOp_T_5};
    end else if (3'h1 == decOut_func3) begin // @[Functions.scala 104:19]
      decExReg_decOut_aluOp <= 4'h2; // @[Functions.scala 112:15]
    end else begin
      decExReg_decOut_aluOp <= _GEN_174;
    end
    decExReg_decOut_isImm <= reset | (doBranch | decOut_isImm); // @[ThreeCats.scala 125:{25,25} 126:12]
    firstIter <= reset | _GEN_351; // @[ThreeCats.scala 47:{26,26}]
    pcRegReg <= pcReg; // @[ThreeCats.scala 62:25]
    if (reset) begin // @[ThreeCats.scala 63:25]
      instrReg <= 32'h13; // @[ThreeCats.scala 63:25]
    end else if (doBranch) begin // @[ThreeCats.scala 64:18]
      instrReg <= 32'h13;
    end else if (firstIter) begin // @[ThreeCats.scala 53:19]
      instrReg <= 32'h13; // @[ThreeCats.scala 54:11]
    end else begin
      instrReg <= io_imem_data; // @[ThreeCats.scala 52:26]
    end
    rs1Val_REG <= instr[19:15]; // @[ThreeCats.scala 65:18]
    rs2Val_REG <= instr[24:20]; // @[ThreeCats.scala 66:18]
    if (reset) begin // @[ThreeCats.scala 125:25]
      decExReg_rd <= 5'h0; // @[ThreeCats.scala 125:25]
    end else if (doBranch) begin // @[ThreeCats.scala 126:18]
      decExReg_rd <= 5'h0;
    end else begin
      decExReg_rd <= instrReg[11:7];
    end
    decExReg_decOut_rfWrite <= reset | (doBranch | decOut_rfWrite); // @[ThreeCats.scala 125:{25,25} 126:12]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    regs[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  regs_rs1Val_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  regs_rs1Val_MPORT_addr_pipe_0 = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  regs_rs2Val_MPORT_en_pipe_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  regs_rs2Val_MPORT_addr_pipe_0 = _RAND_4[4:0];
  _RAND_5 = {1{`RANDOM}};
  exFwdReg_valid = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  exFwdReg_wbDest = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  exFwdReg_wbData = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  pcReg = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  decExReg_func3 = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  decExReg_rs1 = _RAND_10[4:0];
  _RAND_11 = {1{`RANDOM}};
  decExReg_rs1Val = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  decExReg_rs2 = _RAND_12[4:0];
  _RAND_13 = {1{`RANDOM}};
  decExReg_rs2Val = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  decExReg_decOut_isBranch = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  decExReg_decOut_isJal = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  decExReg_decOut_isJalr = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  decExReg_valid = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  decExReg_decOut_isLoad = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  decExReg_memLow = _RAND_19[1:0];
  _RAND_20 = {1{`RANDOM}};
  decExReg_decOut_isCssrw = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  decExReg_csrVal = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  decExReg_decOut_isAuiPc = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  decExReg_pc = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  decExReg_decOut_imm = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  decExReg_decOut_isLui = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  decExReg_decOut_aluOp = _RAND_26[3:0];
  _RAND_27 = {1{`RANDOM}};
  decExReg_decOut_isImm = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  firstIter = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  pcRegReg = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  instrReg = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  rs1Val_REG = _RAND_31[4:0];
  _RAND_32 = {1{`RANDOM}};
  rs2Val_REG = _RAND_32[4:0];
  _RAND_33 = {1{`RANDOM}};
  decExReg_rd = _RAND_33[4:0];
  _RAND_34 = {1{`RANDOM}};
  decExReg_decOut_rfWrite = _RAND_34[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ScratchPadMem(
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
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] MEM [0:1023]; // @[ScratchPadMem.scala 14:16]
  wire  MEM_io_rdData_MPORT_3_en; // @[ScratchPadMem.scala 14:16]
  wire [9:0] MEM_io_rdData_MPORT_3_addr; // @[ScratchPadMem.scala 14:16]
  wire [7:0] MEM_io_rdData_MPORT_3_data; // @[ScratchPadMem.scala 14:16]
  wire [7:0] MEM_MPORT_data; // @[ScratchPadMem.scala 14:16]
  wire [9:0] MEM_MPORT_addr; // @[ScratchPadMem.scala 14:16]
  wire  MEM_MPORT_mask; // @[ScratchPadMem.scala 14:16]
  wire  MEM_MPORT_en; // @[ScratchPadMem.scala 14:16]
  reg  MEM_io_rdData_MPORT_3_en_pipe_0;
  reg [9:0] MEM_io_rdData_MPORT_3_addr_pipe_0;
  reg [7:0] MEM_1 [0:1023]; // @[ScratchPadMem.scala 15:16]
  wire  MEM_1_io_rdData_MPORT_2_en; // @[ScratchPadMem.scala 15:16]
  wire [9:0] MEM_1_io_rdData_MPORT_2_addr; // @[ScratchPadMem.scala 15:16]
  wire [7:0] MEM_1_io_rdData_MPORT_2_data; // @[ScratchPadMem.scala 15:16]
  wire [7:0] MEM_1_MPORT_1_data; // @[ScratchPadMem.scala 15:16]
  wire [9:0] MEM_1_MPORT_1_addr; // @[ScratchPadMem.scala 15:16]
  wire  MEM_1_MPORT_1_mask; // @[ScratchPadMem.scala 15:16]
  wire  MEM_1_MPORT_1_en; // @[ScratchPadMem.scala 15:16]
  reg  MEM_1_io_rdData_MPORT_2_en_pipe_0;
  reg [9:0] MEM_1_io_rdData_MPORT_2_addr_pipe_0;
  reg [7:0] MEM_2 [0:1023]; // @[ScratchPadMem.scala 16:16]
  wire  MEM_2_io_rdData_MPORT_1_en; // @[ScratchPadMem.scala 16:16]
  wire [9:0] MEM_2_io_rdData_MPORT_1_addr; // @[ScratchPadMem.scala 16:16]
  wire [7:0] MEM_2_io_rdData_MPORT_1_data; // @[ScratchPadMem.scala 16:16]
  wire [7:0] MEM_2_MPORT_2_data; // @[ScratchPadMem.scala 16:16]
  wire [9:0] MEM_2_MPORT_2_addr; // @[ScratchPadMem.scala 16:16]
  wire  MEM_2_MPORT_2_mask; // @[ScratchPadMem.scala 16:16]
  wire  MEM_2_MPORT_2_en; // @[ScratchPadMem.scala 16:16]
  reg  MEM_2_io_rdData_MPORT_1_en_pipe_0;
  reg [9:0] MEM_2_io_rdData_MPORT_1_addr_pipe_0;
  reg [7:0] MEM_3 [0:1023]; // @[ScratchPadMem.scala 17:16]
  wire  MEM_3_io_rdData_MPORT_en; // @[ScratchPadMem.scala 17:16]
  wire [9:0] MEM_3_io_rdData_MPORT_addr; // @[ScratchPadMem.scala 17:16]
  wire [7:0] MEM_3_io_rdData_MPORT_data; // @[ScratchPadMem.scala 17:16]
  wire [7:0] MEM_3_MPORT_3_data; // @[ScratchPadMem.scala 17:16]
  wire [9:0] MEM_3_MPORT_3_addr; // @[ScratchPadMem.scala 17:16]
  wire  MEM_3_MPORT_3_mask; // @[ScratchPadMem.scala 17:16]
  wire  MEM_3_MPORT_3_en; // @[ScratchPadMem.scala 17:16]
  reg  MEM_3_io_rdData_MPORT_en_pipe_0;
  reg [9:0] MEM_3_io_rdData_MPORT_addr_pipe_0;
  wire [23:0] _io_rdData_T_10 = {MEM_3_io_rdData_MPORT_data,MEM_2_io_rdData_MPORT_1_data,MEM_1_io_rdData_MPORT_2_data}; // @[ScratchPadMem.scala 57:93]
  assign MEM_io_rdData_MPORT_3_en = MEM_io_rdData_MPORT_3_en_pipe_0;
  assign MEM_io_rdData_MPORT_3_addr = MEM_io_rdData_MPORT_3_addr_pipe_0;
  assign MEM_io_rdData_MPORT_3_data = MEM[MEM_io_rdData_MPORT_3_addr]; // @[ScratchPadMem.scala 14:16]
  assign MEM_MPORT_data = io_wrData[7:0];
  assign MEM_MPORT_addr = io_wrAddress[11:2];
  assign MEM_MPORT_mask = 1'h1;
  assign MEM_MPORT_en = io_wrEnable_0;
  assign MEM_1_io_rdData_MPORT_2_en = MEM_1_io_rdData_MPORT_2_en_pipe_0;
  assign MEM_1_io_rdData_MPORT_2_addr = MEM_1_io_rdData_MPORT_2_addr_pipe_0;
  assign MEM_1_io_rdData_MPORT_2_data = MEM_1[MEM_1_io_rdData_MPORT_2_addr]; // @[ScratchPadMem.scala 15:16]
  assign MEM_1_MPORT_1_data = io_wrData[15:8];
  assign MEM_1_MPORT_1_addr = io_wrAddress[11:2];
  assign MEM_1_MPORT_1_mask = 1'h1;
  assign MEM_1_MPORT_1_en = io_wrEnable_1;
  assign MEM_2_io_rdData_MPORT_1_en = MEM_2_io_rdData_MPORT_1_en_pipe_0;
  assign MEM_2_io_rdData_MPORT_1_addr = MEM_2_io_rdData_MPORT_1_addr_pipe_0;
  assign MEM_2_io_rdData_MPORT_1_data = MEM_2[MEM_2_io_rdData_MPORT_1_addr]; // @[ScratchPadMem.scala 16:16]
  assign MEM_2_MPORT_2_data = io_wrData[23:16];
  assign MEM_2_MPORT_2_addr = io_wrAddress[11:2];
  assign MEM_2_MPORT_2_mask = 1'h1;
  assign MEM_2_MPORT_2_en = io_wrEnable_2;
  assign MEM_3_io_rdData_MPORT_en = MEM_3_io_rdData_MPORT_en_pipe_0;
  assign MEM_3_io_rdData_MPORT_addr = MEM_3_io_rdData_MPORT_addr_pipe_0;
  assign MEM_3_io_rdData_MPORT_data = MEM_3[MEM_3_io_rdData_MPORT_addr]; // @[ScratchPadMem.scala 17:16]
  assign MEM_3_MPORT_3_data = io_wrData[31:24];
  assign MEM_3_MPORT_3_addr = io_wrAddress[11:2];
  assign MEM_3_MPORT_3_mask = 1'h1;
  assign MEM_3_MPORT_3_en = io_wrEnable_3;
  assign io_rdData = {_io_rdData_T_10,MEM_io_rdData_MPORT_3_data}; // @[ScratchPadMem.scala 57:133]
  always @(posedge clock) begin
    if (MEM_MPORT_en & MEM_MPORT_mask) begin
      MEM[MEM_MPORT_addr] <= MEM_MPORT_data; // @[ScratchPadMem.scala 14:16]
    end
    MEM_io_rdData_MPORT_3_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      MEM_io_rdData_MPORT_3_addr_pipe_0 <= io_rdAddress[11:2];
    end
    if (MEM_1_MPORT_1_en & MEM_1_MPORT_1_mask) begin
      MEM_1[MEM_1_MPORT_1_addr] <= MEM_1_MPORT_1_data; // @[ScratchPadMem.scala 15:16]
    end
    MEM_1_io_rdData_MPORT_2_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      MEM_1_io_rdData_MPORT_2_addr_pipe_0 <= io_rdAddress[11:2];
    end
    if (MEM_2_MPORT_2_en & MEM_2_MPORT_2_mask) begin
      MEM_2[MEM_2_MPORT_2_addr] <= MEM_2_MPORT_2_data; // @[ScratchPadMem.scala 16:16]
    end
    MEM_2_io_rdData_MPORT_1_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      MEM_2_io_rdData_MPORT_1_addr_pipe_0 <= io_rdAddress[11:2];
    end
    if (MEM_3_MPORT_3_en & MEM_3_MPORT_3_mask) begin
      MEM_3[MEM_3_MPORT_3_addr] <= MEM_3_MPORT_3_data; // @[ScratchPadMem.scala 17:16]
    end
    MEM_3_io_rdData_MPORT_en_pipe_0 <= 1'h1;
    if (1'h1) begin
      MEM_3_io_rdData_MPORT_addr_pipe_0 <= io_rdAddress[11:2];
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    MEM[initvar] = _RAND_0[7:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    MEM_1[initvar] = _RAND_3[7:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    MEM_2[initvar] = _RAND_6[7:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    MEM_3[initvar] = _RAND_9[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  MEM_io_rdData_MPORT_3_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  MEM_io_rdData_MPORT_3_addr_pipe_0 = _RAND_2[9:0];
  _RAND_4 = {1{`RANDOM}};
  MEM_1_io_rdData_MPORT_2_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  MEM_1_io_rdData_MPORT_2_addr_pipe_0 = _RAND_5[9:0];
  _RAND_7 = {1{`RANDOM}};
  MEM_2_io_rdData_MPORT_1_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  MEM_2_io_rdData_MPORT_1_addr_pipe_0 = _RAND_8[9:0];
  _RAND_10 = {1{`RANDOM}};
  MEM_3_io_rdData_MPORT_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  MEM_3_io_rdData_MPORT_addr_pipe_0 = _RAND_11[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module InstructionROM(
  input         clock,
  input         reset,
  input  [31:0] io_address,
  output [31:0] io_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] addrReg; // @[InstructionROM.scala 11:24]
  wire [31:0] _GEN_1 = 5'h1 == addrReg[6:2] ? 32'h4800593 : 32'hf0000537; // @[InstructionROM.scala 14:{11,11}]
  wire [31:0] _GEN_2 = 5'h2 == addrReg[6:2] ? 32'h6500613 : _GEN_1; // @[InstructionROM.scala 14:{11,11}]
  wire [31:0] _GEN_3 = 5'h3 == addrReg[6:2] ? 32'h6c00693 : _GEN_2; // @[InstructionROM.scala 14:{11,11}]
  wire [31:0] _GEN_4 = 5'h4 == addrReg[6:2] ? 32'hb52223 : _GEN_3; // @[InstructionROM.scala 14:{11,11}]
  wire [31:0] _GEN_5 = 5'h5 == addrReg[6:2] ? 32'h6f00593 : _GEN_4; // @[InstructionROM.scala 14:{11,11}]
  wire [31:0] _GEN_6 = 5'h6 == addrReg[6:2] ? 32'hc52223 : _GEN_5; // @[InstructionROM.scala 14:{11,11}]
  wire [31:0] _GEN_7 = 5'h7 == addrReg[6:2] ? 32'h2000613 : _GEN_6; // @[InstructionROM.scala 14:{11,11}]
  wire [31:0] _GEN_8 = 5'h8 == addrReg[6:2] ? 32'hd52223 : _GEN_7; // @[InstructionROM.scala 14:{11,11}]
  wire [31:0] _GEN_9 = 5'h9 == addrReg[6:2] ? 32'hd52223 : _GEN_8; // @[InstructionROM.scala 14:{11,11}]
  wire [31:0] _GEN_10 = 5'ha == addrReg[6:2] ? 32'hb52223 : _GEN_9; // @[InstructionROM.scala 14:{11,11}]
  wire [31:0] _GEN_11 = 5'hb == addrReg[6:2] ? 32'hc52223 : _GEN_10; // @[InstructionROM.scala 14:{11,11}]
  wire [31:0] _GEN_12 = 5'hc == addrReg[6:2] ? 32'h5700613 : _GEN_11; // @[InstructionROM.scala 14:{11,11}]
  wire [31:0] _GEN_13 = 5'hd == addrReg[6:2] ? 32'hc52223 : _GEN_12; // @[InstructionROM.scala 14:{11,11}]
  wire [31:0] _GEN_14 = 5'he == addrReg[6:2] ? 32'h7200613 : _GEN_13; // @[InstructionROM.scala 14:{11,11}]
  wire [31:0] _GEN_15 = 5'hf == addrReg[6:2] ? 32'hb52223 : _GEN_14; // @[InstructionROM.scala 14:{11,11}]
  wire [31:0] _GEN_16 = 5'h10 == addrReg[6:2] ? 32'h6400593 : _GEN_15; // @[InstructionROM.scala 14:{11,11}]
  wire [31:0] _GEN_17 = 5'h11 == addrReg[6:2] ? 32'hc52223 : _GEN_16; // @[InstructionROM.scala 14:{11,11}]
  wire [31:0] _GEN_18 = 5'h12 == addrReg[6:2] ? 32'h2100613 : _GEN_17; // @[InstructionROM.scala 14:{11,11}]
  wire [31:0] _GEN_19 = 5'h13 == addrReg[6:2] ? 32'hd52223 : _GEN_18; // @[InstructionROM.scala 14:{11,11}]
  wire [31:0] _GEN_20 = 5'h14 == addrReg[6:2] ? 32'hb52223 : _GEN_19; // @[InstructionROM.scala 14:{11,11}]
  wire [31:0] _GEN_21 = 5'h15 == addrReg[6:2] ? 32'hc52223 : _GEN_20; // @[InstructionROM.scala 14:{11,11}]
  assign io_data = 5'h16 == addrReg[6:2] ? 32'h6f : _GEN_21; // @[InstructionROM.scala 14:{11,11}]
  always @(posedge clock) begin
    if (reset) begin // @[InstructionROM.scala 11:24]
      addrReg <= 32'h0; // @[InstructionROM.scala 11:24]
    end else begin
      addrReg <= io_address; // @[InstructionROM.scala 12:11]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  addrReg = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Tx(
  input        clock,
  input        reset,
  output       io_txd,
  output       io_channel_ready,
  input        io_channel_valid,
  input  [7:0] io_channel_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [10:0] shiftReg; // @[Uart.scala 30:25]
  reg [19:0] cntReg; // @[Uart.scala 31:23]
  reg [3:0] bitsReg; // @[Uart.scala 32:24]
  wire  _io_channel_ready_T = cntReg == 20'h0; // @[Uart.scala 34:31]
  wire [9:0] shift = shiftReg[10:1]; // @[Uart.scala 41:28]
  wire [10:0] _shiftReg_T_1 = {1'h1,shift}; // @[Cat.scala 33:92]
  wire [3:0] _bitsReg_T_1 = bitsReg - 4'h1; // @[Uart.scala 43:26]
  wire [10:0] _shiftReg_T_3 = {2'h3,io_channel_bits,1'h0}; // @[Cat.scala 33:92]
  wire [19:0] _cntReg_T_1 = cntReg - 20'h1; // @[Uart.scala 54:22]
  assign io_txd = shiftReg[0]; // @[Uart.scala 35:21]
  assign io_channel_ready = cntReg == 20'h0 & bitsReg == 4'h0; // @[Uart.scala 34:40]
  always @(posedge clock) begin
    if (reset) begin // @[Uart.scala 30:25]
      shiftReg <= 11'h7ff; // @[Uart.scala 30:25]
    end else if (_io_channel_ready_T) begin // @[Uart.scala 37:24]
      if (bitsReg != 4'h0) begin // @[Uart.scala 40:27]
        shiftReg <= _shiftReg_T_1; // @[Uart.scala 42:16]
      end else if (io_channel_valid) begin // @[Uart.scala 45:30]
        shiftReg <= _shiftReg_T_3; // @[Uart.scala 46:18]
      end else begin
        shiftReg <= 11'h7ff; // @[Uart.scala 49:18]
      end
    end
    if (reset) begin // @[Uart.scala 31:23]
      cntReg <= 20'h0; // @[Uart.scala 31:23]
    end else if (_io_channel_ready_T) begin // @[Uart.scala 37:24]
      cntReg <= 20'h363; // @[Uart.scala 39:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[Uart.scala 54:12]
    end
    if (reset) begin // @[Uart.scala 32:24]
      bitsReg <= 4'h0; // @[Uart.scala 32:24]
    end else if (_io_channel_ready_T) begin // @[Uart.scala 37:24]
      if (bitsReg != 4'h0) begin // @[Uart.scala 40:27]
        bitsReg <= _bitsReg_T_1; // @[Uart.scala 43:15]
      end else if (io_channel_valid) begin // @[Uart.scala 45:30]
        bitsReg <= 4'hb; // @[Uart.scala 47:17]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  shiftReg = _RAND_0[10:0];
  _RAND_1 = {1{`RANDOM}};
  cntReg = _RAND_1[19:0];
  _RAND_2 = {1{`RANDOM}};
  bitsReg = _RAND_2[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Buffer(
  input        clock,
  input        reset,
  output       io_in_ready,
  input        io_in_valid,
  input  [7:0] io_in_bits,
  input        io_out_ready,
  output       io_out_valid,
  output [7:0] io_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  stateReg; // @[Uart.scala 117:25]
  reg [7:0] dataReg; // @[Uart.scala 118:24]
  wire  _io_in_ready_T = ~stateReg; // @[Uart.scala 120:27]
  wire  _GEN_1 = io_in_valid | stateReg; // @[Uart.scala 124:23 126:16 117:25]
  assign io_in_ready = ~stateReg; // @[Uart.scala 120:27]
  assign io_out_valid = stateReg; // @[Uart.scala 121:28]
  assign io_out_bits = dataReg; // @[Uart.scala 133:15]
  always @(posedge clock) begin
    if (reset) begin // @[Uart.scala 117:25]
      stateReg <= 1'h0; // @[Uart.scala 117:25]
    end else if (_io_in_ready_T) begin // @[Uart.scala 123:28]
      stateReg <= _GEN_1;
    end else if (io_out_ready) begin // @[Uart.scala 129:24]
      stateReg <= 1'h0; // @[Uart.scala 130:16]
    end
    if (reset) begin // @[Uart.scala 118:24]
      dataReg <= 8'h0; // @[Uart.scala 118:24]
    end else if (_io_in_ready_T) begin // @[Uart.scala 123:28]
      if (io_in_valid) begin // @[Uart.scala 124:23]
        dataReg <= io_in_bits; // @[Uart.scala 125:15]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  dataReg = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module BufferedTx(
  input        clock,
  input        reset,
  output       io_txd,
  output       io_channel_ready,
  input        io_channel_valid,
  input  [7:0] io_channel_bits
);
  wire  tx_clock; // @[Uart.scala 144:18]
  wire  tx_reset; // @[Uart.scala 144:18]
  wire  tx_io_txd; // @[Uart.scala 144:18]
  wire  tx_io_channel_ready; // @[Uart.scala 144:18]
  wire  tx_io_channel_valid; // @[Uart.scala 144:18]
  wire [7:0] tx_io_channel_bits; // @[Uart.scala 144:18]
  wire  buf__clock; // @[Uart.scala 145:19]
  wire  buf__reset; // @[Uart.scala 145:19]
  wire  buf__io_in_ready; // @[Uart.scala 145:19]
  wire  buf__io_in_valid; // @[Uart.scala 145:19]
  wire [7:0] buf__io_in_bits; // @[Uart.scala 145:19]
  wire  buf__io_out_ready; // @[Uart.scala 145:19]
  wire  buf__io_out_valid; // @[Uart.scala 145:19]
  wire [7:0] buf__io_out_bits; // @[Uart.scala 145:19]
  Tx tx ( // @[Uart.scala 144:18]
    .clock(tx_clock),
    .reset(tx_reset),
    .io_txd(tx_io_txd),
    .io_channel_ready(tx_io_channel_ready),
    .io_channel_valid(tx_io_channel_valid),
    .io_channel_bits(tx_io_channel_bits)
  );
  Buffer buf_ ( // @[Uart.scala 145:19]
    .clock(buf__clock),
    .reset(buf__reset),
    .io_in_ready(buf__io_in_ready),
    .io_in_valid(buf__io_in_valid),
    .io_in_bits(buf__io_in_bits),
    .io_out_ready(buf__io_out_ready),
    .io_out_valid(buf__io_out_valid),
    .io_out_bits(buf__io_out_bits)
  );
  assign io_txd = tx_io_txd; // @[Uart.scala 149:10]
  assign io_channel_ready = buf__io_in_ready; // @[Uart.scala 147:13]
  assign tx_clock = clock;
  assign tx_reset = reset;
  assign tx_io_channel_valid = buf__io_out_valid; // @[Uart.scala 148:17]
  assign tx_io_channel_bits = buf__io_out_bits; // @[Uart.scala 148:17]
  assign buf__clock = clock;
  assign buf__reset = reset;
  assign buf__io_in_valid = io_channel_valid; // @[Uart.scala 147:13]
  assign buf__io_in_bits = io_channel_bits; // @[Uart.scala 147:13]
  assign buf__io_out_ready = tx_io_channel_ready; // @[Uart.scala 148:17]
endmodule
module Rx(
  input        clock,
  input        reset,
  input        io_rxd,
  input        io_channel_ready,
  output       io_channel_valid,
  output [7:0] io_channel_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg  rxReg_REG; // @[Uart.scala 76:30]
  reg  rxReg; // @[Uart.scala 76:22]
  reg  falling_REG; // @[Uart.scala 77:35]
  wire  falling = ~rxReg & falling_REG; // @[Uart.scala 77:24]
  reg [7:0] shiftReg; // @[Uart.scala 79:25]
  reg [19:0] cntReg; // @[Uart.scala 80:23]
  reg [3:0] bitsReg; // @[Uart.scala 81:24]
  reg  valReg; // @[Uart.scala 82:23]
  wire [19:0] _cntReg_T_1 = cntReg - 20'h1; // @[Uart.scala 85:22]
  wire [7:0] _shiftReg_T_1 = {rxReg,shiftReg[7:1]}; // @[Cat.scala 33:92]
  wire [3:0] _bitsReg_T_1 = bitsReg - 4'h1; // @[Uart.scala 89:24]
  wire  _GEN_0 = bitsReg == 4'h1 | valReg; // @[Uart.scala 91:27 92:14 82:23]
  assign io_channel_valid = valReg; // @[Uart.scala 104:20]
  assign io_channel_bits = shiftReg; // @[Uart.scala 103:19]
  always @(posedge clock) begin
    if (reset) begin // @[Uart.scala 76:30]
      rxReg_REG <= 1'h0; // @[Uart.scala 76:30]
    end else begin
      rxReg_REG <= io_rxd; // @[Uart.scala 76:30]
    end
    if (reset) begin // @[Uart.scala 76:22]
      rxReg <= 1'h0; // @[Uart.scala 76:22]
    end else begin
      rxReg <= rxReg_REG; // @[Uart.scala 76:22]
    end
    falling_REG <= rxReg; // @[Uart.scala 77:35]
    if (reset) begin // @[Uart.scala 79:25]
      shiftReg <= 8'h0; // @[Uart.scala 79:25]
    end else if (!(cntReg != 20'h0)) begin // @[Uart.scala 84:24]
      if (bitsReg != 4'h0) begin // @[Uart.scala 86:31]
        shiftReg <= _shiftReg_T_1; // @[Uart.scala 88:14]
      end
    end
    if (reset) begin // @[Uart.scala 80:23]
      cntReg <= 20'h363; // @[Uart.scala 80:23]
    end else if (cntReg != 20'h0) begin // @[Uart.scala 84:24]
      cntReg <= _cntReg_T_1; // @[Uart.scala 85:12]
    end else if (bitsReg != 4'h0) begin // @[Uart.scala 86:31]
      cntReg <= 20'h363; // @[Uart.scala 87:12]
    end else if (falling) begin // @[Uart.scala 94:23]
      cntReg <= 20'h514; // @[Uart.scala 95:12]
    end
    if (reset) begin // @[Uart.scala 81:24]
      bitsReg <= 4'h0; // @[Uart.scala 81:24]
    end else if (!(cntReg != 20'h0)) begin // @[Uart.scala 84:24]
      if (bitsReg != 4'h0) begin // @[Uart.scala 86:31]
        bitsReg <= _bitsReg_T_1; // @[Uart.scala 89:13]
      end else if (falling) begin // @[Uart.scala 94:23]
        bitsReg <= 4'h8; // @[Uart.scala 96:13]
      end
    end
    if (reset) begin // @[Uart.scala 82:23]
      valReg <= 1'h0; // @[Uart.scala 82:23]
    end else if (valReg & io_channel_ready) begin // @[Uart.scala 99:36]
      valReg <= 1'h0; // @[Uart.scala 100:12]
    end else if (!(cntReg != 20'h0)) begin // @[Uart.scala 84:24]
      if (bitsReg != 4'h0) begin // @[Uart.scala 86:31]
        valReg <= _GEN_0;
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  rxReg_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  rxReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  falling_REG = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  shiftReg = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  cntReg = _RAND_4[19:0];
  _RAND_5 = {1{`RANDOM}};
  bitsReg = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  valReg = _RAND_6[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module WildcatTop(
  input         clock,
  input         reset,
  output [15:0] io_led,
  output        io_tx,
  input         io_rx
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  cpu_clock; // @[WildcatTop.scala 27:19]
  wire  cpu_reset; // @[WildcatTop.scala 27:19]
  wire [31:0] cpu_io_imem_address; // @[WildcatTop.scala 27:19]
  wire [31:0] cpu_io_imem_data; // @[WildcatTop.scala 27:19]
  wire [31:0] cpu_io_dmem_rdAddress; // @[WildcatTop.scala 27:19]
  wire [31:0] cpu_io_dmem_rdData; // @[WildcatTop.scala 27:19]
  wire  cpu_io_dmem_rdEnable; // @[WildcatTop.scala 27:19]
  wire [31:0] cpu_io_dmem_wrAddress; // @[WildcatTop.scala 27:19]
  wire [31:0] cpu_io_dmem_wrData; // @[WildcatTop.scala 27:19]
  wire  cpu_io_dmem_wrEnable_0; // @[WildcatTop.scala 27:19]
  wire  cpu_io_dmem_wrEnable_1; // @[WildcatTop.scala 27:19]
  wire  cpu_io_dmem_wrEnable_2; // @[WildcatTop.scala 27:19]
  wire  cpu_io_dmem_wrEnable_3; // @[WildcatTop.scala 27:19]
  wire  dmem_clock; // @[WildcatTop.scala 30:20]
  wire [31:0] dmem_io_rdAddress; // @[WildcatTop.scala 30:20]
  wire [31:0] dmem_io_rdData; // @[WildcatTop.scala 30:20]
  wire [31:0] dmem_io_wrAddress; // @[WildcatTop.scala 30:20]
  wire [31:0] dmem_io_wrData; // @[WildcatTop.scala 30:20]
  wire  dmem_io_wrEnable_0; // @[WildcatTop.scala 30:20]
  wire  dmem_io_wrEnable_1; // @[WildcatTop.scala 30:20]
  wire  dmem_io_wrEnable_2; // @[WildcatTop.scala 30:20]
  wire  dmem_io_wrEnable_3; // @[WildcatTop.scala 30:20]
  wire  imem_clock; // @[WildcatTop.scala 32:20]
  wire  imem_reset; // @[WildcatTop.scala 32:20]
  wire [31:0] imem_io_address; // @[WildcatTop.scala 32:20]
  wire [31:0] imem_io_data; // @[WildcatTop.scala 32:20]
  wire  tx_clock; // @[WildcatTop.scala 49:18]
  wire  tx_reset; // @[WildcatTop.scala 49:18]
  wire  tx_io_txd; // @[WildcatTop.scala 49:18]
  wire  tx_io_channel_ready; // @[WildcatTop.scala 49:18]
  wire  tx_io_channel_valid; // @[WildcatTop.scala 49:18]
  wire [7:0] tx_io_channel_bits; // @[WildcatTop.scala 49:18]
  wire  rx_clock; // @[WildcatTop.scala 50:18]
  wire  rx_reset; // @[WildcatTop.scala 50:18]
  wire  rx_io_rxd; // @[WildcatTop.scala 50:18]
  wire  rx_io_channel_ready; // @[WildcatTop.scala 50:18]
  wire  rx_io_channel_valid; // @[WildcatTop.scala 50:18]
  wire [7:0] rx_io_channel_bits; // @[WildcatTop.scala 50:18]
  reg [1:0] uartStatusReg; // @[WildcatTop.scala 58:30]
  reg [31:0] memAddressReg; // @[WildcatTop.scala 59:30]
  wire [31:0] _GEN_0 = memAddressReg[3:0] == 4'h4 ? {{24'd0}, rx_io_channel_bits} : dmem_io_rdData; // @[WildcatTop.scala 31:15 63:46 64:26]
  wire  _GEN_1 = memAddressReg[3:0] == 4'h4 & cpu_io_dmem_rdEnable; // @[WildcatTop.scala 56:23 63:46 65:27]
  wire [31:0] _GEN_2 = memAddressReg[3:0] == 4'h0 ? {{30'd0}, uartStatusReg} : _GEN_0; // @[WildcatTop.scala 61:40 62:26]
  wire  _GEN_3 = memAddressReg[3:0] == 4'h0 ? 1'h0 : _GEN_1; // @[WildcatTop.scala 56:23 61:40]
  reg [7:0] ledReg; // @[WildcatTop.scala 69:23]
  wire  _T_16 = cpu_io_dmem_wrAddress[19:16] == 4'h0 & cpu_io_dmem_wrAddress[3:0] == 4'h4; // @[WildcatTop.scala 71:48]
  wire  _GEN_9 = cpu_io_dmem_wrAddress[31:28] == 4'hf & cpu_io_dmem_wrEnable_0 & _T_16; // @[WildcatTop.scala 55:23 70:79]
  reg [7:0] io_led_REG; // @[WildcatTop.scala 80:39]
  ThreeCats cpu ( // @[WildcatTop.scala 27:19]
    .clock(cpu_clock),
    .reset(cpu_reset),
    .io_imem_address(cpu_io_imem_address),
    .io_imem_data(cpu_io_imem_data),
    .io_dmem_rdAddress(cpu_io_dmem_rdAddress),
    .io_dmem_rdData(cpu_io_dmem_rdData),
    .io_dmem_rdEnable(cpu_io_dmem_rdEnable),
    .io_dmem_wrAddress(cpu_io_dmem_wrAddress),
    .io_dmem_wrData(cpu_io_dmem_wrData),
    .io_dmem_wrEnable_0(cpu_io_dmem_wrEnable_0),
    .io_dmem_wrEnable_1(cpu_io_dmem_wrEnable_1),
    .io_dmem_wrEnable_2(cpu_io_dmem_wrEnable_2),
    .io_dmem_wrEnable_3(cpu_io_dmem_wrEnable_3)
  );
  ScratchPadMem dmem ( // @[WildcatTop.scala 30:20]
    .clock(dmem_clock),
    .io_rdAddress(dmem_io_rdAddress),
    .io_rdData(dmem_io_rdData),
    .io_wrAddress(dmem_io_wrAddress),
    .io_wrData(dmem_io_wrData),
    .io_wrEnable_0(dmem_io_wrEnable_0),
    .io_wrEnable_1(dmem_io_wrEnable_1),
    .io_wrEnable_2(dmem_io_wrEnable_2),
    .io_wrEnable_3(dmem_io_wrEnable_3)
  );
  InstructionROM imem ( // @[WildcatTop.scala 32:20]
    .clock(imem_clock),
    .reset(imem_reset),
    .io_address(imem_io_address),
    .io_data(imem_io_data)
  );
  BufferedTx tx ( // @[WildcatTop.scala 49:18]
    .clock(tx_clock),
    .reset(tx_reset),
    .io_txd(tx_io_txd),
    .io_channel_ready(tx_io_channel_ready),
    .io_channel_valid(tx_io_channel_valid),
    .io_channel_bits(tx_io_channel_bits)
  );
  Rx rx ( // @[WildcatTop.scala 50:18]
    .clock(rx_clock),
    .reset(rx_reset),
    .io_rxd(rx_io_rxd),
    .io_channel_ready(rx_io_channel_ready),
    .io_channel_valid(rx_io_channel_valid),
    .io_channel_bits(rx_io_channel_bits)
  );
  assign io_led = {8'h80,io_led_REG}; // @[WildcatTop.scala 80:29]
  assign io_tx = tx_io_txd; // @[WildcatTop.scala 51:9]
  assign cpu_clock = clock;
  assign cpu_reset = reset;
  assign cpu_io_imem_data = imem_io_data; // @[WildcatTop.scala 34:20]
  assign cpu_io_dmem_rdData = memAddressReg[31:28] == 4'hf & memAddressReg[19:16] == 4'h0 ? _GEN_2 : dmem_io_rdData; // @[WildcatTop.scala 31:15 60:74]
  assign dmem_clock = clock;
  assign dmem_io_rdAddress = cpu_io_dmem_rdAddress; // @[WildcatTop.scala 31:15]
  assign dmem_io_wrAddress = cpu_io_dmem_wrAddress; // @[WildcatTop.scala 31:15]
  assign dmem_io_wrData = cpu_io_dmem_wrData; // @[WildcatTop.scala 31:15]
  assign dmem_io_wrEnable_0 = cpu_io_dmem_wrAddress[31:28] == 4'hf & cpu_io_dmem_wrEnable_0 ? 1'h0 :
    cpu_io_dmem_wrEnable_0; // @[WildcatTop.scala 31:15 70:79 77:22]
  assign dmem_io_wrEnable_1 = cpu_io_dmem_wrAddress[31:28] == 4'hf & cpu_io_dmem_wrEnable_0 ? 1'h0 :
    cpu_io_dmem_wrEnable_1; // @[WildcatTop.scala 31:15 70:79 77:22]
  assign dmem_io_wrEnable_2 = cpu_io_dmem_wrAddress[31:28] == 4'hf & cpu_io_dmem_wrEnable_0 ? 1'h0 :
    cpu_io_dmem_wrEnable_2; // @[WildcatTop.scala 31:15 70:79 77:22]
  assign dmem_io_wrEnable_3 = cpu_io_dmem_wrAddress[31:28] == 4'hf & cpu_io_dmem_wrEnable_0 ? 1'h0 :
    cpu_io_dmem_wrEnable_3; // @[WildcatTop.scala 31:15 70:79 77:22]
  assign imem_clock = clock;
  assign imem_reset = reset;
  assign imem_io_address = cpu_io_imem_address; // @[WildcatTop.scala 33:19]
  assign tx_clock = clock;
  assign tx_reset = reset;
  assign tx_io_channel_valid = cpu_io_dmem_wrAddress[31:28] == 4'hf & cpu_io_dmem_wrEnable_0 & _T_16; // @[WildcatTop.scala 55:23 70:79]
  assign tx_io_channel_bits = cpu_io_dmem_wrData[7:0]; // @[WildcatTop.scala 54:43]
  assign rx_clock = clock;
  assign rx_reset = reset;
  assign rx_io_rxd = io_rx; // @[WildcatTop.scala 52:13]
  assign rx_io_channel_ready = memAddressReg[31:28] == 4'hf & memAddressReg[19:16] == 4'h0 & _GEN_3; // @[WildcatTop.scala 56:23 60:74]
  always @(posedge clock) begin
    uartStatusReg <= {rx_io_channel_valid,tx_io_channel_ready}; // @[WildcatTop.scala 58:51]
    memAddressReg <= cpu_io_dmem_rdAddress; // @[WildcatTop.scala 59:30]
    if (reset) begin // @[WildcatTop.scala 69:23]
      ledReg <= 8'h0; // @[WildcatTop.scala 69:23]
    end else if (cpu_io_dmem_wrAddress[31:28] == 4'hf & cpu_io_dmem_wrEnable_0) begin // @[WildcatTop.scala 70:79]
      if (!(cpu_io_dmem_wrAddress[19:16] == 4'h0 & cpu_io_dmem_wrAddress[3:0] == 4'h4)) begin // @[WildcatTop.scala 71:88]
        if (cpu_io_dmem_wrAddress[19:16] == 4'h1) begin // @[WildcatTop.scala 74:56]
          ledReg <= cpu_io_dmem_wrData[7:0]; // @[WildcatTop.scala 75:14]
        end
      end
    end
    io_led_REG <= ledReg; // @[WildcatTop.scala 80:39]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_9 & ~reset) begin
          $fwrite(32'h80000002," %c %d\n",cpu_io_dmem_wrData[7:0],cpu_io_dmem_wrData[7:0]); // @[WildcatTop.scala 72:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  uartStatusReg = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  memAddressReg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  ledReg = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  io_led_REG = _RAND_3[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
