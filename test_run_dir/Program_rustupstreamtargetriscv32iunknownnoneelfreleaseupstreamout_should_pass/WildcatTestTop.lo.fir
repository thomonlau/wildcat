FIRRTL version 1.1.0
circuit WildcatTestTop :
  module Csr :
    input clock : Clock
    input reset : UInt<1>
    input io_address : UInt<12>
    output io_data : UInt<32>

    node _T = eq(UInt<12>("hc00"), io_address) @[Csr.scala 22:22]
    node _T_1 = eq(UInt<12>("hc80"), io_address) @[Csr.scala 22:22]
    node _T_2 = eq(UInt<12>("hc01"), io_address) @[Csr.scala 22:22]
    node _T_3 = eq(UInt<12>("hc81"), io_address) @[Csr.scala 22:22]
    node _T_4 = eq(UInt<12>("hb00"), io_address) @[Csr.scala 22:22]
    node _T_5 = eq(UInt<12>("hb80"), io_address) @[Csr.scala 22:22]
    node _T_6 = eq(UInt<12>("hb01"), io_address) @[Csr.scala 22:22]
    node _T_7 = eq(UInt<12>("hb81"), io_address) @[Csr.scala 22:22]
    node _T_8 = eq(UInt<12>("hf12"), io_address) @[Csr.scala 22:22]
    node _GEN_0 = mux(_T_8, UInt<6>("h2f"), UInt<32>("h0")) @[Csr.scala 22:22 48:12 19:25]
    node _GEN_1 = mux(_T_7, UInt<1>("h0"), _GEN_0) @[Csr.scala 22:22 45:12]
    node _GEN_2 = mux(_T_6, UInt<1>("h0"), _GEN_1) @[Csr.scala 22:22 42:12]
    node _GEN_3 = mux(_T_5, UInt<1>("h0"), _GEN_2) @[Csr.scala 22:22 39:12]
    node _GEN_4 = mux(_T_4, UInt<1>("h0"), _GEN_3) @[Csr.scala 22:22 36:12]
    node _GEN_5 = mux(_T_3, UInt<3>("h4"), _GEN_4) @[Csr.scala 22:22 33:12]
    node _GEN_6 = mux(_T_2, UInt<2>("h3"), _GEN_5) @[Csr.scala 22:22 30:12]
    node _GEN_7 = mux(_T_1, UInt<2>("h2"), _GEN_6) @[Csr.scala 22:22 27:12]
    node _GEN_8 = mux(_T, UInt<1>("h1"), _GEN_7) @[Csr.scala 22:22 24:12]
    node data = _GEN_8 @[Csr.scala 19:25]
    io_data <= data @[Csr.scala 52:11]

  module ThreeCats :
    input clock : Clock
    input reset : UInt<1>
    output io_imem_address : UInt<32>
    input io_imem_data : UInt<32>
    input io_imem_stall : UInt<1>
    output io_dmem_rdAddress : UInt<32>
    input io_dmem_rdData : UInt<32>
    output io_dmem_rdEnable : UInt<1>
    output io_dmem_wrAddress : UInt<32>
    output io_dmem_wrData : UInt<32>
    output io_dmem_wrEnable_0 : UInt<1>
    output io_dmem_wrEnable_1 : UInt<1>
    output io_dmem_wrEnable_2 : UInt<1>
    output io_dmem_wrEnable_3 : UInt<1>
    input io_dmem_stall : UInt<1>
    output doBranch_0 : UInt<1>
    output decExReg_decOut_isECall : UInt<1>
    output instrReg_0 : UInt<32>
    output instr_0 : UInt<32>
    output decExReg_pc : UInt<32>
    output cyclesReg_0 : UInt<32>
    output pcReg_0 : UInt<32>
    output pcRegReg_0 : UInt<32>
    output debugRegs_0_0 : UInt<32>
    output debugRegs_0_1 : UInt<32>
    output debugRegs_0_2 : UInt<32>
    output debugRegs_0_3 : UInt<32>
    output debugRegs_0_4 : UInt<32>
    output debugRegs_0_5 : UInt<32>
    output debugRegs_0_6 : UInt<32>
    output debugRegs_0_7 : UInt<32>
    output debugRegs_0_8 : UInt<32>
    output debugRegs_0_9 : UInt<32>
    output debugRegs_0_10 : UInt<32>
    output debugRegs_0_11 : UInt<32>
    output debugRegs_0_12 : UInt<32>
    output debugRegs_0_13 : UInt<32>
    output debugRegs_0_14 : UInt<32>
    output debugRegs_0_15 : UInt<32>
    output debugRegs_0_16 : UInt<32>
    output debugRegs_0_17 : UInt<32>
    output debugRegs_0_18 : UInt<32>
    output debugRegs_0_19 : UInt<32>
    output debugRegs_0_20 : UInt<32>
    output debugRegs_0_21 : UInt<32>
    output debugRegs_0_22 : UInt<32>
    output debugRegs_0_23 : UInt<32>
    output debugRegs_0_24 : UInt<32>
    output debugRegs_0_25 : UInt<32>
    output debugRegs_0_26 : UInt<32>
    output debugRegs_0_27 : UInt<32>
    output debugRegs_0_28 : UInt<32>
    output debugRegs_0_29 : UInt<32>
    output debugRegs_0_30 : UInt<32>
    output debugRegs_0_31 : UInt<32>

    mem regs : @[Functions.scala 194:29]
      data-type => UInt<32>
      depth => 32
      read-latency => 1
      write-latency => 1
      reader => rs1Val_MPORT
      reader => rs2Val_MPORT
      writer => MPORT
      read-under-write => new
    inst csr of Csr @[ThreeCats.scala 70:19]
    reg cyclesReg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), cyclesReg) @[ThreeCats.scala 22:26]
    node _cyclesReg_T = add(cyclesReg, UInt<1>("h1")) @[ThreeCats.scala 23:26]
    node _cyclesReg_T_1 = tail(_cyclesReg_T, 1) @[ThreeCats.scala 23:26]
    reg exFwdReg_valid : UInt<1>, clock with :
      reset => (UInt<1>("h0"), exFwdReg_valid) @[ThreeCats.scala 40:25]
    reg exFwdReg_wbDest : UInt<5>, clock with :
      reset => (UInt<1>("h0"), exFwdReg_wbDest) @[ThreeCats.scala 40:25]
    reg exFwdReg_wbData : UInt<32>, clock with :
      reset => (UInt<1>("h0"), exFwdReg_wbData) @[ThreeCats.scala 40:25]
    node _pcReg_T = asUInt(asSInt(UInt<32>("hfffffffc"))) @[ThreeCats.scala 45:44]
    node _pcReg_T_1 = add(UInt<1>("h0"), _pcReg_T) @[ThreeCats.scala 45:29]
    node _pcReg_T_2 = tail(_pcReg_T_1, 1) @[ThreeCats.scala 45:29]
    reg pcReg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pcReg) @[ThreeCats.scala 45:22]
    node _pcNext_T = add(pcReg, UInt<3>("h4")) @[ThreeCats.scala 46:62]
    node _pcNext_T_1 = tail(_pcNext_T, 1) @[ThreeCats.scala 46:62]
    reg decExReg__func3 : UInt<3>, clock with :
      reset => (UInt<1>("h0"), decExReg__func3) @[ThreeCats.scala 125:25]
    node _doBranch_T = eq(UInt<1>("h0"), decExReg__func3) @[Functions.scala 143:20]
    reg decExReg__rs1 : UInt<5>, clock with :
      reset => (UInt<1>("h0"), decExReg__rs1) @[ThreeCats.scala 125:25]
    node _v1_T = eq(exFwdReg_wbDest, decExReg__rs1) @[ThreeCats.scala 129:50]
    node _v1_T_1 = and(exFwdReg_valid, _v1_T) @[ThreeCats.scala 129:31]
    reg decExReg__rs1Val : UInt<32>, clock with :
      reset => (UInt<1>("h0"), decExReg__rs1Val) @[ThreeCats.scala 125:25]
    node v1 = mux(_v1_T_1, exFwdReg_wbData, decExReg__rs1Val) @[ThreeCats.scala 129:15]
    reg decExReg__rs2 : UInt<5>, clock with :
      reset => (UInt<1>("h0"), decExReg__rs2) @[ThreeCats.scala 125:25]
    node _v2_T = eq(exFwdReg_wbDest, decExReg__rs2) @[ThreeCats.scala 130:50]
    node _v2_T_1 = and(exFwdReg_valid, _v2_T) @[ThreeCats.scala 130:31]
    reg decExReg__rs2Val : UInt<32>, clock with :
      reset => (UInt<1>("h0"), decExReg__rs2Val) @[ThreeCats.scala 125:25]
    node v2 = mux(_v2_T_1, exFwdReg_wbData, decExReg__rs2Val) @[ThreeCats.scala 130:15]
    node _doBranch_res_T = eq(v1, v2) @[Functions.scala 145:20]
    node _doBranch_T_1 = eq(UInt<1>("h1"), decExReg__func3) @[Functions.scala 143:20]
    node _doBranch_res_T_1 = neq(v1, v2) @[Functions.scala 148:20]
    node _doBranch_T_2 = eq(UInt<3>("h4"), decExReg__func3) @[Functions.scala 143:20]
    node _doBranch_res_T_2 = asSInt(v1) @[Functions.scala 151:20]
    node _doBranch_res_T_3 = asSInt(v2) @[Functions.scala 151:33]
    node _doBranch_res_T_4 = lt(_doBranch_res_T_2, _doBranch_res_T_3) @[Functions.scala 151:27]
    node _doBranch_T_3 = eq(UInt<3>("h5"), decExReg__func3) @[Functions.scala 143:20]
    node _doBranch_res_T_5 = asSInt(v1) @[Functions.scala 154:20]
    node _doBranch_res_T_6 = asSInt(v2) @[Functions.scala 154:34]
    node _doBranch_res_T_7 = geq(_doBranch_res_T_5, _doBranch_res_T_6) @[Functions.scala 154:27]
    node _doBranch_T_4 = eq(UInt<3>("h6"), decExReg__func3) @[Functions.scala 143:20]
    node _doBranch_res_T_8 = lt(v1, v2) @[Functions.scala 157:20]
    node _doBranch_T_5 = eq(UInt<3>("h7"), decExReg__func3) @[Functions.scala 143:20]
    node _doBranch_res_T_9 = geq(v1, v2) @[Functions.scala 160:20]
    node _GEN_328 = mux(_doBranch_T_5, _doBranch_res_T_9, UInt<1>("h0")) @[Functions.scala 143:20 160:13 142:9]
    node _GEN_329 = mux(_doBranch_T_4, _doBranch_res_T_8, _GEN_328) @[Functions.scala 143:20 157:13]
    node _GEN_330 = mux(_doBranch_T_3, _doBranch_res_T_7, _GEN_329) @[Functions.scala 143:20 154:13]
    node _GEN_331 = mux(_doBranch_T_2, _doBranch_res_T_4, _GEN_330) @[Functions.scala 143:20 151:13]
    node _GEN_332 = mux(_doBranch_T_1, _doBranch_res_T_1, _GEN_331) @[Functions.scala 143:20 148:13]
    node _GEN_333 = mux(_doBranch_T, _doBranch_res_T, _GEN_332) @[Functions.scala 143:20 145:13]
    node doBranch_res = _GEN_333 @[Functions.scala 141:19]
    reg decExReg__decOut_isBranch : UInt<1>, clock with :
      reset => (UInt<1>("h0"), decExReg__decOut_isBranch) @[ThreeCats.scala 125:25]
    node _doBranch_T_6 = and(doBranch_res, decExReg__decOut_isBranch) @[ThreeCats.scala 155:49]
    reg decExReg__decOut_isJal : UInt<1>, clock with :
      reset => (UInt<1>("h0"), decExReg__decOut_isJal) @[ThreeCats.scala 125:25]
    node _doBranch_T_7 = or(_doBranch_T_6, decExReg__decOut_isJal) @[ThreeCats.scala 155:78]
    reg decExReg__decOut_isJalr : UInt<1>, clock with :
      reset => (UInt<1>("h0"), decExReg__decOut_isJalr) @[ThreeCats.scala 125:25]
    node _doBranch_T_8 = or(_doBranch_T_7, decExReg__decOut_isJalr) @[ThreeCats.scala 155:103]
    reg decExReg__valid : UInt<1>, clock with :
      reset => (UInt<1>("h0"), decExReg__valid) @[ThreeCats.scala 125:25]
    node _doBranch_T_9 = and(_doBranch_T_8, decExReg__valid) @[ThreeCats.scala 155:130]
    node doBranch = _doBranch_T_9 @[ThreeCats.scala 155:12 31:29]
    reg decExReg__decOut_isLoad : UInt<1>, clock with :
      reset => (UInt<1>("h0"), decExReg__decOut_isLoad) @[ThreeCats.scala 125:25]
    node _T_13 = eq(doBranch, UInt<1>("h0")) @[ThreeCats.scala 159:34]
    node _T_14 = and(decExReg__decOut_isLoad, _T_13) @[ThreeCats.scala 159:31]
    node _res_T_16 = eq(UInt<1>("h0"), decExReg__func3) @[Functions.scala 257:19]
    reg decExReg__memLow : UInt<2>, clock with :
      reset => (UInt<1>("h0"), decExReg__memLow) @[ThreeCats.scala 125:25]
    node _res_T_17 = eq(UInt<1>("h0"), decExReg__memLow) @[Functions.scala 259:24]
    node _res_res_T_19 = bits(io_dmem_rdData, 7, 7) @[Functions.scala 261:33]
    node _res_res_T_20 = bits(_res_res_T_19, 0, 0) @[Bitwise.scala 77:15]
    node _res_res_T_21 = mux(_res_res_T_20, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 77:12]
    node _res_res_T_22 = bits(io_dmem_rdData, 7, 0) @[Functions.scala 261:45]
    node _res_res_T_23 = cat(_res_res_T_21, _res_res_T_22) @[Functions.scala 261:38]
    node _res_T_18 = eq(UInt<1>("h1"), decExReg__memLow) @[Functions.scala 259:24]
    node _res_res_T_24 = bits(io_dmem_rdData, 15, 15) @[Functions.scala 264:33]
    node _res_res_T_25 = bits(_res_res_T_24, 0, 0) @[Bitwise.scala 77:15]
    node _res_res_T_26 = mux(_res_res_T_25, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 77:12]
    node _res_res_T_27 = bits(io_dmem_rdData, 15, 8) @[Functions.scala 264:46]
    node _res_res_T_28 = cat(_res_res_T_26, _res_res_T_27) @[Functions.scala 264:39]
    node _res_T_19 = eq(UInt<2>("h2"), decExReg__memLow) @[Functions.scala 259:24]
    node _res_res_T_29 = bits(io_dmem_rdData, 23, 23) @[Functions.scala 267:33]
    node _res_res_T_30 = bits(_res_res_T_29, 0, 0) @[Bitwise.scala 77:15]
    node _res_res_T_31 = mux(_res_res_T_30, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 77:12]
    node _res_res_T_32 = bits(io_dmem_rdData, 23, 16) @[Functions.scala 267:46]
    node _res_res_T_33 = cat(_res_res_T_31, _res_res_T_32) @[Functions.scala 267:39]
    node _res_T_20 = eq(UInt<2>("h3"), decExReg__memLow) @[Functions.scala 259:24]
    node _res_res_T_34 = bits(io_dmem_rdData, 31, 31) @[Functions.scala 271:33]
    node _res_res_T_35 = bits(_res_res_T_34, 0, 0) @[Bitwise.scala 77:15]
    node _res_res_T_36 = mux(_res_res_T_35, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 77:12]
    node _res_res_T_37 = bits(io_dmem_rdData, 31, 24) @[Functions.scala 271:46]
    node _res_res_T_38 = cat(_res_res_T_36, _res_res_T_37) @[Functions.scala 271:39]
    node _GEN_334 = mux(_res_T_20, _res_res_T_38, io_dmem_rdData) @[Functions.scala 259:24 271:17 256:9]
    node _GEN_335 = mux(_res_T_19, _res_res_T_33, _GEN_334) @[Functions.scala 259:24 267:17]
    node _GEN_336 = mux(_res_T_18, _res_res_T_28, _GEN_335) @[Functions.scala 259:24 264:17]
    node _GEN_337 = mux(_res_T_17, _res_res_T_23, _GEN_336) @[Functions.scala 259:24 261:17]
    node _res_T_21 = eq(UInt<1>("h1"), decExReg__func3) @[Functions.scala 257:19]
    node _res_T_22 = eq(UInt<1>("h0"), decExReg__memLow) @[Functions.scala 276:24]
    node _res_res_T_39 = bits(io_dmem_rdData, 15, 15) @[Functions.scala 278:33]
    node _res_res_T_40 = bits(_res_res_T_39, 0, 0) @[Bitwise.scala 77:15]
    node _res_res_T_41 = mux(_res_res_T_40, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 77:12]
    node _res_res_T_42 = bits(io_dmem_rdData, 15, 0) @[Functions.scala 278:46]
    node _res_res_T_43 = cat(_res_res_T_41, _res_res_T_42) @[Functions.scala 278:39]
    node _res_T_23 = eq(UInt<2>("h2"), decExReg__memLow) @[Functions.scala 276:24]
    node _res_res_T_44 = bits(io_dmem_rdData, 31, 31) @[Functions.scala 281:33]
    node _res_res_T_45 = bits(_res_res_T_44, 0, 0) @[Bitwise.scala 77:15]
    node _res_res_T_46 = mux(_res_res_T_45, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 77:12]
    node _res_res_T_47 = bits(io_dmem_rdData, 31, 16) @[Functions.scala 281:46]
    node _res_res_T_48 = cat(_res_res_T_46, _res_res_T_47) @[Functions.scala 281:39]
    node _GEN_338 = mux(_res_T_23, _res_res_T_48, io_dmem_rdData) @[Functions.scala 276:24 281:17 256:9]
    node _GEN_339 = mux(_res_T_22, _res_res_T_43, _GEN_338) @[Functions.scala 276:24 278:17]
    node _res_T_24 = eq(UInt<3>("h4"), decExReg__func3) @[Functions.scala 257:19]
    node _res_T_25 = eq(UInt<1>("h0"), decExReg__memLow) @[Functions.scala 286:24]
    node _res_res_T_49 = bits(io_dmem_rdData, 7, 0) @[Functions.scala 288:24]
    node _res_T_26 = eq(UInt<1>("h1"), decExReg__memLow) @[Functions.scala 286:24]
    node _res_res_T_50 = bits(io_dmem_rdData, 15, 8) @[Functions.scala 291:24]
    node _res_T_27 = eq(UInt<2>("h2"), decExReg__memLow) @[Functions.scala 286:24]
    node _res_res_T_51 = bits(io_dmem_rdData, 23, 16) @[Functions.scala 294:24]
    node _res_T_28 = eq(UInt<2>("h3"), decExReg__memLow) @[Functions.scala 286:24]
    node _res_res_T_52 = bits(io_dmem_rdData, 31, 24) @[Functions.scala 297:24]
    node _GEN_340 = mux(_res_T_28, _res_res_T_52, io_dmem_rdData) @[Functions.scala 286:24 297:17 256:9]
    node _GEN_341 = mux(_res_T_27, _res_res_T_51, _GEN_340) @[Functions.scala 286:24 294:17]
    node _GEN_342 = mux(_res_T_26, _res_res_T_50, _GEN_341) @[Functions.scala 286:24 291:17]
    node _GEN_343 = mux(_res_T_25, _res_res_T_49, _GEN_342) @[Functions.scala 286:24 288:17]
    node _res_T_29 = eq(UInt<3>("h5"), decExReg__func3) @[Functions.scala 257:19]
    node _res_T_30 = eq(UInt<1>("h0"), decExReg__memLow) @[Functions.scala 302:24]
    node _res_res_T_53 = bits(io_dmem_rdData, 15, 0) @[Functions.scala 304:24]
    node _res_T_31 = eq(UInt<2>("h2"), decExReg__memLow) @[Functions.scala 302:24]
    node _res_res_T_54 = bits(io_dmem_rdData, 31, 16) @[Functions.scala 307:24]
    node _GEN_344 = mux(_res_T_31, _res_res_T_54, io_dmem_rdData) @[Functions.scala 302:24 307:17 256:9]
    node _GEN_345 = mux(_res_T_30, _res_res_T_53, _GEN_344) @[Functions.scala 302:24 304:17]
    node _GEN_346 = mux(_res_T_29, _GEN_345, io_dmem_rdData) @[Functions.scala 257:19 256:9]
    node _GEN_347 = mux(_res_T_24, _GEN_343, _GEN_346) @[Functions.scala 257:19]
    node _GEN_348 = mux(_res_T_21, _GEN_339, _GEN_347) @[Functions.scala 257:19]
    node _GEN_349 = mux(_res_T_16, _GEN_337, _GEN_348) @[Functions.scala 257:19]
    node res_res_1 = _GEN_349 @[Functions.scala 255:19]
    reg decExReg__decOut_isCssrw : UInt<1>, clock with :
      reset => (UInt<1>("h0"), decExReg__decOut_isCssrw) @[ThreeCats.scala 125:25]
    reg decExReg__csrVal : UInt<32>, clock with :
      reset => (UInt<1>("h0"), decExReg__csrVal) @[ThreeCats.scala 125:25]
    reg decExReg__decOut_isAuiPc : UInt<1>, clock with :
      reset => (UInt<1>("h0"), decExReg__decOut_isAuiPc) @[ThreeCats.scala 125:25]
    reg decExReg__pc : UInt<32>, clock with :
      reset => (UInt<1>("h0"), decExReg__pc) @[ThreeCats.scala 125:25]
    node _res_T_11 = asSInt(decExReg__pc) @[ThreeCats.scala 139:25]
    reg decExReg__decOut_imm : SInt<32>, clock with :
      reset => (UInt<1>("h0"), decExReg__decOut_imm) @[ThreeCats.scala 125:25]
    node _res_T_12 = add(_res_T_11, decExReg__decOut_imm) @[ThreeCats.scala 139:32]
    node _res_T_13 = tail(_res_T_12, 1) @[ThreeCats.scala 139:32]
    node _res_T_14 = asSInt(_res_T_13) @[ThreeCats.scala 139:32]
    node _res_T_15 = asUInt(_res_T_14) @[ThreeCats.scala 139:55]
    reg decExReg__decOut_isLui : UInt<1>, clock with :
      reset => (UInt<1>("h0"), decExReg__decOut_isLui) @[ThreeCats.scala 125:25]
    node _res_T_10 = asUInt(decExReg__decOut_imm) @[ThreeCats.scala 136:32]
    reg decExReg__decOut_aluOp : UInt<4>, clock with :
      reset => (UInt<1>("h0"), decExReg__decOut_aluOp) @[ThreeCats.scala 125:25]
    node _res_T = eq(UInt<1>("h0"), decExReg__decOut_aluOp) @[Functions.scala 219:16]
    reg decExReg__decOut_isImm : UInt<1>, clock with :
      reset => (UInt<1>("h0"), decExReg__decOut_isImm) @[ThreeCats.scala 125:25]
    node _val2_T = asUInt(decExReg__decOut_imm) @[ThreeCats.scala 133:61]
    node val2 = mux(decExReg__decOut_isImm, _val2_T, v2) @[ThreeCats.scala 133:17]
    node _res_res_T = add(v1, val2) @[Functions.scala 221:18]
    node _res_res_T_1 = tail(_res_res_T, 1) @[Functions.scala 221:18]
    node _res_T_1 = eq(UInt<1>("h1"), decExReg__decOut_aluOp) @[Functions.scala 219:16]
    node _res_res_T_2 = sub(v1, val2) @[Functions.scala 224:18]
    node _res_res_T_3 = tail(_res_res_T_2, 1) @[Functions.scala 224:18]
    node _res_T_2 = eq(UInt<4>("h9"), decExReg__decOut_aluOp) @[Functions.scala 219:16]
    node _res_res_T_4 = and(v1, val2) @[Functions.scala 227:18]
    node _res_T_3 = eq(UInt<4>("h8"), decExReg__decOut_aluOp) @[Functions.scala 219:16]
    node _res_res_T_5 = or(v1, val2) @[Functions.scala 230:18]
    node _res_T_4 = eq(UInt<3>("h5"), decExReg__decOut_aluOp) @[Functions.scala 219:16]
    node _res_res_T_6 = xor(v1, val2) @[Functions.scala 233:18]
    node _res_T_5 = eq(UInt<2>("h2"), decExReg__decOut_aluOp) @[Functions.scala 219:16]
    node _res_res_T_7 = bits(val2, 4, 0) @[Functions.scala 236:22]
    node _res_res_T_8 = dshl(v1, _res_res_T_7) @[Functions.scala 236:18]
    node _res_T_6 = eq(UInt<3>("h6"), decExReg__decOut_aluOp) @[Functions.scala 219:16]
    node _res_res_T_9 = bits(val2, 4, 0) @[Functions.scala 239:22]
    node _res_res_T_10 = dshr(v1, _res_res_T_9) @[Functions.scala 239:18]
    node _res_T_7 = eq(UInt<3>("h7"), decExReg__decOut_aluOp) @[Functions.scala 219:16]
    node _res_res_T_11 = asSInt(v1) @[Functions.scala 242:19]
    node _res_res_T_12 = bits(val2, 4, 0) @[Functions.scala 242:30]
    node _res_res_T_13 = dshr(_res_res_T_11, _res_res_T_12) @[Functions.scala 242:26]
    node _res_res_T_14 = asUInt(_res_res_T_13) @[Functions.scala 242:38]
    node _res_T_8 = eq(UInt<2>("h3"), decExReg__decOut_aluOp) @[Functions.scala 219:16]
    node _res_res_T_15 = asSInt(v1) @[Functions.scala 245:19]
    node _res_res_T_16 = asSInt(val2) @[Functions.scala 245:30]
    node _res_res_T_17 = lt(_res_res_T_15, _res_res_T_16) @[Functions.scala 245:26]
    node _res_T_9 = eq(UInt<3>("h4"), decExReg__decOut_aluOp) @[Functions.scala 219:16]
    node _res_res_T_18 = lt(v1, val2) @[Functions.scala 248:19]
    node _GEN_313 = validif(_res_T_9, _res_res_T_18) @[Functions.scala 219:16 248:13]
    node _GEN_314 = mux(_res_T_8, _res_res_T_17, _GEN_313) @[Functions.scala 219:16 245:13]
    node _GEN_315 = mux(_res_T_7, _res_res_T_14, _GEN_314) @[Functions.scala 219:16 242:13]
    node _GEN_316 = mux(_res_T_6, _res_res_T_10, _GEN_315) @[Functions.scala 219:16 239:13]
    node _GEN_317 = mux(_res_T_5, _res_res_T_8, _GEN_316) @[Functions.scala 219:16 236:13]
    node _GEN_318 = mux(_res_T_4, _res_res_T_6, _GEN_317) @[Functions.scala 219:16 233:13]
    node _GEN_319 = mux(_res_T_3, _res_res_T_5, _GEN_318) @[Functions.scala 219:16 230:13]
    node _GEN_320 = mux(_res_T_2, _res_res_T_4, _GEN_319) @[Functions.scala 219:16 227:13]
    node _GEN_321 = mux(_res_T_1, _res_res_T_3, _GEN_320) @[Functions.scala 219:16 224:13]
    node _GEN_322 = mux(_res_T, _res_res_T_1, _GEN_321) @[Functions.scala 219:16 221:13]
    node res_res = bits(_GEN_322, 31, 0) @[Functions.scala 217:19]
    node _GEN_323 = mux(decExReg__decOut_isLui, _res_T_10, res_res) @[ThreeCats.scala 135:31 134:7 136:9]
    node _GEN_324 = mux(decExReg__decOut_isAuiPc, _res_T_15, _GEN_323) @[ThreeCats.scala 138:33 139:9]
    node _GEN_325 = mux(decExReg__decOut_isCssrw, decExReg__csrVal, _GEN_324) @[ThreeCats.scala 141:33 142:9]
    node _GEN_350 = mux(_T_14, res_res_1, _GEN_325) @[ThreeCats.scala 159:45 160:9]
    node res = _GEN_350 @[ThreeCats.scala 132:17]
    node _branchTarget_T = asSInt(decExReg__pc) @[ThreeCats.scala 151:32]
    node _branchTarget_T_1 = add(_branchTarget_T, decExReg__decOut_imm) @[ThreeCats.scala 151:39]
    node _branchTarget_T_2 = tail(_branchTarget_T_1, 1) @[ThreeCats.scala 151:39]
    node _branchTarget_T_3 = asSInt(_branchTarget_T_2) @[ThreeCats.scala 151:39]
    node _branchTarget_T_4 = asUInt(_branchTarget_T_3) @[ThreeCats.scala 151:62]
    node _GEN_327 = mux(decExReg__decOut_isJalr, res, _branchTarget_T_4) @[ThreeCats.scala 151:16 152:32 153:18]
    node branchTarget = _GEN_327 @[ThreeCats.scala 32:33]
    node _pcNext_T_2 = mux(doBranch, branchTarget, _pcNext_T_1) @[ThreeCats.scala 46:31]
    reg firstIter : UInt<1>, clock with :
      reset => (UInt<1>("h0"), firstIter) @[ThreeCats.scala 47:26]
    node _GEN_0 = mux(firstIter, UInt<5>("h13"), io_imem_data) @[ThreeCats.scala 53:19 54:11 52:26]
    node _GEN_1 = mux(io_imem_stall, UInt<5>("h13"), _GEN_0) @[ThreeCats.scala 56:24 57:11]
    node _GEN_2 = mux(io_imem_stall, pcReg, _pcNext_T_2) @[ThreeCats.scala 56:24 58:12 46:27]
    reg pcRegReg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pcRegReg) @[ThreeCats.scala 62:25]
    reg instrReg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), instrReg) @[ThreeCats.scala 63:25]
    node instr = _GEN_1 @[ThreeCats.scala 52:26]
    node _instrReg_T = mux(doBranch, UInt<5>("h13"), instr) @[ThreeCats.scala 64:18]
    node rs1 = bits(instr, 19, 15) @[ThreeCats.scala 65:18]
    node rs2 = bits(instr, 24, 20) @[ThreeCats.scala 66:18]
    node rd = bits(instr, 11, 7) @[ThreeCats.scala 67:17]
    reg debugRegs_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_0) @[Functions.scala 195:30]
    reg debugRegs_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_1) @[Functions.scala 195:30]
    reg debugRegs_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_2) @[Functions.scala 195:30]
    reg debugRegs_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_3) @[Functions.scala 195:30]
    reg debugRegs_4 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_4) @[Functions.scala 195:30]
    reg debugRegs_5 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_5) @[Functions.scala 195:30]
    reg debugRegs_6 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_6) @[Functions.scala 195:30]
    reg debugRegs_7 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_7) @[Functions.scala 195:30]
    reg debugRegs_8 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_8) @[Functions.scala 195:30]
    reg debugRegs_9 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_9) @[Functions.scala 195:30]
    reg debugRegs_10 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_10) @[Functions.scala 195:30]
    reg debugRegs_11 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_11) @[Functions.scala 195:30]
    reg debugRegs_12 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_12) @[Functions.scala 195:30]
    reg debugRegs_13 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_13) @[Functions.scala 195:30]
    reg debugRegs_14 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_14) @[Functions.scala 195:30]
    reg debugRegs_15 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_15) @[Functions.scala 195:30]
    reg debugRegs_16 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_16) @[Functions.scala 195:30]
    reg debugRegs_17 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_17) @[Functions.scala 195:30]
    reg debugRegs_18 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_18) @[Functions.scala 195:30]
    reg debugRegs_19 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_19) @[Functions.scala 195:30]
    reg debugRegs_20 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_20) @[Functions.scala 195:30]
    reg debugRegs_21 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_21) @[Functions.scala 195:30]
    reg debugRegs_22 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_22) @[Functions.scala 195:30]
    reg debugRegs_23 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_23) @[Functions.scala 195:30]
    reg debugRegs_24 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_24) @[Functions.scala 195:30]
    reg debugRegs_25 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_25) @[Functions.scala 195:30]
    reg debugRegs_26 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_26) @[Functions.scala 195:30]
    reg debugRegs_27 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_27) @[Functions.scala 195:30]
    reg debugRegs_28 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_28) @[Functions.scala 195:30]
    reg debugRegs_29 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_29) @[Functions.scala 195:30]
    reg debugRegs_30 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_30) @[Functions.scala 195:30]
    reg debugRegs_31 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), debugRegs_31) @[Functions.scala 195:30]
    reg rs1Val_REG : UInt<5>, clock with :
      reset => (UInt<1>("h0"), rs1Val_REG) @[Functions.scala 196:31]
    node _rs1Val_T = eq(rs1Val_REG, UInt<1>("h0")) @[Functions.scala 196:37]
    node _GEN_3 = validif(UInt<1>("h1"), rs1) @[Functions.scala 196:{60,60}]
    node _rs1Val_WIRE = _GEN_3 @[Functions.scala 196:60]
    node _rs1Val_T_1 = or(_rs1Val_WIRE, UInt<5>("h0")) @[Functions.scala 196:60]
    node _rs1Val_T_2 = bits(_rs1Val_T_1, 4, 0) @[Functions.scala 196:60]
    node _GEN_4 = mux(UInt<1>("h1"), UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 194:29 196:{60,60}]
    node _GEN_5 = validif(UInt<1>("h1"), _rs1Val_T_2) @[Functions.scala 196:{60,60}]
    node _GEN_6 = validif(UInt<1>("h1"), clock) @[Functions.scala 196:{60,60}]
    node rs1Val = mux(_rs1Val_T, UInt<1>("h0"), regs.rs1Val_MPORT.data) @[Functions.scala 196:23]
    reg rs2Val_REG : UInt<5>, clock with :
      reset => (UInt<1>("h0"), rs2Val_REG) @[Functions.scala 197:31]
    node _rs2Val_T = eq(rs2Val_REG, UInt<1>("h0")) @[Functions.scala 197:37]
    node _GEN_7 = validif(UInt<1>("h1"), rs2) @[Functions.scala 197:{60,60}]
    node _rs2Val_WIRE = _GEN_7 @[Functions.scala 197:60]
    node _rs2Val_T_1 = or(_rs2Val_WIRE, UInt<5>("h0")) @[Functions.scala 197:60]
    node _rs2Val_T_2 = bits(_rs2Val_T_1, 4, 0) @[Functions.scala 197:60]
    node _GEN_8 = validif(UInt<1>("h1"), _rs2Val_T_2) @[Functions.scala 197:{60,60}]
    node rs2Val = mux(_rs2Val_T, UInt<1>("h0"), regs.rs2Val_MPORT.data) @[Functions.scala 197:23]
    reg decExReg__rd : UInt<5>, clock with :
      reset => (UInt<1>("h0"), decExReg__rd) @[ThreeCats.scala 125:25]
    node wbDest = decExReg__rd @[ThreeCats.scala 145:10 28:20]
    node _T = neq(wbDest, UInt<1>("h0")) @[Functions.scala 198:24]
    reg decExReg__decOut_rfWrite : UInt<1>, clock with :
      reset => (UInt<1>("h0"), decExReg__decOut_rfWrite) @[ThreeCats.scala 125:25]
    node _wrEna_T = and(decExReg__valid, decExReg__decOut_rfWrite) @[ThreeCats.scala 156:27]
    node wrEna = _wrEna_T @[ThreeCats.scala 29:26 156:9]
    node _T_1 = and(wrEna, _T) @[Functions.scala 198:18]
    node _T_12 = or(decExReg__decOut_isJal, decExReg__decOut_isJalr) @[ThreeCats.scala 147:30]
    node _wbData_T = add(decExReg__pc, UInt<3>("h4")) @[ThreeCats.scala 148:27]
    node _wbData_T_1 = tail(_wbData_T, 1) @[ThreeCats.scala 148:27]
    node _GEN_326 = mux(_T_12, _wbData_T_1, res) @[ThreeCats.scala 146:10 147:57 148:12]
    node wbData = _GEN_326 @[ThreeCats.scala 27:20]
    node _debugRegs_wbDest = wbData @[Functions.scala 200:{23,23}]
    node _GEN_9 = mux(eq(UInt<1>("h0"), wbDest), _debugRegs_wbDest, debugRegs_0) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_10 = mux(eq(UInt<1>("h1"), wbDest), _debugRegs_wbDest, debugRegs_1) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_11 = mux(eq(UInt<2>("h2"), wbDest), _debugRegs_wbDest, debugRegs_2) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_12 = mux(eq(UInt<2>("h3"), wbDest), _debugRegs_wbDest, debugRegs_3) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_13 = mux(eq(UInt<3>("h4"), wbDest), _debugRegs_wbDest, debugRegs_4) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_14 = mux(eq(UInt<3>("h5"), wbDest), _debugRegs_wbDest, debugRegs_5) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_15 = mux(eq(UInt<3>("h6"), wbDest), _debugRegs_wbDest, debugRegs_6) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_16 = mux(eq(UInt<3>("h7"), wbDest), _debugRegs_wbDest, debugRegs_7) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_17 = mux(eq(UInt<4>("h8"), wbDest), _debugRegs_wbDest, debugRegs_8) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_18 = mux(eq(UInt<4>("h9"), wbDest), _debugRegs_wbDest, debugRegs_9) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_19 = mux(eq(UInt<4>("ha"), wbDest), _debugRegs_wbDest, debugRegs_10) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_20 = mux(eq(UInt<4>("hb"), wbDest), _debugRegs_wbDest, debugRegs_11) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_21 = mux(eq(UInt<4>("hc"), wbDest), _debugRegs_wbDest, debugRegs_12) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_22 = mux(eq(UInt<4>("hd"), wbDest), _debugRegs_wbDest, debugRegs_13) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_23 = mux(eq(UInt<4>("he"), wbDest), _debugRegs_wbDest, debugRegs_14) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_24 = mux(eq(UInt<4>("hf"), wbDest), _debugRegs_wbDest, debugRegs_15) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_25 = mux(eq(UInt<5>("h10"), wbDest), _debugRegs_wbDest, debugRegs_16) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_26 = mux(eq(UInt<5>("h11"), wbDest), _debugRegs_wbDest, debugRegs_17) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_27 = mux(eq(UInt<5>("h12"), wbDest), _debugRegs_wbDest, debugRegs_18) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_28 = mux(eq(UInt<5>("h13"), wbDest), _debugRegs_wbDest, debugRegs_19) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_29 = mux(eq(UInt<5>("h14"), wbDest), _debugRegs_wbDest, debugRegs_20) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_30 = mux(eq(UInt<5>("h15"), wbDest), _debugRegs_wbDest, debugRegs_21) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_31 = mux(eq(UInt<5>("h16"), wbDest), _debugRegs_wbDest, debugRegs_22) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_32 = mux(eq(UInt<5>("h17"), wbDest), _debugRegs_wbDest, debugRegs_23) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_33 = mux(eq(UInt<5>("h18"), wbDest), _debugRegs_wbDest, debugRegs_24) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_34 = mux(eq(UInt<5>("h19"), wbDest), _debugRegs_wbDest, debugRegs_25) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_35 = mux(eq(UInt<5>("h1a"), wbDest), _debugRegs_wbDest, debugRegs_26) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_36 = mux(eq(UInt<5>("h1b"), wbDest), _debugRegs_wbDest, debugRegs_27) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_37 = mux(eq(UInt<5>("h1c"), wbDest), _debugRegs_wbDest, debugRegs_28) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_38 = mux(eq(UInt<5>("h1d"), wbDest), _debugRegs_wbDest, debugRegs_29) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_39 = mux(eq(UInt<5>("h1e"), wbDest), _debugRegs_wbDest, debugRegs_30) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_40 = mux(eq(UInt<5>("h1f"), wbDest), _debugRegs_wbDest, debugRegs_31) @[Functions.scala 200:{23,23} 195:30]
    node _GEN_41 = validif(_T_1, wbDest) @[Functions.scala 198:33]
    node _GEN_42 = validif(_T_1, clock) @[Functions.scala 198:33]
    node _GEN_43 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 194:29 198:33]
    node _GEN_44 = validif(_T_1, UInt<1>("h1")) @[Functions.scala 198:33]
    node _GEN_45 = validif(_T_1, wbData) @[Functions.scala 198:33]
    node _GEN_46 = mux(_T_1, _GEN_9, debugRegs_0) @[Functions.scala 195:30 198:33]
    node _GEN_47 = mux(_T_1, _GEN_10, debugRegs_1) @[Functions.scala 195:30 198:33]
    node _GEN_48 = mux(_T_1, _GEN_11, debugRegs_2) @[Functions.scala 195:30 198:33]
    node _GEN_49 = mux(_T_1, _GEN_12, debugRegs_3) @[Functions.scala 195:30 198:33]
    node _GEN_50 = mux(_T_1, _GEN_13, debugRegs_4) @[Functions.scala 195:30 198:33]
    node _GEN_51 = mux(_T_1, _GEN_14, debugRegs_5) @[Functions.scala 195:30 198:33]
    node _GEN_52 = mux(_T_1, _GEN_15, debugRegs_6) @[Functions.scala 195:30 198:33]
    node _GEN_53 = mux(_T_1, _GEN_16, debugRegs_7) @[Functions.scala 195:30 198:33]
    node _GEN_54 = mux(_T_1, _GEN_17, debugRegs_8) @[Functions.scala 195:30 198:33]
    node _GEN_55 = mux(_T_1, _GEN_18, debugRegs_9) @[Functions.scala 195:30 198:33]
    node _GEN_56 = mux(_T_1, _GEN_19, debugRegs_10) @[Functions.scala 195:30 198:33]
    node _GEN_57 = mux(_T_1, _GEN_20, debugRegs_11) @[Functions.scala 195:30 198:33]
    node _GEN_58 = mux(_T_1, _GEN_21, debugRegs_12) @[Functions.scala 195:30 198:33]
    node _GEN_59 = mux(_T_1, _GEN_22, debugRegs_13) @[Functions.scala 195:30 198:33]
    node _GEN_60 = mux(_T_1, _GEN_23, debugRegs_14) @[Functions.scala 195:30 198:33]
    node _GEN_61 = mux(_T_1, _GEN_24, debugRegs_15) @[Functions.scala 195:30 198:33]
    node _GEN_62 = mux(_T_1, _GEN_25, debugRegs_16) @[Functions.scala 195:30 198:33]
    node _GEN_63 = mux(_T_1, _GEN_26, debugRegs_17) @[Functions.scala 195:30 198:33]
    node _GEN_64 = mux(_T_1, _GEN_27, debugRegs_18) @[Functions.scala 195:30 198:33]
    node _GEN_65 = mux(_T_1, _GEN_28, debugRegs_19) @[Functions.scala 195:30 198:33]
    node _GEN_66 = mux(_T_1, _GEN_29, debugRegs_20) @[Functions.scala 195:30 198:33]
    node _GEN_67 = mux(_T_1, _GEN_30, debugRegs_21) @[Functions.scala 195:30 198:33]
    node _GEN_68 = mux(_T_1, _GEN_31, debugRegs_22) @[Functions.scala 195:30 198:33]
    node _GEN_69 = mux(_T_1, _GEN_32, debugRegs_23) @[Functions.scala 195:30 198:33]
    node _GEN_70 = mux(_T_1, _GEN_33, debugRegs_24) @[Functions.scala 195:30 198:33]
    node _GEN_71 = mux(_T_1, _GEN_34, debugRegs_25) @[Functions.scala 195:30 198:33]
    node _GEN_72 = mux(_T_1, _GEN_35, debugRegs_26) @[Functions.scala 195:30 198:33]
    node _GEN_73 = mux(_T_1, _GEN_36, debugRegs_27) @[Functions.scala 195:30 198:33]
    node _GEN_74 = mux(_T_1, _GEN_37, debugRegs_28) @[Functions.scala 195:30 198:33]
    node _GEN_75 = mux(_T_1, _GEN_38, debugRegs_29) @[Functions.scala 195:30 198:33]
    node _GEN_76 = mux(_T_1, _GEN_39, debugRegs_30) @[Functions.scala 195:30 198:33]
    node _GEN_77 = mux(_T_1, _GEN_40, debugRegs_31) @[Functions.scala 195:30 198:33]
    node _csr_io_address_T = bits(instrReg, 31, 20) @[ThreeCats.scala 71:29]
    node decOut_opcode = bits(instrReg, 6, 0) @[Functions.scala 17:29]
    node decOut_func3 = bits(instrReg, 14, 12) @[Functions.scala 18:28]
    node _decOut_T = eq(UInt<5>("h13"), decOut_opcode) @[Functions.scala 34:20]
    node _decOut_T_1 = eq(UInt<6>("h33"), decOut_opcode) @[Functions.scala 34:20]
    node _decOut_T_2 = eq(UInt<7>("h63"), decOut_opcode) @[Functions.scala 34:20]
    node _decOut_T_3 = eq(UInt<2>("h3"), decOut_opcode) @[Functions.scala 34:20]
    node _decOut_T_4 = eq(UInt<6>("h23"), decOut_opcode) @[Functions.scala 34:20]
    node _decOut_T_5 = eq(UInt<6>("h37"), decOut_opcode) @[Functions.scala 34:20]
    node _decOut_T_6 = eq(UInt<5>("h17"), decOut_opcode) @[Functions.scala 34:20]
    node _decOut_T_7 = eq(UInt<7>("h6f"), decOut_opcode) @[Functions.scala 34:20]
    node _decOut_T_8 = eq(UInt<7>("h67"), decOut_opcode) @[Functions.scala 34:20]
    node _decOut_T_9 = eq(UInt<7>("h73"), decOut_opcode) @[Functions.scala 34:20]
    node _decOut_T_10 = eq(decOut_func3, UInt<1>("h0")) @[Functions.scala 84:21]
    node _GEN_78 = mux(_decOut_T_10, UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 30:20 84:30 85:26]
    node _GEN_79 = mux(_decOut_T_10, UInt<1>("h0"), UInt<1>("h1")) @[Functions.scala 31:20 84:30 87:26]
    node _GEN_80 = mux(_decOut_T_9, UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 34:20 20:22 83:26]
    node _GEN_81 = mux(_decOut_T_9, _GEN_78, UInt<1>("h0")) @[Functions.scala 30:20 34:20]
    node _GEN_82 = mux(_decOut_T_9, _GEN_79, UInt<1>("h0")) @[Functions.scala 31:20 34:20]
    node _GEN_83 = mux(_decOut_T_8, UInt<1>("h1"), _GEN_80) @[Functions.scala 34:20 77:26]
    node _GEN_84 = mux(_decOut_T_8, UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 21:18 34:20 78:22]
    node _GEN_85 = mux(_decOut_T_8, UInt<1>("h1"), _GEN_82) @[Functions.scala 34:20 79:24]
    node _GEN_86 = mux(_decOut_T_8, UInt<1>("h0"), _GEN_81) @[Functions.scala 30:20 34:20]
    node _GEN_87 = mux(_decOut_T_8, UInt<1>("h0"), _GEN_82) @[Functions.scala 31:20 34:20]
    node _GEN_88 = mux(_decOut_T_7, UInt<3>("h5"), _GEN_83) @[Functions.scala 34:20 72:26]
    node _GEN_89 = mux(_decOut_T_7, UInt<1>("h1"), _GEN_85) @[Functions.scala 34:20 73:24]
    node _GEN_90 = mux(_decOut_T_7, UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 27:18 34:20 74:22]
    node _GEN_91 = mux(_decOut_T_7, UInt<1>("h0"), _GEN_84) @[Functions.scala 21:18 34:20]
    node _GEN_92 = mux(_decOut_T_7, UInt<1>("h0"), _GEN_86) @[Functions.scala 30:20 34:20]
    node _GEN_93 = mux(_decOut_T_7, UInt<1>("h0"), _GEN_87) @[Functions.scala 31:20 34:20]
    node _GEN_94 = mux(_decOut_T_6, UInt<3>("h4"), _GEN_88) @[Functions.scala 34:20 67:26]
    node _GEN_95 = mux(_decOut_T_6, UInt<1>("h1"), _GEN_89) @[Functions.scala 34:20 68:24]
    node _GEN_96 = mux(_decOut_T_6, UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 23:20 34:20 69:24]
    node _GEN_97 = mux(_decOut_T_6, UInt<1>("h0"), _GEN_90) @[Functions.scala 27:18 34:20]
    node _GEN_98 = mux(_decOut_T_6, UInt<1>("h0"), _GEN_91) @[Functions.scala 21:18 34:20]
    node _GEN_99 = mux(_decOut_T_6, UInt<1>("h0"), _GEN_92) @[Functions.scala 30:20 34:20]
    node _GEN_100 = mux(_decOut_T_6, UInt<1>("h0"), _GEN_93) @[Functions.scala 31:20 34:20]
    node _GEN_101 = mux(_decOut_T_5, UInt<3>("h4"), _GEN_94) @[Functions.scala 34:20 62:26]
    node _GEN_102 = mux(_decOut_T_5, UInt<1>("h1"), _GEN_95) @[Functions.scala 34:20 63:24]
    node _GEN_103 = mux(_decOut_T_5, UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 22:18 34:20 64:22]
    node _GEN_104 = mux(_decOut_T_5, UInt<1>("h0"), _GEN_96) @[Functions.scala 23:20 34:20]
    node _GEN_105 = mux(_decOut_T_5, UInt<1>("h0"), _GEN_97) @[Functions.scala 27:18 34:20]
    node _GEN_106 = mux(_decOut_T_5, UInt<1>("h0"), _GEN_98) @[Functions.scala 21:18 34:20]
    node _GEN_107 = mux(_decOut_T_5, UInt<1>("h0"), _GEN_99) @[Functions.scala 30:20 34:20]
    node _GEN_108 = mux(_decOut_T_5, UInt<1>("h0"), _GEN_100) @[Functions.scala 31:20 34:20]
    node _GEN_109 = mux(_decOut_T_4, UInt<2>("h2"), _GEN_101) @[Functions.scala 34:20 58:26]
    node _GEN_110 = mux(_decOut_T_4, UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 25:20 34:20 59:24]
    node _GEN_111 = mux(_decOut_T_4, UInt<1>("h0"), _GEN_102) @[Functions.scala 29:20 34:20]
    node _GEN_112 = mux(_decOut_T_4, UInt<1>("h0"), _GEN_103) @[Functions.scala 22:18 34:20]
    node _GEN_113 = mux(_decOut_T_4, UInt<1>("h0"), _GEN_104) @[Functions.scala 23:20 34:20]
    node _GEN_114 = mux(_decOut_T_4, UInt<1>("h0"), _GEN_105) @[Functions.scala 27:18 34:20]
    node _GEN_115 = mux(_decOut_T_4, UInt<1>("h0"), _GEN_106) @[Functions.scala 21:18 34:20]
    node _GEN_116 = mux(_decOut_T_4, UInt<1>("h0"), _GEN_107) @[Functions.scala 30:20 34:20]
    node _GEN_117 = mux(_decOut_T_4, UInt<1>("h0"), _GEN_108) @[Functions.scala 31:20 34:20]
    node _GEN_118 = mux(_decOut_T_3, UInt<1>("h1"), _GEN_109) @[Functions.scala 34:20 53:26]
    node _GEN_119 = mux(_decOut_T_3, UInt<1>("h1"), _GEN_111) @[Functions.scala 34:20 54:24]
    node _GEN_120 = mux(_decOut_T_3, UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 24:19 34:20 55:23]
    node _GEN_121 = mux(_decOut_T_3, UInt<1>("h0"), _GEN_110) @[Functions.scala 25:20 34:20]
    node _GEN_122 = mux(_decOut_T_3, UInt<1>("h0"), _GEN_112) @[Functions.scala 22:18 34:20]
    node _GEN_123 = mux(_decOut_T_3, UInt<1>("h0"), _GEN_113) @[Functions.scala 23:20 34:20]
    node _GEN_124 = mux(_decOut_T_3, UInt<1>("h0"), _GEN_114) @[Functions.scala 27:18 34:20]
    node _GEN_125 = mux(_decOut_T_3, UInt<1>("h0"), _GEN_115) @[Functions.scala 21:18 34:20]
    node _GEN_126 = mux(_decOut_T_3, UInt<1>("h0"), _GEN_116) @[Functions.scala 30:20 34:20]
    node _GEN_127 = mux(_decOut_T_3, UInt<1>("h0"), _GEN_117) @[Functions.scala 31:20 34:20]
    node _GEN_128 = mux(_decOut_T_2, UInt<2>("h3"), _GEN_118) @[Functions.scala 34:20 48:26]
    node _GEN_129 = mux(_decOut_T_2, UInt<1>("h1"), _GEN_125) @[Functions.scala 34:20 49:22]
    node _GEN_130 = mux(_decOut_T_2, UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 34:20 26:21 50:25]
    node _GEN_131 = mux(_decOut_T_2, UInt<1>("h0"), _GEN_119) @[Functions.scala 29:20 34:20]
    node _GEN_132 = mux(_decOut_T_2, UInt<1>("h0"), _GEN_120) @[Functions.scala 24:19 34:20]
    node _GEN_133 = mux(_decOut_T_2, UInt<1>("h0"), _GEN_121) @[Functions.scala 25:20 34:20]
    node _GEN_134 = mux(_decOut_T_2, UInt<1>("h0"), _GEN_122) @[Functions.scala 22:18 34:20]
    node _GEN_135 = mux(_decOut_T_2, UInt<1>("h0"), _GEN_123) @[Functions.scala 23:20 34:20]
    node _GEN_136 = mux(_decOut_T_2, UInt<1>("h0"), _GEN_124) @[Functions.scala 27:18 34:20]
    node _GEN_137 = mux(_decOut_T_2, UInt<1>("h0"), _GEN_125) @[Functions.scala 28:19 34:20]
    node _GEN_138 = mux(_decOut_T_2, UInt<1>("h0"), _GEN_126) @[Functions.scala 30:20 34:20]
    node _GEN_139 = mux(_decOut_T_2, UInt<1>("h0"), _GEN_127) @[Functions.scala 31:20 34:20]
    node _GEN_140 = mux(_decOut_T_1, UInt<1>("h0"), _GEN_128) @[Functions.scala 34:20 42:26]
    node _GEN_141 = mux(_decOut_T_1, UInt<1>("h1"), _GEN_131) @[Functions.scala 34:20 43:24]
    node _GEN_142 = mux(_decOut_T_1, UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 34:20 32:21 44:25]
    node _GEN_143 = mux(_decOut_T_1, UInt<1>("h0"), _GEN_129) @[Functions.scala 21:18 34:20]
    node _GEN_144 = mux(_decOut_T_1, UInt<1>("h0"), _GEN_130) @[Functions.scala 34:20 26:21]
    node _GEN_145 = mux(_decOut_T_1, UInt<1>("h0"), _GEN_132) @[Functions.scala 24:19 34:20]
    node _GEN_146 = mux(_decOut_T_1, UInt<1>("h0"), _GEN_133) @[Functions.scala 25:20 34:20]
    node _GEN_147 = mux(_decOut_T_1, UInt<1>("h0"), _GEN_134) @[Functions.scala 22:18 34:20]
    node _GEN_148 = mux(_decOut_T_1, UInt<1>("h0"), _GEN_135) @[Functions.scala 23:20 34:20]
    node _GEN_149 = mux(_decOut_T_1, UInt<1>("h0"), _GEN_136) @[Functions.scala 27:18 34:20]
    node _GEN_150 = mux(_decOut_T_1, UInt<1>("h0"), _GEN_137) @[Functions.scala 28:19 34:20]
    node _GEN_151 = mux(_decOut_T_1, UInt<1>("h0"), _GEN_138) @[Functions.scala 30:20 34:20]
    node _GEN_152 = mux(_decOut_T_1, UInt<1>("h0"), _GEN_139) @[Functions.scala 31:20 34:20]
    node _GEN_153 = mux(_decOut_T, UInt<1>("h1"), _GEN_140) @[Functions.scala 34:20 36:26]
    node _GEN_154 = mux(_decOut_T, UInt<1>("h1"), _GEN_143) @[Functions.scala 34:20 37:22]
    node _GEN_155 = mux(_decOut_T, UInt<1>("h1"), _GEN_141) @[Functions.scala 34:20 38:24]
    node _GEN_156 = mux(_decOut_T, UInt<1>("h1"), _GEN_142) @[Functions.scala 34:20 39:25]
    node _GEN_157 = mux(_decOut_T, UInt<1>("h0"), _GEN_142) @[Functions.scala 34:20 33:21]
    node _GEN_158 = mux(_decOut_T, UInt<1>("h0"), _GEN_144) @[Functions.scala 34:20 26:21]
    node _GEN_159 = mux(_decOut_T, UInt<1>("h0"), _GEN_145) @[Functions.scala 24:19 34:20]
    node _GEN_160 = mux(_decOut_T, UInt<1>("h0"), _GEN_146) @[Functions.scala 25:20 34:20]
    node _GEN_161 = mux(_decOut_T, UInt<1>("h0"), _GEN_147) @[Functions.scala 22:18 34:20]
    node _GEN_162 = mux(_decOut_T, UInt<1>("h0"), _GEN_148) @[Functions.scala 23:20 34:20]
    node _GEN_163 = mux(_decOut_T, UInt<1>("h0"), _GEN_149) @[Functions.scala 27:18 34:20]
    node _GEN_164 = mux(_decOut_T, UInt<1>("h0"), _GEN_150) @[Functions.scala 28:19 34:20]
    node _GEN_165 = mux(_decOut_T, UInt<1>("h0"), _GEN_151) @[Functions.scala 30:20 34:20]
    node _GEN_166 = mux(_decOut_T, UInt<1>("h0"), _GEN_152) @[Functions.scala 31:20 34:20]
    node decOut_decOut_aluOp_opcode = bits(instrReg, 6, 0) @[Functions.scala 99:29]
    node decOut_decOut_aluOp_func3 = bits(instrReg, 14, 12) @[Functions.scala 100:28]
    node decOut_decOut_aluOp_func7 = bits(instrReg, 31, 25) @[Functions.scala 101:28]
    node _decOut_decOut_aluOp_T = eq(UInt<1>("h0"), decOut_decOut_aluOp_func3) @[Functions.scala 104:19]
    node _decOut_decOut_aluOp_T_1 = neq(decOut_decOut_aluOp_opcode, UInt<5>("h13")) @[Functions.scala 107:21]
    node _decOut_decOut_aluOp_T_2 = neq(decOut_decOut_aluOp_opcode, UInt<7>("h67")) @[Functions.scala 107:44]
    node _decOut_decOut_aluOp_T_3 = and(_decOut_decOut_aluOp_T_1, _decOut_decOut_aluOp_T_2) @[Functions.scala 107:34]
    node _decOut_decOut_aluOp_T_4 = neq(decOut_decOut_aluOp_func7, UInt<1>("h0")) @[Functions.scala 107:64]
    node _decOut_decOut_aluOp_T_5 = and(_decOut_decOut_aluOp_T_3, _decOut_decOut_aluOp_T_4) @[Functions.scala 107:55]
    node _GEN_167 = mux(_decOut_decOut_aluOp_T_5, UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 106:15 107:73 108:17]
    node _decOut_decOut_aluOp_T_6 = eq(UInt<1>("h1"), decOut_decOut_aluOp_func3) @[Functions.scala 104:19]
    node _decOut_decOut_aluOp_T_7 = eq(UInt<2>("h2"), decOut_decOut_aluOp_func3) @[Functions.scala 104:19]
    node _decOut_decOut_aluOp_T_8 = eq(UInt<2>("h3"), decOut_decOut_aluOp_func3) @[Functions.scala 104:19]
    node _decOut_decOut_aluOp_T_9 = eq(UInt<3>("h4"), decOut_decOut_aluOp_func3) @[Functions.scala 104:19]
    node _decOut_decOut_aluOp_T_10 = eq(UInt<3>("h5"), decOut_decOut_aluOp_func3) @[Functions.scala 104:19]
    node _decOut_decOut_aluOp_T_11 = eq(decOut_decOut_aluOp_func7, UInt<1>("h0")) @[Functions.scala 124:20]
    node _GEN_168 = mux(_decOut_decOut_aluOp_T_11, UInt<3>("h6"), UInt<3>("h7")) @[Functions.scala 124:29 125:17 127:17]
    node _decOut_decOut_aluOp_T_12 = eq(UInt<3>("h6"), decOut_decOut_aluOp_func3) @[Functions.scala 104:19]
    node _decOut_decOut_aluOp_T_13 = eq(UInt<3>("h7"), decOut_decOut_aluOp_func3) @[Functions.scala 104:19]
    node _GEN_169 = mux(_decOut_decOut_aluOp_T_13, UInt<4>("h9"), UInt<1>("h0")) @[Functions.scala 104:19 134:15 103:28]
    node _GEN_170 = mux(_decOut_decOut_aluOp_T_12, UInt<4>("h8"), _GEN_169) @[Functions.scala 104:19 131:15]
    node _GEN_171 = mux(_decOut_decOut_aluOp_T_10, _GEN_168, _GEN_170) @[Functions.scala 104:19]
    node _GEN_172 = mux(_decOut_decOut_aluOp_T_9, UInt<3>("h5"), _GEN_171) @[Functions.scala 104:19 121:15]
    node _GEN_173 = mux(_decOut_decOut_aluOp_T_8, UInt<3>("h4"), _GEN_172) @[Functions.scala 104:19 118:15]
    node _GEN_174 = mux(_decOut_decOut_aluOp_T_7, UInt<2>("h3"), _GEN_173) @[Functions.scala 104:19 115:15]
    node _GEN_175 = mux(_decOut_decOut_aluOp_T_6, UInt<2>("h2"), _GEN_174) @[Functions.scala 104:19 112:15]
    node _GEN_176 = mux(_decOut_decOut_aluOp_T, _GEN_167, _GEN_175) @[Functions.scala 104:19]
    node _decOut_decOut_imm_imm_T = bits(instrReg, 31, 20) @[Functions.scala 169:23]
    node _decOut_decOut_imm_imm_T_1 = asSInt(_decOut_decOut_imm_imm_T) @[Functions.scala 169:32]
    node decOut_instrType = _GEN_153 @[Functions.scala 19:22]
    node _decOut_decOut_imm_T = eq(UInt<1>("h1"), decOut_instrType) @[Functions.scala 170:23]
    node _decOut_decOut_imm_imm_T_2 = bits(instrReg, 31, 31) @[Functions.scala 172:37]
    node _decOut_decOut_imm_imm_T_3 = bits(_decOut_decOut_imm_imm_T_2, 0, 0) @[Bitwise.scala 77:15]
    node _decOut_decOut_imm_imm_T_4 = mux(_decOut_decOut_imm_imm_T_3, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 77:12]
    node _decOut_decOut_imm_imm_T_5 = bits(instrReg, 31, 20) @[Functions.scala 172:57]
    node _decOut_decOut_imm_imm_T_6 = cat(_decOut_decOut_imm_imm_T_4, _decOut_decOut_imm_imm_T_5) @[Functions.scala 172:43]
    node _decOut_decOut_imm_imm_T_7 = asSInt(_decOut_decOut_imm_imm_T_6) @[Functions.scala 172:67]
    node _decOut_decOut_imm_T_1 = eq(UInt<2>("h2"), decOut_instrType) @[Functions.scala 170:23]
    node _decOut_decOut_imm_imm_T_8 = bits(instrReg, 31, 31) @[Functions.scala 175:37]
    node _decOut_decOut_imm_imm_T_9 = bits(_decOut_decOut_imm_imm_T_8, 0, 0) @[Bitwise.scala 77:15]
    node _decOut_decOut_imm_imm_T_10 = mux(_decOut_decOut_imm_imm_T_9, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 77:12]
    node _decOut_decOut_imm_imm_T_11 = bits(instrReg, 31, 25) @[Functions.scala 175:57]
    node _decOut_decOut_imm_imm_T_12 = cat(_decOut_decOut_imm_imm_T_10, _decOut_decOut_imm_imm_T_11) @[Functions.scala 175:43]
    node _decOut_decOut_imm_imm_T_13 = bits(instrReg, 11, 7) @[Functions.scala 175:80]
    node _decOut_decOut_imm_imm_T_14 = cat(_decOut_decOut_imm_imm_T_12, _decOut_decOut_imm_imm_T_13) @[Functions.scala 175:66]
    node _decOut_decOut_imm_imm_T_15 = asSInt(_decOut_decOut_imm_imm_T_14) @[Functions.scala 175:89]
    node _decOut_decOut_imm_T_2 = eq(UInt<2>("h3"), decOut_instrType) @[Functions.scala 170:23]
    node _decOut_decOut_imm_imm_T_16 = bits(instrReg, 31, 31) @[Functions.scala 178:37]
    node _decOut_decOut_imm_imm_T_17 = bits(_decOut_decOut_imm_imm_T_16, 0, 0) @[Bitwise.scala 77:15]
    node _decOut_decOut_imm_imm_T_18 = mux(_decOut_decOut_imm_imm_T_17, UInt<19>("h7ffff"), UInt<19>("h0")) @[Bitwise.scala 77:12]
    node _decOut_decOut_imm_imm_T_19 = bits(instrReg, 7, 7) @[Functions.scala 178:57]
    node _decOut_decOut_imm_imm_T_20 = cat(_decOut_decOut_imm_imm_T_18, _decOut_decOut_imm_imm_T_19) @[Functions.scala 178:43]
    node _decOut_decOut_imm_imm_T_21 = bits(instrReg, 30, 25) @[Functions.scala 178:75]
    node _decOut_decOut_imm_imm_T_22 = cat(_decOut_decOut_imm_imm_T_20, _decOut_decOut_imm_imm_T_21) @[Functions.scala 178:61]
    node _decOut_decOut_imm_imm_T_23 = bits(instrReg, 11, 8) @[Functions.scala 178:98]
    node _decOut_decOut_imm_imm_T_24 = cat(_decOut_decOut_imm_imm_T_22, _decOut_decOut_imm_imm_T_23) @[Functions.scala 178:84]
    node _decOut_decOut_imm_imm_T_25 = cat(_decOut_decOut_imm_imm_T_24, UInt<1>("h0")) @[Functions.scala 178:106]
    node _decOut_decOut_imm_imm_T_26 = asSInt(_decOut_decOut_imm_imm_T_25) @[Functions.scala 178:119]
    node _decOut_decOut_imm_T_3 = eq(UInt<3>("h4"), decOut_instrType) @[Functions.scala 170:23]
    node _decOut_decOut_imm_imm_T_27 = bits(instrReg, 31, 12) @[Functions.scala 181:28]
    node _decOut_decOut_imm_imm_T_28 = mux(UInt<1>("h0"), UInt<12>("hfff"), UInt<12>("h0")) @[Bitwise.scala 77:12]
    node _decOut_decOut_imm_imm_T_29 = cat(_decOut_decOut_imm_imm_T_27, _decOut_decOut_imm_imm_T_28) @[Functions.scala 181:37]
    node _decOut_decOut_imm_imm_T_30 = asSInt(_decOut_decOut_imm_imm_T_29) @[Functions.scala 181:55]
    node _decOut_decOut_imm_T_4 = eq(UInt<3>("h5"), decOut_instrType) @[Functions.scala 170:23]
    node _decOut_decOut_imm_imm_T_31 = bits(instrReg, 31, 31) @[Functions.scala 184:37]
    node _decOut_decOut_imm_imm_T_32 = bits(_decOut_decOut_imm_imm_T_31, 0, 0) @[Bitwise.scala 77:15]
    node _decOut_decOut_imm_imm_T_33 = mux(_decOut_decOut_imm_imm_T_32, UInt<11>("h7ff"), UInt<11>("h0")) @[Bitwise.scala 77:12]
    node _decOut_decOut_imm_imm_T_34 = bits(instrReg, 19, 12) @[Functions.scala 184:57]
    node _decOut_decOut_imm_imm_T_35 = cat(_decOut_decOut_imm_imm_T_33, _decOut_decOut_imm_imm_T_34) @[Functions.scala 184:43]
    node _decOut_decOut_imm_imm_T_36 = bits(instrReg, 20, 20) @[Functions.scala 184:80]
    node _decOut_decOut_imm_imm_T_37 = cat(_decOut_decOut_imm_imm_T_35, _decOut_decOut_imm_imm_T_36) @[Functions.scala 184:66]
    node _decOut_decOut_imm_imm_T_38 = bits(instrReg, 30, 21) @[Functions.scala 184:99]
    node _decOut_decOut_imm_imm_T_39 = cat(_decOut_decOut_imm_imm_T_37, _decOut_decOut_imm_imm_T_38) @[Functions.scala 184:85]
    node _decOut_decOut_imm_imm_T_40 = cat(_decOut_decOut_imm_imm_T_39, UInt<1>("h0")) @[Functions.scala 184:108]
    node _decOut_decOut_imm_imm_T_41 = asSInt(_decOut_decOut_imm_imm_T_40) @[Functions.scala 184:121]
    node _GEN_177 = mux(_decOut_decOut_imm_T_4, _decOut_decOut_imm_imm_T_41, _decOut_decOut_imm_imm_T_1) @[Functions.scala 170:23 184:13 169:9]
    node _GEN_178 = mux(_decOut_decOut_imm_T_3, _decOut_decOut_imm_imm_T_30, _GEN_177) @[Functions.scala 170:23 181:13]
    node _GEN_179 = mux(_decOut_decOut_imm_T_2, _decOut_decOut_imm_imm_T_26, _GEN_178) @[Functions.scala 170:23 178:13]
    node _GEN_180 = mux(_decOut_decOut_imm_T_1, _decOut_decOut_imm_imm_T_15, _GEN_179) @[Functions.scala 170:23 175:13]
    node _GEN_181 = mux(_decOut_decOut_imm_T, _decOut_decOut_imm_imm_T_7, _GEN_180) @[Functions.scala 170:23 172:13]
    node _decEx_valid_T = eq(doBranch, UInt<1>("h0")) @[ThreeCats.scala 90:18]
    node _decEx_rs1_T = bits(instrReg, 19, 15) @[ThreeCats.scala 92:24]
    node _decEx_rs2_T = bits(instrReg, 24, 20) @[ThreeCats.scala 93:24]
    node _decEx_rd_T = bits(instrReg, 11, 7) @[ThreeCats.scala 94:23]
    node _decEx_func3_T = bits(instrReg, 14, 12) @[ThreeCats.scala 98:26]
    node _address_T = neq(wbDest, UInt<1>("h0")) @[ThreeCats.scala 101:38]
    node _address_T_1 = and(wrEna, _address_T) @[ThreeCats.scala 101:27]
    node decEx_rs1 = _decEx_rs1_T @[ThreeCats.scala 76:19 92:13]
    node _address_T_2 = eq(wbDest, decEx_rs1) @[ThreeCats.scala 101:57]
    node _address_T_3 = and(_address_T_1, _address_T_2) @[ThreeCats.scala 101:47]
    node address = mux(_address_T_3, wbData, rs1Val) @[ThreeCats.scala 101:20]
    node _data_T = neq(wbDest, UInt<1>("h0")) @[ThreeCats.scala 102:35]
    node _data_T_1 = and(wrEna, _data_T) @[ThreeCats.scala 102:24]
    node decEx_rs2 = _decEx_rs2_T @[ThreeCats.scala 76:19 93:13]
    node _data_T_2 = eq(wbDest, decEx_rs2) @[ThreeCats.scala 102:54]
    node _data_T_3 = and(_data_T_1, _data_T_2) @[ThreeCats.scala 102:44]
    node data = mux(_data_T_3, wbData, rs2Val) @[ThreeCats.scala 102:17]
    node _memAddress_T = asSInt(address) @[ThreeCats.scala 104:29]
    node decOut_decOut_imm_imm = _GEN_181 @[Functions.scala 168:19]
    node decOut_imm = decOut_decOut_imm_imm @[Functions.scala 19:22 93:16]
    node _memAddress_T_1 = add(_memAddress_T, decOut_imm) @[ThreeCats.scala 104:36]
    node _memAddress_T_2 = tail(_memAddress_T_1, 1) @[ThreeCats.scala 104:36]
    node _memAddress_T_3 = asSInt(_memAddress_T_2) @[ThreeCats.scala 104:36]
    node memAddress = asUInt(_memAddress_T_3) @[ThreeCats.scala 104:50]
    node _decEx_memLow_T = bits(memAddress, 1, 0) @[ThreeCats.scala 105:29]
    node _T_2 = eq(doBranch, UInt<1>("h0")) @[ThreeCats.scala 112:25]
    node decOut_isLoad = _GEN_159 @[Functions.scala 19:22]
    node _T_3 = and(decOut_isLoad, _T_2) @[ThreeCats.scala 112:22]
    node _GEN_182 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[ThreeCats.scala 108:20 112:36 113:22]
    node _T_4 = eq(doBranch, UInt<1>("h0")) @[ThreeCats.scala 115:26]
    node decOut_isStore = _GEN_160 @[Functions.scala 19:22]
    node _T_5 = and(decOut_isStore, _T_4) @[ThreeCats.scala 115:23]
    node _T_6 = bits(memAddress, 1, 0) @[ThreeCats.scala 116:64]
    node decEx_func3 = _decEx_func3_T @[ThreeCats.scala 76:19 98:15]
    node _T_7 = eq(UInt<1>("h0"), decEx_func3) @[Functions.scala 318:19]
    node _wrData_T = bits(data, 7, 0) @[Functions.scala 320:23]
    node _wrData_T_1 = bits(data, 7, 0) @[Functions.scala 320:37]
    node _wrData_T_2 = cat(_wrData_T, _wrData_T_1) @[Functions.scala 320:30]
    node _wrData_T_3 = bits(data, 7, 0) @[Functions.scala 320:51]
    node _wrData_T_4 = cat(_wrData_T_2, _wrData_T_3) @[Functions.scala 320:44]
    node _wrData_T_5 = bits(data, 7, 0) @[Functions.scala 320:65]
    node _wrData_T_6 = cat(_wrData_T_4, _wrData_T_5) @[Functions.scala 320:58]
    node _wre_T_6 = UInt<1>("h1") @[Functions.scala 321:{26,26}]
    node _GEN_183 = mux(eq(UInt<1>("h0"), _T_6), _wre_T_6, UInt<1>("h0")) @[Functions.scala 321:{26,26} 317:27]
    node _GEN_184 = mux(eq(UInt<1>("h1"), _T_6), _wre_T_6, UInt<1>("h0")) @[Functions.scala 321:{26,26} 317:27]
    node _GEN_185 = mux(eq(UInt<2>("h2"), _T_6), _wre_T_6, UInt<1>("h0")) @[Functions.scala 321:{26,26} 317:27]
    node _GEN_186 = mux(eq(UInt<2>("h3"), _T_6), _wre_T_6, UInt<1>("h0")) @[Functions.scala 321:{26,26} 317:27]
    node _T_8 = eq(UInt<1>("h1"), decEx_func3) @[Functions.scala 318:19]
    node _wrData_T_7 = bits(data, 15, 0) @[Functions.scala 324:23]
    node _wrData_T_8 = bits(data, 15, 0) @[Functions.scala 324:38]
    node _wrData_T_9 = cat(_wrData_T_7, _wrData_T_8) @[Functions.scala 324:31]
    node _T_9 = eq(UInt<1>("h0"), _T_6) @[Functions.scala 325:24]
    node _T_10 = eq(UInt<2>("h2"), _T_6) @[Functions.scala 325:24]
    node _GEN_187 = mux(_T_10, UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 325:24 331:25 317:27]
    node _GEN_188 = mux(_T_9, UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 325:24 327:25 317:27]
    node _GEN_189 = mux(_T_9, UInt<1>("h0"), _GEN_187) @[Functions.scala 325:24 317:27]
    node _T_11 = eq(UInt<2>("h2"), decEx_func3) @[Functions.scala 318:19]
    node _WIRE_1_0 = UInt<1>("h1") @[Functions.scala 337:{28,28}]
    node _GEN_190 = mux(_T_11, _WIRE_1_0, UInt<1>("h0")) @[Functions.scala 318:19 337:18 317:27]
    node _WIRE_1_1 = UInt<1>("h1") @[Functions.scala 337:{28,28}]
    node _GEN_191 = mux(_T_11, _WIRE_1_1, UInt<1>("h0")) @[Functions.scala 318:19 337:18 317:27]
    node _WIRE_1_2 = UInt<1>("h1") @[Functions.scala 337:{28,28}]
    node _GEN_192 = mux(_T_11, _WIRE_1_2, UInt<1>("h0")) @[Functions.scala 318:19 337:18 317:27]
    node _WIRE_1_3 = UInt<1>("h1") @[Functions.scala 337:{28,28}]
    node _GEN_193 = mux(_T_11, _WIRE_1_3, UInt<1>("h0")) @[Functions.scala 318:19 337:18 317:27]
    node _GEN_194 = mux(_T_8, _wrData_T_9, data) @[Functions.scala 318:19 324:16 316:29]
    node _GEN_195 = mux(_T_8, _GEN_188, _GEN_190) @[Functions.scala 318:19]
    node _GEN_196 = mux(_T_8, _GEN_188, _GEN_191) @[Functions.scala 318:19]
    node _GEN_197 = mux(_T_8, _GEN_189, _GEN_192) @[Functions.scala 318:19]
    node _GEN_198 = mux(_T_8, _GEN_189, _GEN_193) @[Functions.scala 318:19]
    node _GEN_199 = mux(_T_7, _wrData_T_6, _GEN_194) @[Functions.scala 318:19 320:16]
    node _GEN_200 = mux(_T_7, _GEN_183, _GEN_195) @[Functions.scala 318:19]
    node _GEN_201 = mux(_T_7, _GEN_184, _GEN_196) @[Functions.scala 318:19]
    node _GEN_202 = mux(_T_7, _GEN_185, _GEN_197) @[Functions.scala 318:19]
    node _GEN_203 = mux(_T_7, _GEN_186, _GEN_198) @[Functions.scala 318:19]
    node wrd = _GEN_199 @[Functions.scala 316:29]
    node _GEN_204 = mux(_T_5, wrd, data) @[ThreeCats.scala 110:18 115:37 117:20]
    node wre_0 = _GEN_200 @[Functions.scala 317:27]
    node _WIRE__0 = UInt<1>("h0") @[ThreeCats.scala 111:{30,30}]
    node _GEN_205 = mux(_T_5, wre_0, _WIRE__0) @[ThreeCats.scala 111:20 115:37 118:22]
    node wre_1 = _GEN_201 @[Functions.scala 317:27]
    node _WIRE__1 = UInt<1>("h0") @[ThreeCats.scala 111:{30,30}]
    node _GEN_206 = mux(_T_5, wre_1, _WIRE__1) @[ThreeCats.scala 111:20 115:37 118:22]
    node wre_2 = _GEN_202 @[Functions.scala 317:27]
    node _WIRE__2 = UInt<1>("h0") @[ThreeCats.scala 111:{30,30}]
    node _GEN_207 = mux(_T_5, wre_2, _WIRE__2) @[ThreeCats.scala 111:20 115:37 118:22]
    node wre_3 = _GEN_203 @[Functions.scala 317:27]
    node _WIRE__3 = UInt<1>("h0") @[ThreeCats.scala 111:{30,30}]
    node _GEN_208 = mux(_T_5, wre_3, _WIRE__3) @[ThreeCats.scala 111:20 115:37 118:22]
    node _decExNop_T = asSInt(UInt<32>("h0")) @[ThreeCats.scala 123:30]
    node _decExNop_decOut_T = eq(UInt<5>("h13"), UInt<7>("h13")) @[Functions.scala 34:20]
    node _decExNop_decOut_T_1 = eq(UInt<6>("h33"), UInt<7>("h13")) @[Functions.scala 34:20]
    node _decExNop_decOut_T_2 = eq(UInt<7>("h63"), UInt<7>("h13")) @[Functions.scala 34:20]
    node _decExNop_decOut_T_3 = eq(UInt<2>("h3"), UInt<7>("h13")) @[Functions.scala 34:20]
    node _decExNop_decOut_T_4 = eq(UInt<6>("h23"), UInt<7>("h13")) @[Functions.scala 34:20]
    node _decExNop_decOut_T_5 = eq(UInt<6>("h37"), UInt<7>("h13")) @[Functions.scala 34:20]
    node _decExNop_decOut_T_6 = eq(UInt<5>("h17"), UInt<7>("h13")) @[Functions.scala 34:20]
    node _decExNop_decOut_T_7 = eq(UInt<7>("h6f"), UInt<7>("h13")) @[Functions.scala 34:20]
    node _decExNop_decOut_T_8 = eq(UInt<7>("h67"), UInt<7>("h13")) @[Functions.scala 34:20]
    node _decExNop_decOut_T_9 = eq(UInt<7>("h73"), UInt<7>("h13")) @[Functions.scala 34:20]
    node _decExNop_decOut_T_10 = eq(UInt<3>("h0"), UInt<1>("h0")) @[Functions.scala 84:21]
    node _GEN_209 = mux(_decExNop_decOut_T_10, UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 30:20 84:30 85:26]
    node _GEN_210 = mux(_decExNop_decOut_T_10, UInt<1>("h0"), UInt<1>("h1")) @[Functions.scala 31:20 84:30 87:26]
    node _GEN_211 = mux(_decExNop_decOut_T_9, UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 34:20 20:22 83:26]
    node _GEN_212 = mux(_decExNop_decOut_T_9, _GEN_209, UInt<1>("h0")) @[Functions.scala 30:20 34:20]
    node _GEN_213 = mux(_decExNop_decOut_T_9, _GEN_210, UInt<1>("h0")) @[Functions.scala 31:20 34:20]
    node _GEN_214 = mux(_decExNop_decOut_T_8, UInt<1>("h1"), _GEN_211) @[Functions.scala 34:20 77:26]
    node _GEN_215 = mux(_decExNop_decOut_T_8, UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 21:18 34:20 78:22]
    node _GEN_216 = mux(_decExNop_decOut_T_8, UInt<1>("h1"), _GEN_213) @[Functions.scala 34:20 79:24]
    node _GEN_217 = mux(_decExNop_decOut_T_8, UInt<1>("h0"), _GEN_212) @[Functions.scala 30:20 34:20]
    node _GEN_218 = mux(_decExNop_decOut_T_8, UInt<1>("h0"), _GEN_213) @[Functions.scala 31:20 34:20]
    node _GEN_219 = mux(_decExNop_decOut_T_7, UInt<3>("h5"), _GEN_214) @[Functions.scala 34:20 72:26]
    node _GEN_220 = mux(_decExNop_decOut_T_7, UInt<1>("h1"), _GEN_216) @[Functions.scala 34:20 73:24]
    node _GEN_221 = mux(_decExNop_decOut_T_7, UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 27:18 34:20 74:22]
    node _GEN_222 = mux(_decExNop_decOut_T_7, UInt<1>("h0"), _GEN_215) @[Functions.scala 21:18 34:20]
    node _GEN_223 = mux(_decExNop_decOut_T_7, UInt<1>("h0"), _GEN_217) @[Functions.scala 30:20 34:20]
    node _GEN_224 = mux(_decExNop_decOut_T_7, UInt<1>("h0"), _GEN_218) @[Functions.scala 31:20 34:20]
    node _GEN_225 = mux(_decExNop_decOut_T_6, UInt<3>("h4"), _GEN_219) @[Functions.scala 34:20 67:26]
    node _GEN_226 = mux(_decExNop_decOut_T_6, UInt<1>("h1"), _GEN_220) @[Functions.scala 34:20 68:24]
    node _GEN_227 = mux(_decExNop_decOut_T_6, UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 23:20 34:20 69:24]
    node _GEN_228 = mux(_decExNop_decOut_T_6, UInt<1>("h0"), _GEN_221) @[Functions.scala 27:18 34:20]
    node _GEN_229 = mux(_decExNop_decOut_T_6, UInt<1>("h0"), _GEN_222) @[Functions.scala 21:18 34:20]
    node _GEN_230 = mux(_decExNop_decOut_T_6, UInt<1>("h0"), _GEN_223) @[Functions.scala 30:20 34:20]
    node _GEN_231 = mux(_decExNop_decOut_T_6, UInt<1>("h0"), _GEN_224) @[Functions.scala 31:20 34:20]
    node _GEN_232 = mux(_decExNop_decOut_T_5, UInt<3>("h4"), _GEN_225) @[Functions.scala 34:20 62:26]
    node _GEN_233 = mux(_decExNop_decOut_T_5, UInt<1>("h1"), _GEN_226) @[Functions.scala 34:20 63:24]
    node _GEN_234 = mux(_decExNop_decOut_T_5, UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 22:18 34:20 64:22]
    node _GEN_235 = mux(_decExNop_decOut_T_5, UInt<1>("h0"), _GEN_227) @[Functions.scala 23:20 34:20]
    node _GEN_236 = mux(_decExNop_decOut_T_5, UInt<1>("h0"), _GEN_228) @[Functions.scala 27:18 34:20]
    node _GEN_237 = mux(_decExNop_decOut_T_5, UInt<1>("h0"), _GEN_229) @[Functions.scala 21:18 34:20]
    node _GEN_238 = mux(_decExNop_decOut_T_5, UInt<1>("h0"), _GEN_230) @[Functions.scala 30:20 34:20]
    node _GEN_239 = mux(_decExNop_decOut_T_5, UInt<1>("h0"), _GEN_231) @[Functions.scala 31:20 34:20]
    node _GEN_240 = mux(_decExNop_decOut_T_4, UInt<2>("h2"), _GEN_232) @[Functions.scala 34:20 58:26]
    node _GEN_241 = mux(_decExNop_decOut_T_4, UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 25:20 34:20 59:24]
    node _GEN_242 = mux(_decExNop_decOut_T_4, UInt<1>("h0"), _GEN_233) @[Functions.scala 29:20 34:20]
    node _GEN_243 = mux(_decExNop_decOut_T_4, UInt<1>("h0"), _GEN_234) @[Functions.scala 22:18 34:20]
    node _GEN_244 = mux(_decExNop_decOut_T_4, UInt<1>("h0"), _GEN_235) @[Functions.scala 23:20 34:20]
    node _GEN_245 = mux(_decExNop_decOut_T_4, UInt<1>("h0"), _GEN_236) @[Functions.scala 27:18 34:20]
    node _GEN_246 = mux(_decExNop_decOut_T_4, UInt<1>("h0"), _GEN_237) @[Functions.scala 21:18 34:20]
    node _GEN_247 = mux(_decExNop_decOut_T_4, UInt<1>("h0"), _GEN_238) @[Functions.scala 30:20 34:20]
    node _GEN_248 = mux(_decExNop_decOut_T_4, UInt<1>("h0"), _GEN_239) @[Functions.scala 31:20 34:20]
    node _GEN_249 = mux(_decExNop_decOut_T_3, UInt<1>("h1"), _GEN_240) @[Functions.scala 34:20 53:26]
    node _GEN_250 = mux(_decExNop_decOut_T_3, UInt<1>("h1"), _GEN_242) @[Functions.scala 34:20 54:24]
    node _GEN_251 = mux(_decExNop_decOut_T_3, UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 24:19 34:20 55:23]
    node _GEN_252 = mux(_decExNop_decOut_T_3, UInt<1>("h0"), _GEN_241) @[Functions.scala 25:20 34:20]
    node _GEN_253 = mux(_decExNop_decOut_T_3, UInt<1>("h0"), _GEN_243) @[Functions.scala 22:18 34:20]
    node _GEN_254 = mux(_decExNop_decOut_T_3, UInt<1>("h0"), _GEN_244) @[Functions.scala 23:20 34:20]
    node _GEN_255 = mux(_decExNop_decOut_T_3, UInt<1>("h0"), _GEN_245) @[Functions.scala 27:18 34:20]
    node _GEN_256 = mux(_decExNop_decOut_T_3, UInt<1>("h0"), _GEN_246) @[Functions.scala 21:18 34:20]
    node _GEN_257 = mux(_decExNop_decOut_T_3, UInt<1>("h0"), _GEN_247) @[Functions.scala 30:20 34:20]
    node _GEN_258 = mux(_decExNop_decOut_T_3, UInt<1>("h0"), _GEN_248) @[Functions.scala 31:20 34:20]
    node _GEN_259 = mux(_decExNop_decOut_T_2, UInt<2>("h3"), _GEN_249) @[Functions.scala 34:20 48:26]
    node _GEN_260 = mux(_decExNop_decOut_T_2, UInt<1>("h1"), _GEN_256) @[Functions.scala 34:20 49:22]
    node _GEN_261 = mux(_decExNop_decOut_T_2, UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 34:20 26:21 50:25]
    node _GEN_262 = mux(_decExNop_decOut_T_2, UInt<1>("h0"), _GEN_250) @[Functions.scala 29:20 34:20]
    node _GEN_263 = mux(_decExNop_decOut_T_2, UInt<1>("h0"), _GEN_251) @[Functions.scala 24:19 34:20]
    node _GEN_264 = mux(_decExNop_decOut_T_2, UInt<1>("h0"), _GEN_252) @[Functions.scala 25:20 34:20]
    node _GEN_265 = mux(_decExNop_decOut_T_2, UInt<1>("h0"), _GEN_253) @[Functions.scala 22:18 34:20]
    node _GEN_266 = mux(_decExNop_decOut_T_2, UInt<1>("h0"), _GEN_254) @[Functions.scala 23:20 34:20]
    node _GEN_267 = mux(_decExNop_decOut_T_2, UInt<1>("h0"), _GEN_255) @[Functions.scala 27:18 34:20]
    node _GEN_268 = mux(_decExNop_decOut_T_2, UInt<1>("h0"), _GEN_256) @[Functions.scala 28:19 34:20]
    node _GEN_269 = mux(_decExNop_decOut_T_2, UInt<1>("h0"), _GEN_257) @[Functions.scala 30:20 34:20]
    node _GEN_270 = mux(_decExNop_decOut_T_2, UInt<1>("h0"), _GEN_258) @[Functions.scala 31:20 34:20]
    node _GEN_271 = mux(_decExNop_decOut_T_1, UInt<1>("h0"), _GEN_259) @[Functions.scala 34:20 42:26]
    node _GEN_272 = mux(_decExNop_decOut_T_1, UInt<1>("h1"), _GEN_262) @[Functions.scala 34:20 43:24]
    node _GEN_273 = mux(_decExNop_decOut_T_1, UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 34:20 32:21 44:25]
    node _GEN_274 = mux(_decExNop_decOut_T_1, UInt<1>("h0"), _GEN_260) @[Functions.scala 21:18 34:20]
    node _GEN_275 = mux(_decExNop_decOut_T_1, UInt<1>("h0"), _GEN_261) @[Functions.scala 34:20 26:21]
    node _GEN_276 = mux(_decExNop_decOut_T_1, UInt<1>("h0"), _GEN_263) @[Functions.scala 24:19 34:20]
    node _GEN_277 = mux(_decExNop_decOut_T_1, UInt<1>("h0"), _GEN_264) @[Functions.scala 25:20 34:20]
    node _GEN_278 = mux(_decExNop_decOut_T_1, UInt<1>("h0"), _GEN_265) @[Functions.scala 22:18 34:20]
    node _GEN_279 = mux(_decExNop_decOut_T_1, UInt<1>("h0"), _GEN_266) @[Functions.scala 23:20 34:20]
    node _GEN_280 = mux(_decExNop_decOut_T_1, UInt<1>("h0"), _GEN_267) @[Functions.scala 27:18 34:20]
    node _GEN_281 = mux(_decExNop_decOut_T_1, UInt<1>("h0"), _GEN_268) @[Functions.scala 28:19 34:20]
    node _GEN_282 = mux(_decExNop_decOut_T_1, UInt<1>("h0"), _GEN_269) @[Functions.scala 30:20 34:20]
    node _GEN_283 = mux(_decExNop_decOut_T_1, UInt<1>("h0"), _GEN_270) @[Functions.scala 31:20 34:20]
    node _GEN_284 = mux(_decExNop_decOut_T, UInt<1>("h1"), _GEN_271) @[Functions.scala 34:20 36:26]
    node _GEN_285 = mux(_decExNop_decOut_T, UInt<1>("h1"), _GEN_274) @[Functions.scala 34:20 37:22]
    node _GEN_286 = mux(_decExNop_decOut_T, UInt<1>("h1"), _GEN_272) @[Functions.scala 34:20 38:24]
    node _GEN_287 = mux(_decExNop_decOut_T, UInt<1>("h1"), _GEN_273) @[Functions.scala 34:20 39:25]
    node _GEN_288 = mux(_decExNop_decOut_T, UInt<1>("h0"), _GEN_273) @[Functions.scala 34:20 33:21]
    node _GEN_289 = mux(_decExNop_decOut_T, UInt<1>("h0"), _GEN_275) @[Functions.scala 34:20 26:21]
    node _GEN_290 = mux(_decExNop_decOut_T, UInt<1>("h0"), _GEN_276) @[Functions.scala 24:19 34:20]
    node _GEN_291 = mux(_decExNop_decOut_T, UInt<1>("h0"), _GEN_277) @[Functions.scala 25:20 34:20]
    node _GEN_292 = mux(_decExNop_decOut_T, UInt<1>("h0"), _GEN_278) @[Functions.scala 22:18 34:20]
    node _GEN_293 = mux(_decExNop_decOut_T, UInt<1>("h0"), _GEN_279) @[Functions.scala 23:20 34:20]
    node _GEN_294 = mux(_decExNop_decOut_T, UInt<1>("h0"), _GEN_280) @[Functions.scala 27:18 34:20]
    node _GEN_295 = mux(_decExNop_decOut_T, UInt<1>("h0"), _GEN_281) @[Functions.scala 28:19 34:20]
    node _GEN_296 = mux(_decExNop_decOut_T, UInt<1>("h0"), _GEN_282) @[Functions.scala 30:20 34:20]
    node _GEN_297 = mux(_decExNop_decOut_T, UInt<1>("h0"), _GEN_283) @[Functions.scala 31:20 34:20]
    node _decExNop_decOut_decOut_aluOp_T = eq(UInt<1>("h0"), UInt<3>("h0")) @[Functions.scala 104:19]
    node _decExNop_decOut_decOut_aluOp_T_1 = neq(UInt<7>("h13"), UInt<5>("h13")) @[Functions.scala 107:21]
    node _decExNop_decOut_decOut_aluOp_T_2 = neq(UInt<7>("h13"), UInt<7>("h67")) @[Functions.scala 107:44]
    node _decExNop_decOut_decOut_aluOp_T_3 = and(_decExNop_decOut_decOut_aluOp_T_1, _decExNop_decOut_decOut_aluOp_T_2) @[Functions.scala 107:34]
    node _decExNop_decOut_decOut_aluOp_T_4 = neq(UInt<7>("h0"), UInt<1>("h0")) @[Functions.scala 107:64]
    node _decExNop_decOut_decOut_aluOp_T_5 = and(_decExNop_decOut_decOut_aluOp_T_3, _decExNop_decOut_decOut_aluOp_T_4) @[Functions.scala 107:55]
    node _GEN_298 = mux(_decExNop_decOut_decOut_aluOp_T_5, UInt<1>("h1"), UInt<1>("h0")) @[Functions.scala 106:15 107:73 108:17]
    node _decExNop_decOut_decOut_aluOp_T_6 = eq(UInt<1>("h1"), UInt<3>("h0")) @[Functions.scala 104:19]
    node _decExNop_decOut_decOut_aluOp_T_7 = eq(UInt<2>("h2"), UInt<3>("h0")) @[Functions.scala 104:19]
    node _decExNop_decOut_decOut_aluOp_T_8 = eq(UInt<2>("h3"), UInt<3>("h0")) @[Functions.scala 104:19]
    node _decExNop_decOut_decOut_aluOp_T_9 = eq(UInt<3>("h4"), UInt<3>("h0")) @[Functions.scala 104:19]
    node _decExNop_decOut_decOut_aluOp_T_10 = eq(UInt<3>("h5"), UInt<3>("h0")) @[Functions.scala 104:19]
    node _decExNop_decOut_decOut_aluOp_T_11 = eq(UInt<7>("h0"), UInt<1>("h0")) @[Functions.scala 124:20]
    node _GEN_299 = mux(_decExNop_decOut_decOut_aluOp_T_11, UInt<3>("h6"), UInt<3>("h7")) @[Functions.scala 124:29 125:17 127:17]
    node _decExNop_decOut_decOut_aluOp_T_12 = eq(UInt<3>("h6"), UInt<3>("h0")) @[Functions.scala 104:19]
    node _decExNop_decOut_decOut_aluOp_T_13 = eq(UInt<3>("h7"), UInt<3>("h0")) @[Functions.scala 104:19]
    node _GEN_300 = mux(_decExNop_decOut_decOut_aluOp_T_13, UInt<4>("h9"), UInt<1>("h0")) @[Functions.scala 104:19 134:15 103:28]
    node _GEN_301 = mux(_decExNop_decOut_decOut_aluOp_T_12, UInt<4>("h8"), _GEN_300) @[Functions.scala 104:19 131:15]
    node _GEN_302 = mux(_decExNop_decOut_decOut_aluOp_T_10, _GEN_299, _GEN_301) @[Functions.scala 104:19]
    node _GEN_303 = mux(_decExNop_decOut_decOut_aluOp_T_9, UInt<3>("h5"), _GEN_302) @[Functions.scala 104:19 121:15]
    node _GEN_304 = mux(_decExNop_decOut_decOut_aluOp_T_8, UInt<3>("h4"), _GEN_303) @[Functions.scala 104:19 118:15]
    node _GEN_305 = mux(_decExNop_decOut_decOut_aluOp_T_7, UInt<2>("h3"), _GEN_304) @[Functions.scala 104:19 115:15]
    node _GEN_306 = mux(_decExNop_decOut_decOut_aluOp_T_6, UInt<2>("h2"), _GEN_305) @[Functions.scala 104:19 112:15]
    node _GEN_307 = mux(_decExNop_decOut_decOut_aluOp_T, _GEN_298, _GEN_306) @[Functions.scala 104:19]
    node _decExNop_decOut_decOut_imm_imm_T = asSInt(UInt<12>("h0")) @[Functions.scala 169:32]
    node decExNop_decOut_decOut_instrType = _GEN_284 @[Functions.scala 19:22]
    node _decExNop_decOut_decOut_imm_T = eq(UInt<1>("h1"), decExNop_decOut_decOut_instrType) @[Functions.scala 170:23]
    node _decExNop_decOut_decOut_imm_imm_T_1 = mux(UInt<1>("h0"), UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 77:12]
    node _decExNop_decOut_decOut_imm_imm_T_2 = cat(_decExNop_decOut_decOut_imm_imm_T_1, UInt<12>("h0")) @[Functions.scala 172:43]
    node _decExNop_decOut_decOut_imm_imm_T_3 = asSInt(_decExNop_decOut_decOut_imm_imm_T_2) @[Functions.scala 172:67]
    node _decExNop_decOut_decOut_imm_T_1 = eq(UInt<2>("h2"), decExNop_decOut_decOut_instrType) @[Functions.scala 170:23]
    node _decExNop_decOut_decOut_imm_imm_T_4 = mux(UInt<1>("h0"), UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 77:12]
    node _decExNop_decOut_decOut_imm_imm_T_5 = cat(_decExNop_decOut_decOut_imm_imm_T_4, UInt<7>("h0")) @[Functions.scala 175:43]
    node _decExNop_decOut_decOut_imm_imm_T_6 = cat(_decExNop_decOut_decOut_imm_imm_T_5, UInt<5>("h0")) @[Functions.scala 175:66]
    node _decExNop_decOut_decOut_imm_imm_T_7 = asSInt(_decExNop_decOut_decOut_imm_imm_T_6) @[Functions.scala 175:89]
    node _decExNop_decOut_decOut_imm_T_2 = eq(UInt<2>("h3"), decExNop_decOut_decOut_instrType) @[Functions.scala 170:23]
    node _decExNop_decOut_decOut_imm_imm_T_8 = mux(UInt<1>("h0"), UInt<19>("h7ffff"), UInt<19>("h0")) @[Bitwise.scala 77:12]
    node _decExNop_decOut_decOut_imm_imm_T_9 = cat(_decExNop_decOut_decOut_imm_imm_T_8, UInt<1>("h0")) @[Functions.scala 178:43]
    node _decExNop_decOut_decOut_imm_imm_T_10 = cat(_decExNop_decOut_decOut_imm_imm_T_9, UInt<6>("h0")) @[Functions.scala 178:61]
    node _decExNop_decOut_decOut_imm_imm_T_11 = cat(_decExNop_decOut_decOut_imm_imm_T_10, UInt<4>("h0")) @[Functions.scala 178:84]
    node _decExNop_decOut_decOut_imm_imm_T_12 = cat(_decExNop_decOut_decOut_imm_imm_T_11, UInt<1>("h0")) @[Functions.scala 178:106]
    node _decExNop_decOut_decOut_imm_imm_T_13 = asSInt(_decExNop_decOut_decOut_imm_imm_T_12) @[Functions.scala 178:119]
    node _decExNop_decOut_decOut_imm_T_3 = eq(UInt<3>("h4"), decExNop_decOut_decOut_instrType) @[Functions.scala 170:23]
    node _decExNop_decOut_decOut_imm_imm_T_14 = mux(UInt<1>("h0"), UInt<12>("hfff"), UInt<12>("h0")) @[Bitwise.scala 77:12]
    node _decExNop_decOut_decOut_imm_imm_T_15 = cat(UInt<20>("h0"), _decExNop_decOut_decOut_imm_imm_T_14) @[Functions.scala 181:37]
    node _decExNop_decOut_decOut_imm_imm_T_16 = asSInt(_decExNop_decOut_decOut_imm_imm_T_15) @[Functions.scala 181:55]
    node _decExNop_decOut_decOut_imm_T_4 = eq(UInt<3>("h5"), decExNop_decOut_decOut_instrType) @[Functions.scala 170:23]
    node _decExNop_decOut_decOut_imm_imm_T_17 = mux(UInt<1>("h0"), UInt<11>("h7ff"), UInt<11>("h0")) @[Bitwise.scala 77:12]
    node _decExNop_decOut_decOut_imm_imm_T_18 = cat(_decExNop_decOut_decOut_imm_imm_T_17, UInt<8>("h0")) @[Functions.scala 184:43]
    node _decExNop_decOut_decOut_imm_imm_T_19 = cat(_decExNop_decOut_decOut_imm_imm_T_18, UInt<1>("h0")) @[Functions.scala 184:66]
    node _decExNop_decOut_decOut_imm_imm_T_20 = cat(_decExNop_decOut_decOut_imm_imm_T_19, UInt<10>("h0")) @[Functions.scala 184:85]
    node _decExNop_decOut_decOut_imm_imm_T_21 = cat(_decExNop_decOut_decOut_imm_imm_T_20, UInt<1>("h0")) @[Functions.scala 184:108]
    node _decExNop_decOut_decOut_imm_imm_T_22 = asSInt(_decExNop_decOut_decOut_imm_imm_T_21) @[Functions.scala 184:121]
    node _GEN_308 = mux(_decExNop_decOut_decOut_imm_T_4, _decExNop_decOut_decOut_imm_imm_T_22, _decExNop_decOut_decOut_imm_imm_T) @[Functions.scala 170:23 184:13 169:9]
    node _GEN_309 = mux(_decExNop_decOut_decOut_imm_T_3, _decExNop_decOut_decOut_imm_imm_T_16, _GEN_308) @[Functions.scala 170:23 181:13]
    node _GEN_310 = mux(_decExNop_decOut_decOut_imm_T_2, _decExNop_decOut_decOut_imm_imm_T_13, _GEN_309) @[Functions.scala 170:23 178:13]
    node _GEN_311 = mux(_decExNop_decOut_decOut_imm_T_1, _decExNop_decOut_decOut_imm_imm_T_7, _GEN_310) @[Functions.scala 170:23 175:13]
    node _GEN_312 = mux(_decExNop_decOut_decOut_imm_T, _decExNop_decOut_decOut_imm_imm_T_3, _GEN_311) @[Functions.scala 170:23 172:13]
    reg decExReg__decOut_instrType : UInt<3>, clock with :
      reset => (UInt<1>("h0"), decExReg__decOut_instrType) @[ThreeCats.scala 125:25]
    reg decExReg__decOut_isStore : UInt<1>, clock with :
      reset => (UInt<1>("h0"), decExReg__decOut_isStore) @[ThreeCats.scala 125:25]
    reg decExReg__decOut_isECall : UInt<1>, clock with :
      reset => (UInt<1>("h0"), decExReg__decOut_isECall) @[ThreeCats.scala 125:25]
    reg decExReg__decOut_rs1Valid : UInt<1>, clock with :
      reset => (UInt<1>("h0"), decExReg__decOut_rs1Valid) @[ThreeCats.scala 125:25]
    reg decExReg__decOut_rs2Valid : UInt<1>, clock with :
      reset => (UInt<1>("h0"), decExReg__decOut_rs2Valid) @[ThreeCats.scala 125:25]
    node decExNop_decOut_instrType = decExNop_decOut_decOut_instrType @[ThreeCats.scala 123:30 124:19]
    node decEx_decOut_instrType = decOut_instrType @[ThreeCats.scala 76:19 89:16]
    node _decExReg_T_decOut_instrType = mux(doBranch, decExNop_decOut_instrType, decEx_decOut_instrType) @[ThreeCats.scala 126:18]
    node decExNop_decOut_decOut_aluOp_aluOp = _GEN_307 @[Functions.scala 103:28]
    node decExNop_decOut_decOut_aluOp = decExNop_decOut_decOut_aluOp_aluOp @[Functions.scala 19:22 92:18]
    node decExNop_decOut_aluOp = decExNop_decOut_decOut_aluOp @[ThreeCats.scala 123:30 124:19]
    node decOut_decOut_aluOp_aluOp = _GEN_176 @[Functions.scala 103:28]
    node decOut_aluOp = decOut_decOut_aluOp_aluOp @[Functions.scala 19:22 92:18]
    node decEx_decOut_aluOp = decOut_aluOp @[ThreeCats.scala 76:19 89:16]
    node _decExReg_T_decOut_aluOp = mux(doBranch, decExNop_decOut_aluOp, decEx_decOut_aluOp) @[ThreeCats.scala 126:18]
    node decExNop_decOut_decOut_imm_imm = _GEN_312 @[Functions.scala 168:19]
    node decExNop_decOut_decOut_imm = decExNop_decOut_decOut_imm_imm @[Functions.scala 19:22 93:16]
    node decExNop_decOut_imm = decExNop_decOut_decOut_imm @[ThreeCats.scala 123:30 124:19]
    node decEx_decOut_imm = decOut_imm @[ThreeCats.scala 76:19 89:16]
    node _decExReg_T_decOut_imm = mux(doBranch, decExNop_decOut_imm, decEx_decOut_imm) @[ThreeCats.scala 126:18]
    node decExNop_decOut_decOut_isImm = _GEN_285 @[Functions.scala 19:22]
    node decExNop_decOut_isImm = decExNop_decOut_decOut_isImm @[ThreeCats.scala 123:30 124:19]
    node decOut_isImm = _GEN_154 @[Functions.scala 19:22]
    node decEx_decOut_isImm = decOut_isImm @[ThreeCats.scala 76:19 89:16]
    node _decExReg_T_decOut_isImm = mux(doBranch, decExNop_decOut_isImm, decEx_decOut_isImm) @[ThreeCats.scala 126:18]
    node decExNop_decOut_decOut_isLui = _GEN_292 @[Functions.scala 19:22]
    node decExNop_decOut_isLui = decExNop_decOut_decOut_isLui @[ThreeCats.scala 123:30 124:19]
    node decOut_isLui = _GEN_161 @[Functions.scala 19:22]
    node decEx_decOut_isLui = decOut_isLui @[ThreeCats.scala 76:19 89:16]
    node _decExReg_T_decOut_isLui = mux(doBranch, decExNop_decOut_isLui, decEx_decOut_isLui) @[ThreeCats.scala 126:18]
    node decExNop_decOut_decOut_isAuiPc = _GEN_293 @[Functions.scala 19:22]
    node decExNop_decOut_isAuiPc = decExNop_decOut_decOut_isAuiPc @[ThreeCats.scala 123:30 124:19]
    node decOut_isAuiPc = _GEN_162 @[Functions.scala 19:22]
    node decEx_decOut_isAuiPc = decOut_isAuiPc @[ThreeCats.scala 76:19 89:16]
    node _decExReg_T_decOut_isAuiPc = mux(doBranch, decExNop_decOut_isAuiPc, decEx_decOut_isAuiPc) @[ThreeCats.scala 126:18]
    node decExNop_decOut_decOut_isLoad = _GEN_290 @[Functions.scala 19:22]
    node decExNop_decOut_isLoad = decExNop_decOut_decOut_isLoad @[ThreeCats.scala 123:30 124:19]
    node decEx_decOut_isLoad = decOut_isLoad @[ThreeCats.scala 76:19 89:16]
    node _decExReg_T_decOut_isLoad = mux(doBranch, decExNop_decOut_isLoad, decEx_decOut_isLoad) @[ThreeCats.scala 126:18]
    node decExNop_decOut_decOut_isStore = _GEN_291 @[Functions.scala 19:22]
    node decExNop_decOut_isStore = decExNop_decOut_decOut_isStore @[ThreeCats.scala 123:30 124:19]
    node decEx_decOut_isStore = decOut_isStore @[ThreeCats.scala 76:19 89:16]
    node _decExReg_T_decOut_isStore = mux(doBranch, decExNop_decOut_isStore, decEx_decOut_isStore) @[ThreeCats.scala 126:18]
    node decExNop_decOut_decOut_isBranch = _GEN_289 @[Functions.scala 19:22]
    node decExNop_decOut_isBranch = decExNop_decOut_decOut_isBranch @[ThreeCats.scala 123:30 124:19]
    node decOut_isBranch = _GEN_158 @[Functions.scala 19:22]
    node decEx_decOut_isBranch = decOut_isBranch @[ThreeCats.scala 76:19 89:16]
    node _decExReg_T_decOut_isBranch = mux(doBranch, decExNop_decOut_isBranch, decEx_decOut_isBranch) @[ThreeCats.scala 126:18]
    node decExNop_decOut_decOut_isJal = _GEN_294 @[Functions.scala 19:22]
    node decExNop_decOut_isJal = decExNop_decOut_decOut_isJal @[ThreeCats.scala 123:30 124:19]
    node decOut_isJal = _GEN_163 @[Functions.scala 19:22]
    node decEx_decOut_isJal = decOut_isJal @[ThreeCats.scala 76:19 89:16]
    node _decExReg_T_decOut_isJal = mux(doBranch, decExNop_decOut_isJal, decEx_decOut_isJal) @[ThreeCats.scala 126:18]
    node decExNop_decOut_decOut_isJalr = _GEN_295 @[Functions.scala 19:22]
    node decExNop_decOut_isJalr = decExNop_decOut_decOut_isJalr @[ThreeCats.scala 123:30 124:19]
    node decOut_isJalr = _GEN_164 @[Functions.scala 19:22]
    node decEx_decOut_isJalr = decOut_isJalr @[ThreeCats.scala 76:19 89:16]
    node _decExReg_T_decOut_isJalr = mux(doBranch, decExNop_decOut_isJalr, decEx_decOut_isJalr) @[ThreeCats.scala 126:18]
    node decExNop_decOut_decOut_rfWrite = _GEN_286 @[Functions.scala 19:22]
    node decExNop_decOut_rfWrite = decExNop_decOut_decOut_rfWrite @[ThreeCats.scala 123:30 124:19]
    node decOut_rfWrite = _GEN_155 @[Functions.scala 19:22]
    node decEx_decOut_rfWrite = decOut_rfWrite @[ThreeCats.scala 76:19 89:16]
    node _decExReg_T_decOut_rfWrite = mux(doBranch, decExNop_decOut_rfWrite, decEx_decOut_rfWrite) @[ThreeCats.scala 126:18]
    node decExNop_decOut_decOut_isECall = _GEN_296 @[Functions.scala 19:22]
    node decExNop_decOut_isECall = decExNop_decOut_decOut_isECall @[ThreeCats.scala 123:30 124:19]
    node decOut_isECall = _GEN_165 @[Functions.scala 19:22]
    node decEx_decOut_isECall = decOut_isECall @[ThreeCats.scala 76:19 89:16]
    node _decExReg_T_decOut_isECall = mux(doBranch, decExNop_decOut_isECall, decEx_decOut_isECall) @[ThreeCats.scala 126:18]
    node decExNop_decOut_decOut_isCssrw = _GEN_297 @[Functions.scala 19:22]
    node decExNop_decOut_isCssrw = decExNop_decOut_decOut_isCssrw @[ThreeCats.scala 123:30 124:19]
    node decOut_isCssrw = _GEN_166 @[Functions.scala 19:22]
    node decEx_decOut_isCssrw = decOut_isCssrw @[ThreeCats.scala 76:19 89:16]
    node _decExReg_T_decOut_isCssrw = mux(doBranch, decExNop_decOut_isCssrw, decEx_decOut_isCssrw) @[ThreeCats.scala 126:18]
    node decExNop_decOut_decOut_rs1Valid = _GEN_287 @[Functions.scala 19:22]
    node decExNop_decOut_rs1Valid = decExNop_decOut_decOut_rs1Valid @[ThreeCats.scala 123:30 124:19]
    node decOut_rs1Valid = _GEN_156 @[Functions.scala 19:22]
    node decEx_decOut_rs1Valid = decOut_rs1Valid @[ThreeCats.scala 76:19 89:16]
    node _decExReg_T_decOut_rs1Valid = mux(doBranch, decExNop_decOut_rs1Valid, decEx_decOut_rs1Valid) @[ThreeCats.scala 126:18]
    node decExNop_decOut_decOut_rs2Valid = _GEN_288 @[Functions.scala 19:22]
    node decExNop_decOut_rs2Valid = decExNop_decOut_decOut_rs2Valid @[ThreeCats.scala 123:30 124:19]
    node decOut_rs2Valid = _GEN_157 @[Functions.scala 19:22]
    node decEx_decOut_rs2Valid = decOut_rs2Valid @[ThreeCats.scala 76:19 89:16]
    node _decExReg_T_decOut_rs2Valid = mux(doBranch, decExNop_decOut_rs2Valid, decEx_decOut_rs2Valid) @[ThreeCats.scala 126:18]
    node decExNop_valid = UInt<1>("h0") @[ThreeCats.scala 123:{30,30}]
    node decEx_valid = _decEx_valid_T @[ThreeCats.scala 76:19 90:15]
    node _decExReg_T_valid = mux(doBranch, decExNop_valid, decEx_valid) @[ThreeCats.scala 126:18]
    node decExNop_pc = UInt<32>("h0") @[ThreeCats.scala 123:{30,30}]
    node decEx_pc = pcRegReg @[ThreeCats.scala 76:19 91:12]
    node _decExReg_T_pc = mux(doBranch, decExNop_pc, decEx_pc) @[ThreeCats.scala 126:18]
    node decExNop_rs1 = UInt<5>("h0") @[ThreeCats.scala 123:{30,30}]
    node _decExReg_T_rs1 = mux(doBranch, decExNop_rs1, decEx_rs1) @[ThreeCats.scala 126:18]
    node decExNop_rs2 = UInt<5>("h0") @[ThreeCats.scala 123:{30,30}]
    node _decExReg_T_rs2 = mux(doBranch, decExNop_rs2, decEx_rs2) @[ThreeCats.scala 126:18]
    node decExNop_rd = UInt<5>("h0") @[ThreeCats.scala 123:{30,30}]
    node decEx_rd = _decEx_rd_T @[ThreeCats.scala 76:19 94:12]
    node _decExReg_T_rd = mux(doBranch, decExNop_rd, decEx_rd) @[ThreeCats.scala 126:18]
    node decExNop_rs1Val = UInt<32>("h0") @[ThreeCats.scala 123:{30,30}]
    node decEx_rs1Val = rs1Val @[ThreeCats.scala 76:19 95:16]
    node _decExReg_T_rs1Val = mux(doBranch, decExNop_rs1Val, decEx_rs1Val) @[ThreeCats.scala 126:18]
    node decExNop_rs2Val = UInt<32>("h0") @[ThreeCats.scala 123:{30,30}]
    node decEx_rs2Val = rs2Val @[ThreeCats.scala 76:19 96:16]
    node _decExReg_T_rs2Val = mux(doBranch, decExNop_rs2Val, decEx_rs2Val) @[ThreeCats.scala 126:18]
    node decExNop_csrVal = UInt<32>("h0") @[ThreeCats.scala 123:{30,30}]
    node decEx_csrVal = csr.io_data @[ThreeCats.scala 76:19 97:16]
    node _decExReg_T_csrVal = mux(doBranch, decExNop_csrVal, decEx_csrVal) @[ThreeCats.scala 126:18]
    node decExNop_func3 = UInt<3>("h0") @[ThreeCats.scala 123:{30,30}]
    node _decExReg_T_func3 = mux(doBranch, decExNop_func3, decEx_func3) @[ThreeCats.scala 126:18]
    node decExNop_memLow = UInt<2>("h0") @[ThreeCats.scala 123:{30,30}]
    node decEx_memLow = _decEx_memLow_T @[ThreeCats.scala 105:16 76:19]
    node _decExReg_T_memLow = mux(doBranch, decExNop_memLow, decEx_memLow) @[ThreeCats.scala 126:18]
    node _exFwdReg_valid_T = neq(wbDest, UInt<1>("h0")) @[ThreeCats.scala 165:38]
    node _exFwdReg_valid_T_1 = and(wrEna, _exFwdReg_valid_T) @[ThreeCats.scala 165:27]
    node _GEN_351 = mux(firstIter, UInt<1>("h0"), firstIter) @[ThreeCats.scala 173:19 174:15 47:26]
    node stall = UInt<1>("h0") @[ThreeCats.scala 26:{26,26}]
    node _exFwdReg_WIRE_valid = UInt<1>("h0") @[ThreeCats.scala 40:{38,38}]
    node _exFwdReg_WIRE_wbDest = UInt<5>("h0") @[ThreeCats.scala 40:{38,38}]
    node _exFwdReg_WIRE_wbData = UInt<32>("h0") @[ThreeCats.scala 40:{38,38}]
    node pcNext = _GEN_2 @[ThreeCats.scala 46:27]
    node _debugRegs_WIRE_0 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_1 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_2 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_3 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_4 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_5 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_6 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_7 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_8 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_9 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_10 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_11 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_12 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_13 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_14 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_15 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_16 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_17 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_18 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_19 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_20 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_21 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_22 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_23 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_24 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_25 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_26 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_27 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_28 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_29 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_30 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    node _debugRegs_WIRE_31 = UInt<32>("h0") @[Functions.scala 195:{38,38}]
    io_imem_address <= pcNext @[ThreeCats.scala 49:19]
    io_dmem_rdAddress <= memAddress @[ThreeCats.scala 107:21]
    io_dmem_rdEnable <= _GEN_182
    io_dmem_wrAddress <= memAddress @[ThreeCats.scala 109:21]
    io_dmem_wrData <= _GEN_204
    io_dmem_wrEnable_0 <= _GEN_205
    io_dmem_wrEnable_1 <= _GEN_206
    io_dmem_wrEnable_2 <= _GEN_207
    io_dmem_wrEnable_3 <= _GEN_208
    doBranch_0 <= doBranch
    decExReg_decOut_isECall <= decExReg__decOut_isECall
    instrReg_0 <= instrReg
    instr_0 <= instr
    decExReg_pc <= decExReg__pc
    cyclesReg_0 <= cyclesReg
    pcReg_0 <= pcReg
    pcRegReg_0 <= pcRegReg
    debugRegs_0_0 <= debugRegs_0
    debugRegs_0_1 <= debugRegs_1
    debugRegs_0_2 <= debugRegs_2
    debugRegs_0_3 <= debugRegs_3
    debugRegs_0_4 <= debugRegs_4
    debugRegs_0_5 <= debugRegs_5
    debugRegs_0_6 <= debugRegs_6
    debugRegs_0_7 <= debugRegs_7
    debugRegs_0_8 <= debugRegs_8
    debugRegs_0_9 <= debugRegs_9
    debugRegs_0_10 <= debugRegs_10
    debugRegs_0_11 <= debugRegs_11
    debugRegs_0_12 <= debugRegs_12
    debugRegs_0_13 <= debugRegs_13
    debugRegs_0_14 <= debugRegs_14
    debugRegs_0_15 <= debugRegs_15
    debugRegs_0_16 <= debugRegs_16
    debugRegs_0_17 <= debugRegs_17
    debugRegs_0_18 <= debugRegs_18
    debugRegs_0_19 <= debugRegs_19
    debugRegs_0_20 <= debugRegs_20
    debugRegs_0_21 <= debugRegs_21
    debugRegs_0_22 <= debugRegs_22
    debugRegs_0_23 <= debugRegs_23
    debugRegs_0_24 <= debugRegs_24
    debugRegs_0_25 <= debugRegs_25
    debugRegs_0_26 <= debugRegs_26
    debugRegs_0_27 <= debugRegs_27
    debugRegs_0_28 <= debugRegs_28
    debugRegs_0_29 <= debugRegs_29
    debugRegs_0_30 <= debugRegs_30
    debugRegs_0_31 <= debugRegs_31
    cyclesReg <= mux(reset, UInt<32>("h0"), _cyclesReg_T_1) @[ThreeCats.scala 22:{26,26} 23:13]
    exFwdReg_valid <= mux(reset, _exFwdReg_WIRE_valid, _exFwdReg_valid_T_1) @[ThreeCats.scala 165:18 40:{25,25}]
    exFwdReg_wbDest <= mux(reset, _exFwdReg_WIRE_wbDest, wbDest) @[ThreeCats.scala 166:19 40:{25,25}]
    exFwdReg_wbData <= mux(reset, _exFwdReg_WIRE_wbData, wbData) @[ThreeCats.scala 167:19 40:{25,25}]
    pcReg <= mux(reset, _pcReg_T_2, pcNext) @[ThreeCats.scala 45:{22,22} 48:9]
    firstIter <= mux(reset, UInt<1>("h1"), _GEN_351) @[ThreeCats.scala 47:{26,26}]
    pcRegReg <= pcReg @[ThreeCats.scala 62:25]
    instrReg <= mux(reset, UInt<5>("h13"), _instrReg_T) @[ThreeCats.scala 63:{25,25} 64:12]
    regs.rs1Val_MPORT.addr <= _GEN_5
    regs.rs1Val_MPORT.en <= _GEN_4
    regs.rs1Val_MPORT.clk <= _GEN_6
    regs.rs2Val_MPORT.addr <= _GEN_8
    regs.rs2Val_MPORT.en <= _GEN_4
    regs.rs2Val_MPORT.clk <= _GEN_6
    regs.MPORT.addr <= _GEN_41
    regs.MPORT.en <= _GEN_43
    regs.MPORT.clk <= _GEN_42
    regs.MPORT.data <= _GEN_45
    regs.MPORT.mask <= _GEN_44
    debugRegs_0 <= mux(reset, _debugRegs_WIRE_0, _GEN_46) @[Functions.scala 195:{30,30}]
    debugRegs_1 <= mux(reset, _debugRegs_WIRE_1, _GEN_47) @[Functions.scala 195:{30,30}]
    debugRegs_2 <= mux(reset, _debugRegs_WIRE_2, _GEN_48) @[Functions.scala 195:{30,30}]
    debugRegs_3 <= mux(reset, _debugRegs_WIRE_3, _GEN_49) @[Functions.scala 195:{30,30}]
    debugRegs_4 <= mux(reset, _debugRegs_WIRE_4, _GEN_50) @[Functions.scala 195:{30,30}]
    debugRegs_5 <= mux(reset, _debugRegs_WIRE_5, _GEN_51) @[Functions.scala 195:{30,30}]
    debugRegs_6 <= mux(reset, _debugRegs_WIRE_6, _GEN_52) @[Functions.scala 195:{30,30}]
    debugRegs_7 <= mux(reset, _debugRegs_WIRE_7, _GEN_53) @[Functions.scala 195:{30,30}]
    debugRegs_8 <= mux(reset, _debugRegs_WIRE_8, _GEN_54) @[Functions.scala 195:{30,30}]
    debugRegs_9 <= mux(reset, _debugRegs_WIRE_9, _GEN_55) @[Functions.scala 195:{30,30}]
    debugRegs_10 <= mux(reset, _debugRegs_WIRE_10, _GEN_56) @[Functions.scala 195:{30,30}]
    debugRegs_11 <= mux(reset, _debugRegs_WIRE_11, _GEN_57) @[Functions.scala 195:{30,30}]
    debugRegs_12 <= mux(reset, _debugRegs_WIRE_12, _GEN_58) @[Functions.scala 195:{30,30}]
    debugRegs_13 <= mux(reset, _debugRegs_WIRE_13, _GEN_59) @[Functions.scala 195:{30,30}]
    debugRegs_14 <= mux(reset, _debugRegs_WIRE_14, _GEN_60) @[Functions.scala 195:{30,30}]
    debugRegs_15 <= mux(reset, _debugRegs_WIRE_15, _GEN_61) @[Functions.scala 195:{30,30}]
    debugRegs_16 <= mux(reset, _debugRegs_WIRE_16, _GEN_62) @[Functions.scala 195:{30,30}]
    debugRegs_17 <= mux(reset, _debugRegs_WIRE_17, _GEN_63) @[Functions.scala 195:{30,30}]
    debugRegs_18 <= mux(reset, _debugRegs_WIRE_18, _GEN_64) @[Functions.scala 195:{30,30}]
    debugRegs_19 <= mux(reset, _debugRegs_WIRE_19, _GEN_65) @[Functions.scala 195:{30,30}]
    debugRegs_20 <= mux(reset, _debugRegs_WIRE_20, _GEN_66) @[Functions.scala 195:{30,30}]
    debugRegs_21 <= mux(reset, _debugRegs_WIRE_21, _GEN_67) @[Functions.scala 195:{30,30}]
    debugRegs_22 <= mux(reset, _debugRegs_WIRE_22, _GEN_68) @[Functions.scala 195:{30,30}]
    debugRegs_23 <= mux(reset, _debugRegs_WIRE_23, _GEN_69) @[Functions.scala 195:{30,30}]
    debugRegs_24 <= mux(reset, _debugRegs_WIRE_24, _GEN_70) @[Functions.scala 195:{30,30}]
    debugRegs_25 <= mux(reset, _debugRegs_WIRE_25, _GEN_71) @[Functions.scala 195:{30,30}]
    debugRegs_26 <= mux(reset, _debugRegs_WIRE_26, _GEN_72) @[Functions.scala 195:{30,30}]
    debugRegs_27 <= mux(reset, _debugRegs_WIRE_27, _GEN_73) @[Functions.scala 195:{30,30}]
    debugRegs_28 <= mux(reset, _debugRegs_WIRE_28, _GEN_74) @[Functions.scala 195:{30,30}]
    debugRegs_29 <= mux(reset, _debugRegs_WIRE_29, _GEN_75) @[Functions.scala 195:{30,30}]
    debugRegs_30 <= mux(reset, _debugRegs_WIRE_30, _GEN_76) @[Functions.scala 195:{30,30}]
    debugRegs_31 <= mux(reset, _debugRegs_WIRE_31, _GEN_77) @[Functions.scala 195:{30,30}]
    rs1Val_REG <= rs1 @[Functions.scala 196:31]
    rs2Val_REG <= rs2 @[Functions.scala 197:31]
    csr.clock <= clock
    csr.reset <= reset
    csr.io_address <= _csr_io_address_T @[ThreeCats.scala 71:18]
    decExReg__decOut_instrType <= mux(reset, decExNop_decOut_instrType, _decExReg_T_decOut_instrType) @[ThreeCats.scala 125:{25,25} 126:12]
    decExReg__decOut_aluOp <= mux(reset, decExNop_decOut_aluOp, _decExReg_T_decOut_aluOp) @[ThreeCats.scala 125:{25,25} 126:12]
    decExReg__decOut_imm <= mux(reset, decExNop_decOut_imm, _decExReg_T_decOut_imm) @[ThreeCats.scala 125:{25,25} 126:12]
    decExReg__decOut_isImm <= mux(reset, decExNop_decOut_isImm, _decExReg_T_decOut_isImm) @[ThreeCats.scala 125:{25,25} 126:12]
    decExReg__decOut_isLui <= mux(reset, decExNop_decOut_isLui, _decExReg_T_decOut_isLui) @[ThreeCats.scala 125:{25,25} 126:12]
    decExReg__decOut_isAuiPc <= mux(reset, decExNop_decOut_isAuiPc, _decExReg_T_decOut_isAuiPc) @[ThreeCats.scala 125:{25,25} 126:12]
    decExReg__decOut_isLoad <= mux(reset, decExNop_decOut_isLoad, _decExReg_T_decOut_isLoad) @[ThreeCats.scala 125:{25,25} 126:12]
    decExReg__decOut_isStore <= mux(reset, decExNop_decOut_isStore, _decExReg_T_decOut_isStore) @[ThreeCats.scala 125:{25,25} 126:12]
    decExReg__decOut_isBranch <= mux(reset, decExNop_decOut_isBranch, _decExReg_T_decOut_isBranch) @[ThreeCats.scala 125:{25,25} 126:12]
    decExReg__decOut_isJal <= mux(reset, decExNop_decOut_isJal, _decExReg_T_decOut_isJal) @[ThreeCats.scala 125:{25,25} 126:12]
    decExReg__decOut_isJalr <= mux(reset, decExNop_decOut_isJalr, _decExReg_T_decOut_isJalr) @[ThreeCats.scala 125:{25,25} 126:12]
    decExReg__decOut_rfWrite <= mux(reset, decExNop_decOut_rfWrite, _decExReg_T_decOut_rfWrite) @[ThreeCats.scala 125:{25,25} 126:12]
    decExReg__decOut_isECall <= mux(reset, decExNop_decOut_isECall, _decExReg_T_decOut_isECall) @[ThreeCats.scala 125:{25,25} 126:12]
    decExReg__decOut_isCssrw <= mux(reset, decExNop_decOut_isCssrw, _decExReg_T_decOut_isCssrw) @[ThreeCats.scala 125:{25,25} 126:12]
    decExReg__decOut_rs1Valid <= mux(reset, decExNop_decOut_rs1Valid, _decExReg_T_decOut_rs1Valid) @[ThreeCats.scala 125:{25,25} 126:12]
    decExReg__decOut_rs2Valid <= mux(reset, decExNop_decOut_rs2Valid, _decExReg_T_decOut_rs2Valid) @[ThreeCats.scala 125:{25,25} 126:12]
    decExReg__valid <= mux(reset, decExNop_valid, _decExReg_T_valid) @[ThreeCats.scala 125:{25,25} 126:12]
    decExReg__pc <= mux(reset, decExNop_pc, _decExReg_T_pc) @[ThreeCats.scala 125:{25,25} 126:12]
    decExReg__rs1 <= mux(reset, decExNop_rs1, _decExReg_T_rs1) @[ThreeCats.scala 125:{25,25} 126:12]
    decExReg__rs2 <= mux(reset, decExNop_rs2, _decExReg_T_rs2) @[ThreeCats.scala 125:{25,25} 126:12]
    decExReg__rd <= mux(reset, decExNop_rd, _decExReg_T_rd) @[ThreeCats.scala 125:{25,25} 126:12]
    decExReg__rs1Val <= mux(reset, decExNop_rs1Val, _decExReg_T_rs1Val) @[ThreeCats.scala 125:{25,25} 126:12]
    decExReg__rs2Val <= mux(reset, decExNop_rs2Val, _decExReg_T_rs2Val) @[ThreeCats.scala 125:{25,25} 126:12]
    decExReg__csrVal <= mux(reset, decExNop_csrVal, _decExReg_T_csrVal) @[ThreeCats.scala 125:{25,25} 126:12]
    decExReg__func3 <= mux(reset, decExNop_func3, _decExReg_T_func3) @[ThreeCats.scala 125:{25,25} 126:12]
    decExReg__memLow <= mux(reset, decExNop_memLow, _decExReg_T_memLow) @[ThreeCats.scala 125:{25,25} 126:12]

  module ScratchPadMem :
    input clock : Clock
    input reset : UInt<1>
    input io_rdAddress : UInt<32>
    output io_rdData : UInt<32>
    input io_rdEnable : UInt<1>
    input io_wrAddress : UInt<32>
    input io_wrData : UInt<32>
    input io_wrEnable_0 : UInt<1>
    input io_wrEnable_1 : UInt<1>
    input io_wrEnable_2 : UInt<1>
    input io_wrEnable_3 : UInt<1>
    output io_stall : UInt<1>

    mem MEM : @[ScratchPadMem.scala 14:16]
      data-type => UInt<8>
      depth => 1024
      read-latency => 1
      write-latency => 1
      reader => io_rdData_MPORT_3
      writer => MPORT
      read-under-write => new
    mem MEM_1 : @[ScratchPadMem.scala 15:16]
      data-type => UInt<8>
      depth => 1024
      read-latency => 1
      write-latency => 1
      reader => io_rdData_MPORT_2
      writer => MPORT_1
      read-under-write => new
    mem MEM_2 : @[ScratchPadMem.scala 16:16]
      data-type => UInt<8>
      depth => 1024
      read-latency => 1
      write-latency => 1
      reader => io_rdData_MPORT_1
      writer => MPORT_2
      read-under-write => new
    mem MEM_3 : @[ScratchPadMem.scala 17:16]
      data-type => UInt<8>
      depth => 1024
      read-latency => 1
      write-latency => 1
      reader => io_rdData_MPORT
      writer => MPORT_3
      read-under-write => new
    node _io_rdData_T = bits(io_rdAddress, 12, 2) @[ScratchPadMem.scala 57:41]
    node _GEN_0 = validif(UInt<1>("h1"), _io_rdData_T) @[ScratchPadMem.scala 57:{28,28}]
    node _io_rdData_WIRE = _GEN_0 @[ScratchPadMem.scala 57:28]
    node _io_rdData_T_1 = or(_io_rdData_WIRE, UInt<10>("h0")) @[ScratchPadMem.scala 57:28]
    node _io_rdData_T_2 = bits(_io_rdData_T_1, 9, 0) @[ScratchPadMem.scala 57:28]
    node _GEN_1 = mux(UInt<1>("h1"), UInt<1>("h1"), UInt<1>("h0")) @[ScratchPadMem.scala 17:16 57:{28,28}]
    node _GEN_2 = validif(UInt<1>("h1"), _io_rdData_T_2) @[ScratchPadMem.scala 57:{28,28}]
    node _GEN_3 = validif(UInt<1>("h1"), clock) @[ScratchPadMem.scala 57:{28,28}]
    node _io_rdData_T_3 = bits(io_rdAddress, 12, 2) @[ScratchPadMem.scala 57:81]
    node _GEN_4 = validif(UInt<1>("h1"), _io_rdData_T_3) @[ScratchPadMem.scala 57:{68,68}]
    node _io_rdData_WIRE_1 = _GEN_4 @[ScratchPadMem.scala 57:68]
    node _io_rdData_T_4 = or(_io_rdData_WIRE_1, UInt<10>("h0")) @[ScratchPadMem.scala 57:68]
    node _io_rdData_T_5 = bits(_io_rdData_T_4, 9, 0) @[ScratchPadMem.scala 57:68]
    node _GEN_5 = validif(UInt<1>("h1"), _io_rdData_T_5) @[ScratchPadMem.scala 57:{68,68}]
    node _io_rdData_T_6 = cat(MEM_3.io_rdData_MPORT.data, MEM_2.io_rdData_MPORT_1.data) @[ScratchPadMem.scala 57:53]
    node _io_rdData_T_7 = bits(io_rdAddress, 12, 2) @[ScratchPadMem.scala 57:121]
    node _GEN_6 = validif(UInt<1>("h1"), _io_rdData_T_7) @[ScratchPadMem.scala 57:{108,108}]
    node _io_rdData_WIRE_2 = _GEN_6 @[ScratchPadMem.scala 57:108]
    node _io_rdData_T_8 = or(_io_rdData_WIRE_2, UInt<10>("h0")) @[ScratchPadMem.scala 57:108]
    node _io_rdData_T_9 = bits(_io_rdData_T_8, 9, 0) @[ScratchPadMem.scala 57:108]
    node _GEN_7 = validif(UInt<1>("h1"), _io_rdData_T_9) @[ScratchPadMem.scala 57:{108,108}]
    node _io_rdData_T_10 = cat(_io_rdData_T_6, MEM_1.io_rdData_MPORT_2.data) @[ScratchPadMem.scala 57:93]
    node _io_rdData_T_11 = bits(io_rdAddress, 12, 2) @[ScratchPadMem.scala 57:161]
    node _GEN_8 = validif(UInt<1>("h1"), _io_rdData_T_11) @[ScratchPadMem.scala 57:{148,148}]
    node _io_rdData_WIRE_3 = _GEN_8 @[ScratchPadMem.scala 57:148]
    node _io_rdData_T_12 = or(_io_rdData_WIRE_3, UInt<10>("h0")) @[ScratchPadMem.scala 57:148]
    node _io_rdData_T_13 = bits(_io_rdData_T_12, 9, 0) @[ScratchPadMem.scala 57:148]
    node _GEN_9 = validif(UInt<1>("h1"), _io_rdData_T_13) @[ScratchPadMem.scala 57:{148,148}]
    node _io_rdData_T_14 = cat(_io_rdData_T_10, MEM.io_rdData_MPORT_3.data) @[ScratchPadMem.scala 57:133]
    node _T = bits(io_wrAddress, 12, 2) @[ScratchPadMem.scala 59:31]
    node _T_1 = bits(io_wrData, 7, 0) @[ScratchPadMem.scala 59:52]
    node _T_2 = bits(_T, 9, 0)
    node _GEN_10 = validif(io_wrEnable_0, _T_2) @[ScratchPadMem.scala 58:24]
    node _GEN_11 = validif(io_wrEnable_0, clock) @[ScratchPadMem.scala 58:24]
    node _GEN_12 = mux(io_wrEnable_0, UInt<1>("h1"), UInt<1>("h0")) @[ScratchPadMem.scala 14:16 58:24]
    node _GEN_13 = validif(io_wrEnable_0, UInt<1>("h1")) @[ScratchPadMem.scala 58:24]
    node _GEN_14 = validif(io_wrEnable_0, _T_1) @[ScratchPadMem.scala 58:24]
    node _T_3 = bits(io_wrAddress, 12, 2) @[ScratchPadMem.scala 62:31]
    node _T_4 = bits(io_wrData, 15, 8) @[ScratchPadMem.scala 62:52]
    node _T_5 = bits(_T_3, 9, 0)
    node _GEN_15 = validif(io_wrEnable_1, _T_5) @[ScratchPadMem.scala 61:24]
    node _GEN_16 = validif(io_wrEnable_1, clock) @[ScratchPadMem.scala 61:24]
    node _GEN_17 = mux(io_wrEnable_1, UInt<1>("h1"), UInt<1>("h0")) @[ScratchPadMem.scala 15:16 61:24]
    node _GEN_18 = validif(io_wrEnable_1, UInt<1>("h1")) @[ScratchPadMem.scala 61:24]
    node _GEN_19 = validif(io_wrEnable_1, _T_4) @[ScratchPadMem.scala 61:24]
    node _T_6 = bits(io_wrAddress, 12, 2) @[ScratchPadMem.scala 65:31]
    node _T_7 = bits(io_wrData, 23, 16) @[ScratchPadMem.scala 65:52]
    node _T_8 = bits(_T_6, 9, 0)
    node _GEN_20 = validif(io_wrEnable_2, _T_8) @[ScratchPadMem.scala 64:24]
    node _GEN_21 = validif(io_wrEnable_2, clock) @[ScratchPadMem.scala 64:24]
    node _GEN_22 = mux(io_wrEnable_2, UInt<1>("h1"), UInt<1>("h0")) @[ScratchPadMem.scala 16:16 64:24]
    node _GEN_23 = validif(io_wrEnable_2, UInt<1>("h1")) @[ScratchPadMem.scala 64:24]
    node _GEN_24 = validif(io_wrEnable_2, _T_7) @[ScratchPadMem.scala 64:24]
    node _T_9 = bits(io_wrAddress, 12, 2) @[ScratchPadMem.scala 68:31]
    node _T_10 = bits(io_wrData, 31, 24) @[ScratchPadMem.scala 68:52]
    node _T_11 = bits(_T_9, 9, 0)
    node _GEN_25 = validif(io_wrEnable_3, _T_11) @[ScratchPadMem.scala 67:24]
    node _GEN_26 = validif(io_wrEnable_3, clock) @[ScratchPadMem.scala 67:24]
    node _GEN_27 = mux(io_wrEnable_3, UInt<1>("h1"), UInt<1>("h0")) @[ScratchPadMem.scala 17:16 67:24]
    node _GEN_28 = validif(io_wrEnable_3, UInt<1>("h1")) @[ScratchPadMem.scala 67:24]
    node _GEN_29 = validif(io_wrEnable_3, _T_10) @[ScratchPadMem.scala 67:24]
    io_rdData <= _io_rdData_T_14 @[ScratchPadMem.scala 57:13]
    io_stall <= UInt<1>("h0") @[ScratchPadMem.scala 70:12]
    MEM.io_rdData_MPORT_3.addr <= _GEN_9
    MEM.io_rdData_MPORT_3.en <= _GEN_1
    MEM.io_rdData_MPORT_3.clk <= _GEN_3
    MEM.MPORT.addr <= _GEN_10
    MEM.MPORT.en <= _GEN_12
    MEM.MPORT.clk <= _GEN_11
    MEM.MPORT.data <= _GEN_14
    MEM.MPORT.mask <= _GEN_13
    MEM_1.io_rdData_MPORT_2.addr <= _GEN_7
    MEM_1.io_rdData_MPORT_2.en <= _GEN_1
    MEM_1.io_rdData_MPORT_2.clk <= _GEN_3
    MEM_1.MPORT_1.addr <= _GEN_15
    MEM_1.MPORT_1.en <= _GEN_17
    MEM_1.MPORT_1.clk <= _GEN_16
    MEM_1.MPORT_1.data <= _GEN_19
    MEM_1.MPORT_1.mask <= _GEN_18
    MEM_2.io_rdData_MPORT_1.addr <= _GEN_5
    MEM_2.io_rdData_MPORT_1.en <= _GEN_1
    MEM_2.io_rdData_MPORT_1.clk <= _GEN_3
    MEM_2.MPORT_2.addr <= _GEN_20
    MEM_2.MPORT_2.en <= _GEN_22
    MEM_2.MPORT_2.clk <= _GEN_21
    MEM_2.MPORT_2.data <= _GEN_24
    MEM_2.MPORT_2.mask <= _GEN_23
    MEM_3.io_rdData_MPORT.addr <= _GEN_2
    MEM_3.io_rdData_MPORT.en <= _GEN_1
    MEM_3.io_rdData_MPORT.clk <= _GEN_3
    MEM_3.MPORT_3.addr <= _GEN_25
    MEM_3.MPORT_3.en <= _GEN_27
    MEM_3.MPORT_3.clk <= _GEN_26
    MEM_3.MPORT_3.data <= _GEN_29
    MEM_3.MPORT_3.mask <= _GEN_28

  module InstructionROM :
    input clock : Clock
    input reset : UInt<1>
    input io_address : UInt<32>
    output io_data : UInt<32>
    output io_stall : UInt<1>

    reg addrReg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), addrReg) @[InstructionROM.scala 11:24]
    node _instructions_T = asUInt(asSInt(UInt<32>("h100137"))) @[InstructionROM.scala 13:62]
    node _instructions_T_1 = asUInt(asSInt(UInt<32>("h97"))) @[InstructionROM.scala 13:62]
    node _instructions_T_2 = asUInt(asSInt(UInt<32>("h10080e7"))) @[InstructionROM.scala 13:62]
    node _instructions_T_3 = asUInt(asSInt(UInt<32>("h73"))) @[InstructionROM.scala 13:62]
    node _instructions_T_4 = asUInt(asSInt(UInt<32>("h6f"))) @[InstructionROM.scala 13:62]
    node _instructions_T_5 = asUInt(asSInt(UInt<32>("hf0000537"))) @[InstructionROM.scala 13:62]
    node _instructions_T_6 = asUInt(asSInt(UInt<32>("h4800593"))) @[InstructionROM.scala 13:62]
    node _instructions_T_7 = asUInt(asSInt(UInt<32>("h6500613"))) @[InstructionROM.scala 13:62]
    node _instructions_T_8 = asUInt(asSInt(UInt<32>("h6c00693"))) @[InstructionROM.scala 13:62]
    node _instructions_T_9 = asUInt(asSInt(UInt<32>("hb52223"))) @[InstructionROM.scala 13:62]
    node _instructions_T_10 = asUInt(asSInt(UInt<32>("h6f00593"))) @[InstructionROM.scala 13:62]
    node _instructions_T_11 = asUInt(asSInt(UInt<32>("hc52223"))) @[InstructionROM.scala 13:62]
    node _instructions_T_12 = asUInt(asSInt(UInt<32>("h2000613"))) @[InstructionROM.scala 13:62]
    node _instructions_T_13 = asUInt(asSInt(UInt<32>("hd52223"))) @[InstructionROM.scala 13:62]
    node _instructions_T_14 = asUInt(asSInt(UInt<32>("hd52223"))) @[InstructionROM.scala 13:62]
    node _instructions_T_15 = asUInt(asSInt(UInt<32>("hb52223"))) @[InstructionROM.scala 13:62]
    node _instructions_T_16 = asUInt(asSInt(UInt<32>("hc52223"))) @[InstructionROM.scala 13:62]
    node _instructions_T_17 = asUInt(asSInt(UInt<32>("h5700613"))) @[InstructionROM.scala 13:62]
    node _instructions_T_18 = asUInt(asSInt(UInt<32>("hc52223"))) @[InstructionROM.scala 13:62]
    node _instructions_T_19 = asUInt(asSInt(UInt<32>("h7200613"))) @[InstructionROM.scala 13:62]
    node _instructions_T_20 = asUInt(asSInt(UInt<32>("hb52223"))) @[InstructionROM.scala 13:62]
    node _instructions_T_21 = asUInt(asSInt(UInt<32>("h6400593"))) @[InstructionROM.scala 13:62]
    node _instructions_T_22 = asUInt(asSInt(UInt<32>("hc52223"))) @[InstructionROM.scala 13:62]
    node _instructions_T_23 = asUInt(asSInt(UInt<32>("h2100613"))) @[InstructionROM.scala 13:62]
    node _instructions_T_24 = asUInt(asSInt(UInt<32>("hd52223"))) @[InstructionROM.scala 13:62]
    node _instructions_T_25 = asUInt(asSInt(UInt<32>("hb52223"))) @[InstructionROM.scala 13:62]
    node _instructions_T_26 = asUInt(asSInt(UInt<32>("hc52223"))) @[InstructionROM.scala 13:62]
    node _instructions_T_27 = asUInt(asSInt(UInt<32>("h513"))) @[InstructionROM.scala 13:62]
    node _instructions_T_28 = asUInt(asSInt(UInt<32>("h8067"))) @[InstructionROM.scala 13:62]
    node _io_data_T = bits(addrReg, 31, 2) @[InstructionROM.scala 14:34]
    node _io_data_T_1 = bits(_io_data_T, 4, 0)
    node instructions_0 = _instructions_T @[InstructionROM.scala 13:{29,29}]
    node _GEN_0 = validif(eq(UInt<1>("h0"), _io_data_T_1), instructions_0) @[InstructionROM.scala 14:{11,11}]
    node instructions_1 = _instructions_T_1 @[InstructionROM.scala 13:{29,29}]
    node _GEN_1 = mux(eq(UInt<1>("h1"), _io_data_T_1), instructions_1, _GEN_0) @[InstructionROM.scala 14:{11,11}]
    node instructions_2 = _instructions_T_2 @[InstructionROM.scala 13:{29,29}]
    node _GEN_2 = mux(eq(UInt<2>("h2"), _io_data_T_1), instructions_2, _GEN_1) @[InstructionROM.scala 14:{11,11}]
    node instructions_3 = _instructions_T_3 @[InstructionROM.scala 13:{29,29}]
    node _GEN_3 = mux(eq(UInt<2>("h3"), _io_data_T_1), instructions_3, _GEN_2) @[InstructionROM.scala 14:{11,11}]
    node instructions_4 = _instructions_T_4 @[InstructionROM.scala 13:{29,29}]
    node _GEN_4 = mux(eq(UInt<3>("h4"), _io_data_T_1), instructions_4, _GEN_3) @[InstructionROM.scala 14:{11,11}]
    node instructions_5 = _instructions_T_5 @[InstructionROM.scala 13:{29,29}]
    node _GEN_5 = mux(eq(UInt<3>("h5"), _io_data_T_1), instructions_5, _GEN_4) @[InstructionROM.scala 14:{11,11}]
    node instructions_6 = _instructions_T_6 @[InstructionROM.scala 13:{29,29}]
    node _GEN_6 = mux(eq(UInt<3>("h6"), _io_data_T_1), instructions_6, _GEN_5) @[InstructionROM.scala 14:{11,11}]
    node instructions_7 = _instructions_T_7 @[InstructionROM.scala 13:{29,29}]
    node _GEN_7 = mux(eq(UInt<3>("h7"), _io_data_T_1), instructions_7, _GEN_6) @[InstructionROM.scala 14:{11,11}]
    node instructions_8 = _instructions_T_8 @[InstructionROM.scala 13:{29,29}]
    node _GEN_8 = mux(eq(UInt<4>("h8"), _io_data_T_1), instructions_8, _GEN_7) @[InstructionROM.scala 14:{11,11}]
    node instructions_9 = _instructions_T_9 @[InstructionROM.scala 13:{29,29}]
    node _GEN_9 = mux(eq(UInt<4>("h9"), _io_data_T_1), instructions_9, _GEN_8) @[InstructionROM.scala 14:{11,11}]
    node instructions_10 = _instructions_T_10 @[InstructionROM.scala 13:{29,29}]
    node _GEN_10 = mux(eq(UInt<4>("ha"), _io_data_T_1), instructions_10, _GEN_9) @[InstructionROM.scala 14:{11,11}]
    node instructions_11 = _instructions_T_11 @[InstructionROM.scala 13:{29,29}]
    node _GEN_11 = mux(eq(UInt<4>("hb"), _io_data_T_1), instructions_11, _GEN_10) @[InstructionROM.scala 14:{11,11}]
    node instructions_12 = _instructions_T_12 @[InstructionROM.scala 13:{29,29}]
    node _GEN_12 = mux(eq(UInt<4>("hc"), _io_data_T_1), instructions_12, _GEN_11) @[InstructionROM.scala 14:{11,11}]
    node instructions_13 = _instructions_T_13 @[InstructionROM.scala 13:{29,29}]
    node _GEN_13 = mux(eq(UInt<4>("hd"), _io_data_T_1), instructions_13, _GEN_12) @[InstructionROM.scala 14:{11,11}]
    node instructions_14 = _instructions_T_14 @[InstructionROM.scala 13:{29,29}]
    node _GEN_14 = mux(eq(UInt<4>("he"), _io_data_T_1), instructions_14, _GEN_13) @[InstructionROM.scala 14:{11,11}]
    node instructions_15 = _instructions_T_15 @[InstructionROM.scala 13:{29,29}]
    node _GEN_15 = mux(eq(UInt<4>("hf"), _io_data_T_1), instructions_15, _GEN_14) @[InstructionROM.scala 14:{11,11}]
    node instructions_16 = _instructions_T_16 @[InstructionROM.scala 13:{29,29}]
    node _GEN_16 = mux(eq(UInt<5>("h10"), _io_data_T_1), instructions_16, _GEN_15) @[InstructionROM.scala 14:{11,11}]
    node instructions_17 = _instructions_T_17 @[InstructionROM.scala 13:{29,29}]
    node _GEN_17 = mux(eq(UInt<5>("h11"), _io_data_T_1), instructions_17, _GEN_16) @[InstructionROM.scala 14:{11,11}]
    node instructions_18 = _instructions_T_18 @[InstructionROM.scala 13:{29,29}]
    node _GEN_18 = mux(eq(UInt<5>("h12"), _io_data_T_1), instructions_18, _GEN_17) @[InstructionROM.scala 14:{11,11}]
    node instructions_19 = _instructions_T_19 @[InstructionROM.scala 13:{29,29}]
    node _GEN_19 = mux(eq(UInt<5>("h13"), _io_data_T_1), instructions_19, _GEN_18) @[InstructionROM.scala 14:{11,11}]
    node instructions_20 = _instructions_T_20 @[InstructionROM.scala 13:{29,29}]
    node _GEN_20 = mux(eq(UInt<5>("h14"), _io_data_T_1), instructions_20, _GEN_19) @[InstructionROM.scala 14:{11,11}]
    node instructions_21 = _instructions_T_21 @[InstructionROM.scala 13:{29,29}]
    node _GEN_21 = mux(eq(UInt<5>("h15"), _io_data_T_1), instructions_21, _GEN_20) @[InstructionROM.scala 14:{11,11}]
    node instructions_22 = _instructions_T_22 @[InstructionROM.scala 13:{29,29}]
    node _GEN_22 = mux(eq(UInt<5>("h16"), _io_data_T_1), instructions_22, _GEN_21) @[InstructionROM.scala 14:{11,11}]
    node instructions_23 = _instructions_T_23 @[InstructionROM.scala 13:{29,29}]
    node _GEN_23 = mux(eq(UInt<5>("h17"), _io_data_T_1), instructions_23, _GEN_22) @[InstructionROM.scala 14:{11,11}]
    node instructions_24 = _instructions_T_24 @[InstructionROM.scala 13:{29,29}]
    node _GEN_24 = mux(eq(UInt<5>("h18"), _io_data_T_1), instructions_24, _GEN_23) @[InstructionROM.scala 14:{11,11}]
    node instructions_25 = _instructions_T_25 @[InstructionROM.scala 13:{29,29}]
    node _GEN_25 = mux(eq(UInt<5>("h19"), _io_data_T_1), instructions_25, _GEN_24) @[InstructionROM.scala 14:{11,11}]
    node instructions_26 = _instructions_T_26 @[InstructionROM.scala 13:{29,29}]
    node _GEN_26 = mux(eq(UInt<5>("h1a"), _io_data_T_1), instructions_26, _GEN_25) @[InstructionROM.scala 14:{11,11}]
    node instructions_27 = _instructions_T_27 @[InstructionROM.scala 13:{29,29}]
    node _GEN_27 = mux(eq(UInt<5>("h1b"), _io_data_T_1), instructions_27, _GEN_26) @[InstructionROM.scala 14:{11,11}]
    node instructions_28 = _instructions_T_28 @[InstructionROM.scala 13:{29,29}]
    node _GEN_28 = mux(eq(UInt<5>("h1c"), _io_data_T_1), instructions_28, _GEN_27) @[InstructionROM.scala 14:{11,11}]
    reg toggle : UInt<1>, clock with :
      reset => (UInt<1>("h0"), toggle) @[InstructionROM.scala 16:23]
    node _toggle_T = eq(toggle, UInt<1>("h0")) @[InstructionROM.scala 17:13]
    node _instructions_io_data_T_1 = _GEN_28 @[InstructionROM.scala 14:11]
    io_data <= _instructions_io_data_T_1 @[InstructionROM.scala 14:11]
    io_stall <= UInt<1>("h0") @[InstructionROM.scala 18:12]
    addrReg <= mux(reset, UInt<32>("h0"), io_address) @[InstructionROM.scala 11:{24,24} 12:11]
    toggle <= mux(reset, UInt<1>("h0"), _toggle_T) @[InstructionROM.scala 16:{23,23} 17:10]

  module Tx :
    input clock : Clock
    input reset : UInt<1>
    output io_txd : UInt<1>
    output io_channel_ready : UInt<1>
    input io_channel_valid : UInt<1>
    input io_channel_bits : UInt<8>

    reg shiftReg : UInt<11>, clock with :
      reset => (UInt<1>("h0"), shiftReg) @[Uart.scala 30:25]
    reg cntReg : UInt<20>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[Uart.scala 31:23]
    reg bitsReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), bitsReg) @[Uart.scala 32:24]
    node _io_channel_ready_T = eq(cntReg, UInt<1>("h0")) @[Uart.scala 34:31]
    node _io_channel_ready_T_1 = eq(bitsReg, UInt<1>("h0")) @[Uart.scala 34:52]
    node _io_channel_ready_T_2 = and(_io_channel_ready_T, _io_channel_ready_T_1) @[Uart.scala 34:40]
    node _io_txd_T = bits(shiftReg, 0, 0) @[Uart.scala 35:21]
    node _T = eq(cntReg, UInt<1>("h0")) @[Uart.scala 37:15]
    node _T_1 = neq(bitsReg, UInt<1>("h0")) @[Uart.scala 40:18]
    node shift = shr(shiftReg, 1) @[Uart.scala 41:28]
    node _shiftReg_T = bits(shift, 9, 0) @[Uart.scala 42:33]
    node _shiftReg_T_1 = cat(UInt<1>("h1"), _shiftReg_T) @[Cat.scala 33:92]
    node _bitsReg_T = sub(bitsReg, UInt<1>("h1")) @[Uart.scala 43:26]
    node _bitsReg_T_1 = tail(_bitsReg_T, 1) @[Uart.scala 43:26]
    node _shiftReg_T_2 = cat(UInt<2>("h3"), io_channel_bits) @[Cat.scala 33:92]
    node _shiftReg_T_3 = cat(_shiftReg_T_2, UInt<1>("h0")) @[Cat.scala 33:92]
    node _GEN_0 = mux(io_channel_valid, _shiftReg_T_3, UInt<11>("h7ff")) @[Uart.scala 45:30 46:18 49:18]
    node _GEN_1 = mux(io_channel_valid, UInt<4>("hb"), bitsReg) @[Uart.scala 45:30 47:17 32:24]
    node _GEN_2 = mux(_T_1, _shiftReg_T_1, _GEN_0) @[Uart.scala 40:27 42:16]
    node _GEN_3 = mux(_T_1, _bitsReg_T_1, _GEN_1) @[Uart.scala 40:27 43:15]
    node _cntReg_T = sub(cntReg, UInt<1>("h1")) @[Uart.scala 54:22]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[Uart.scala 54:22]
    node _GEN_4 = mux(_T, UInt<10>("h363"), _cntReg_T_1) @[Uart.scala 37:24 39:12 54:12]
    node _GEN_5 = mux(_T, _GEN_2, shiftReg) @[Uart.scala 37:24 30:25]
    node _GEN_6 = mux(_T, _GEN_3, bitsReg) @[Uart.scala 32:24 37:24]
    io_txd <= _io_txd_T @[Uart.scala 35:10]
    io_channel_ready <= _io_channel_ready_T_2 @[Uart.scala 34:20]
    shiftReg <= mux(reset, UInt<11>("h7ff"), _GEN_5) @[Uart.scala 30:{25,25}]
    cntReg <= mux(reset, UInt<20>("h0"), _GEN_4) @[Uart.scala 31:{23,23}]
    bitsReg <= mux(reset, UInt<4>("h0"), _GEN_6) @[Uart.scala 32:{24,24}]

  module Buffer :
    input clock : Clock
    input reset : UInt<1>
    output io_in_ready : UInt<1>
    input io_in_valid : UInt<1>
    input io_in_bits : UInt<8>
    input io_out_ready : UInt<1>
    output io_out_valid : UInt<1>
    output io_out_bits : UInt<8>

    reg stateReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[Uart.scala 117:25]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[Uart.scala 118:24]
    node _io_in_ready_T = eq(stateReg, UInt<1>("h0")) @[Uart.scala 120:27]
    node _io_out_valid_T = eq(stateReg, UInt<1>("h1")) @[Uart.scala 121:28]
    node _T = eq(stateReg, UInt<1>("h0")) @[Uart.scala 123:17]
    node _GEN_0 = mux(io_in_valid, io_in_bits, dataReg) @[Uart.scala 124:23 125:15 118:24]
    node _GEN_1 = mux(io_in_valid, UInt<1>("h1"), stateReg) @[Uart.scala 124:23 126:16 117:25]
    node _GEN_2 = mux(io_out_ready, UInt<1>("h0"), stateReg) @[Uart.scala 129:24 130:16 117:25]
    node _GEN_3 = mux(_T, _GEN_0, dataReg) @[Uart.scala 118:24 123:28]
    node _GEN_4 = mux(_T, _GEN_1, _GEN_2) @[Uart.scala 123:28]
    io_in_ready <= _io_in_ready_T @[Uart.scala 120:15]
    io_out_valid <= _io_out_valid_T @[Uart.scala 121:16]
    io_out_bits <= dataReg @[Uart.scala 133:15]
    stateReg <= mux(reset, UInt<1>("h0"), _GEN_4) @[Uart.scala 117:{25,25}]
    dataReg <= mux(reset, UInt<8>("h0"), _GEN_3) @[Uart.scala 118:{24,24}]

  module BufferedTx :
    input clock : Clock
    input reset : UInt<1>
    output io_txd : UInt<1>
    output io_channel_ready : UInt<1>
    input io_channel_valid : UInt<1>
    input io_channel_bits : UInt<8>

    inst tx of Tx @[Uart.scala 144:18]
    inst buf of Buffer @[Uart.scala 145:19]
    io_txd <= tx.io_txd @[Uart.scala 149:10]
    io_channel_ready <= buf.io_in_ready @[Uart.scala 147:13]
    tx.clock <= clock
    tx.reset <= reset
    tx.io_channel_valid <= buf.io_out_valid @[Uart.scala 148:17]
    tx.io_channel_bits <= buf.io_out_bits @[Uart.scala 148:17]
    buf.clock <= clock
    buf.reset <= reset
    buf.io_in_valid <= io_channel_valid @[Uart.scala 147:13]
    buf.io_in_bits <= io_channel_bits @[Uart.scala 147:13]
    buf.io_out_ready <= tx.io_channel_ready @[Uart.scala 148:17]

  module Rx :
    input clock : Clock
    input reset : UInt<1>
    input io_rxd : UInt<1>
    input io_channel_ready : UInt<1>
    output io_channel_valid : UInt<1>
    output io_channel_bits : UInt<8>

    reg rxReg_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), rxReg_REG) @[Uart.scala 76:30]
    reg rxReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), rxReg) @[Uart.scala 76:22]
    node _falling_T = eq(rxReg, UInt<1>("h0")) @[Uart.scala 77:17]
    reg falling_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), falling_REG) @[Uart.scala 77:35]
    node _falling_T_1 = eq(falling_REG, UInt<1>("h1")) @[Uart.scala 77:43]
    node falling = and(_falling_T, _falling_T_1) @[Uart.scala 77:24]
    reg shiftReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), shiftReg) @[Uart.scala 79:25]
    reg cntReg : UInt<20>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[Uart.scala 80:23]
    reg bitsReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), bitsReg) @[Uart.scala 81:24]
    reg valReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), valReg) @[Uart.scala 82:23]
    node _T = neq(cntReg, UInt<1>("h0")) @[Uart.scala 84:15]
    node _cntReg_T = sub(cntReg, UInt<1>("h1")) @[Uart.scala 85:22]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[Uart.scala 85:22]
    node _T_1 = neq(bitsReg, UInt<1>("h0")) @[Uart.scala 86:22]
    node _shiftReg_T = shr(shiftReg, 1) @[Uart.scala 88:37]
    node _shiftReg_T_1 = cat(rxReg, _shiftReg_T) @[Cat.scala 33:92]
    node _bitsReg_T = sub(bitsReg, UInt<1>("h1")) @[Uart.scala 89:24]
    node _bitsReg_T_1 = tail(_bitsReg_T, 1) @[Uart.scala 89:24]
    node _T_2 = eq(bitsReg, UInt<1>("h1")) @[Uart.scala 91:18]
    node _GEN_0 = mux(_T_2, UInt<1>("h1"), valReg) @[Uart.scala 91:27 92:14 82:23]
    node _GEN_1 = mux(falling, UInt<11>("h514"), cntReg) @[Uart.scala 94:23 95:12 80:23]
    node _GEN_2 = mux(falling, UInt<4>("h8"), bitsReg) @[Uart.scala 94:23 96:13 81:24]
    node _GEN_3 = mux(_T_1, UInt<10>("h363"), _GEN_1) @[Uart.scala 86:31 87:12]
    node _GEN_4 = mux(_T_1, _shiftReg_T_1, shiftReg) @[Uart.scala 86:31 88:14 79:25]
    node _GEN_5 = mux(_T_1, _bitsReg_T_1, _GEN_2) @[Uart.scala 86:31 89:13]
    node _GEN_6 = mux(_T_1, _GEN_0, valReg) @[Uart.scala 82:23 86:31]
    node _GEN_7 = mux(_T, _cntReg_T_1, _GEN_3) @[Uart.scala 84:24 85:12]
    node _GEN_8 = mux(_T, shiftReg, _GEN_4) @[Uart.scala 84:24 79:25]
    node _GEN_9 = mux(_T, bitsReg, _GEN_5) @[Uart.scala 81:24 84:24]
    node _GEN_10 = mux(_T, valReg, _GEN_6) @[Uart.scala 82:23 84:24]
    node _T_3 = and(valReg, io_channel_ready) @[Uart.scala 99:15]
    node _GEN_11 = mux(_T_3, UInt<1>("h0"), _GEN_10) @[Uart.scala 100:12 99:36]
    io_channel_valid <= valReg @[Uart.scala 104:20]
    io_channel_bits <= shiftReg @[Uart.scala 103:19]
    rxReg_REG <= mux(reset, UInt<1>("h0"), io_rxd) @[Uart.scala 76:{30,30,30}]
    rxReg <= mux(reset, UInt<1>("h0"), rxReg_REG) @[Uart.scala 76:{22,22,22}]
    falling_REG <= rxReg @[Uart.scala 77:35]
    shiftReg <= mux(reset, UInt<8>("h0"), _GEN_8) @[Uart.scala 79:{25,25}]
    cntReg <= mux(reset, UInt<20>("h363"), _GEN_7) @[Uart.scala 80:{23,23}]
    bitsReg <= mux(reset, UInt<4>("h0"), _GEN_9) @[Uart.scala 81:{24,24}]
    valReg <= mux(reset, UInt<1>("h0"), _GEN_11) @[Uart.scala 82:{23,23}]

  module WildcatTop :
    input clock : Clock
    input reset : UInt<1>
    output io_led : UInt<16>
    output io_tx : UInt<1>
    input io_rx : UInt<1>
    output ledReg_0 : UInt<8>
    output doBranch : UInt<1>
    output decExReg_decOut_isECall : UInt<1>
    output instrReg : UInt<32>
    output instr : UInt<32>
    output decExReg_pc : UInt<32>
    output cyclesReg : UInt<32>
    output pcReg : UInt<32>
    output pcRegReg : UInt<32>
    output debugRegs_0 : UInt<32>
    output debugRegs_1 : UInt<32>
    output debugRegs_2 : UInt<32>
    output debugRegs_3 : UInt<32>
    output debugRegs_4 : UInt<32>
    output debugRegs_5 : UInt<32>
    output debugRegs_6 : UInt<32>
    output debugRegs_7 : UInt<32>
    output debugRegs_8 : UInt<32>
    output debugRegs_9 : UInt<32>
    output debugRegs_10 : UInt<32>
    output debugRegs_11 : UInt<32>
    output debugRegs_12 : UInt<32>
    output debugRegs_13 : UInt<32>
    output debugRegs_14 : UInt<32>
    output debugRegs_15 : UInt<32>
    output debugRegs_16 : UInt<32>
    output debugRegs_17 : UInt<32>
    output debugRegs_18 : UInt<32>
    output debugRegs_19 : UInt<32>
    output debugRegs_20 : UInt<32>
    output debugRegs_21 : UInt<32>
    output debugRegs_22 : UInt<32>
    output debugRegs_23 : UInt<32>
    output debugRegs_24 : UInt<32>
    output debugRegs_25 : UInt<32>
    output debugRegs_26 : UInt<32>
    output debugRegs_27 : UInt<32>
    output debugRegs_28 : UInt<32>
    output debugRegs_29 : UInt<32>
    output debugRegs_30 : UInt<32>
    output debugRegs_31 : UInt<32>

    inst cpu of ThreeCats @[WildcatTop.scala 27:19]
    inst dmem of ScratchPadMem @[WildcatTop.scala 30:20]
    inst imem of InstructionROM @[WildcatTop.scala 32:20]
    inst tx of BufferedTx @[WildcatTop.scala 49:18]
    inst rx of Rx @[WildcatTop.scala 50:18]
    node _tx_io_channel_bits_T = bits(cpu.io_dmem_wrData, 7, 0) @[WildcatTop.scala 54:43]
    node _uartStatusReg_T = cat(rx.io_channel_valid, tx.io_channel_ready) @[WildcatTop.scala 58:51]
    reg uartStatusReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), uartStatusReg) @[WildcatTop.scala 58:30]
    reg memAddressReg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), memAddressReg) @[WildcatTop.scala 59:30]
    node _T = bits(memAddressReg, 31, 28) @[WildcatTop.scala 60:22]
    node _T_1 = eq(_T, UInt<4>("hf")) @[WildcatTop.scala 60:31]
    node _T_2 = bits(memAddressReg, 19, 16) @[WildcatTop.scala 60:57]
    node _T_3 = eq(_T_2, UInt<1>("h0")) @[WildcatTop.scala 60:65]
    node _T_4 = and(_T_1, _T_3) @[WildcatTop.scala 60:41]
    node _T_5 = bits(memAddressReg, 3, 0) @[WildcatTop.scala 61:24]
    node _T_6 = eq(_T_5, UInt<1>("h0")) @[WildcatTop.scala 61:31]
    node _T_7 = bits(memAddressReg, 3, 0) @[WildcatTop.scala 63:30]
    node _T_8 = eq(_T_7, UInt<3>("h4")) @[WildcatTop.scala 63:37]
    node _GEN_0 = mux(_T_8, rx.io_channel_bits, dmem.io_rdData) @[WildcatTop.scala 31:15 63:46 64:26]
    node _GEN_1 = mux(_T_8, cpu.io_dmem_rdEnable, UInt<1>("h0")) @[WildcatTop.scala 56:23 63:46 65:27]
    node _GEN_2 = mux(_T_6, uartStatusReg, _GEN_0) @[WildcatTop.scala 61:40 62:26]
    node _GEN_3 = mux(_T_6, UInt<1>("h0"), _GEN_1) @[WildcatTop.scala 56:23 61:40]
    node _GEN_4 = mux(_T_4, _GEN_2, dmem.io_rdData) @[WildcatTop.scala 31:15 60:74]
    node _GEN_5 = mux(_T_4, _GEN_3, UInt<1>("h0")) @[WildcatTop.scala 56:23 60:74]
    reg ledReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), ledReg) @[WildcatTop.scala 69:23]
    node _T_9 = bits(cpu.io_dmem_wrAddress, 31, 28) @[WildcatTop.scala 70:31]
    node _T_10 = eq(_T_9, UInt<4>("hf")) @[WildcatTop.scala 70:40]
    node _T_11 = and(_T_10, cpu.io_dmem_wrEnable_0) @[WildcatTop.scala 70:51]
    node _T_12 = bits(cpu.io_dmem_wrAddress, 19, 16) @[WildcatTop.scala 71:32]
    node _T_13 = eq(_T_12, UInt<1>("h0")) @[WildcatTop.scala 71:40]
    node _T_14 = bits(cpu.io_dmem_wrAddress, 3, 0) @[WildcatTop.scala 71:72]
    node _T_15 = eq(_T_14, UInt<3>("h4")) @[WildcatTop.scala 71:79]
    node _T_16 = and(_T_13, _T_15) @[WildcatTop.scala 71:48]
    node _T_17 = bits(cpu.io_dmem_wrData, 7, 0) @[WildcatTop.scala 72:44]
    node _T_18 = bits(cpu.io_dmem_wrData, 7, 0) @[WildcatTop.scala 72:70]
    node _T_19 = asUInt(reset) @[WildcatTop.scala 72:13]
    node _T_20 = eq(_T_19, UInt<1>("h0")) @[WildcatTop.scala 72:13]
    node _T_21 = bits(cpu.io_dmem_wrAddress, 19, 16) @[WildcatTop.scala 74:39]
    node _T_22 = eq(_T_21, UInt<1>("h1")) @[WildcatTop.scala 74:47]
    node _ledReg_T = bits(cpu.io_dmem_wrData, 7, 0) @[WildcatTop.scala 75:35]
    node _GEN_6 = mux(_T_22, _ledReg_T, ledReg) @[WildcatTop.scala 74:56 75:14 69:23]
    node _GEN_7 = mux(_T_16, UInt<1>("h1"), UInt<1>("h0")) @[WildcatTop.scala 55:23 71:88 73:27]
    node _GEN_8 = mux(_T_16, ledReg, _GEN_6) @[WildcatTop.scala 69:23 71:88]
    node _GEN_9 = mux(_T_11, _GEN_7, UInt<1>("h0")) @[WildcatTop.scala 55:23 70:79]
    node _GEN_10 = mux(_T_11, _GEN_8, ledReg) @[WildcatTop.scala 69:23 70:79]
    node _WIRE_0 = UInt<1>("h0") @[WildcatTop.scala 77:{32,32}]
    node _GEN_11 = mux(_T_11, _WIRE_0, cpu.io_dmem_wrEnable_0) @[WildcatTop.scala 31:15 70:79 77:22]
    node _WIRE_1 = UInt<1>("h0") @[WildcatTop.scala 77:{32,32}]
    node _GEN_12 = mux(_T_11, _WIRE_1, cpu.io_dmem_wrEnable_1) @[WildcatTop.scala 31:15 70:79 77:22]
    node _WIRE_2 = UInt<1>("h0") @[WildcatTop.scala 77:{32,32}]
    node _GEN_13 = mux(_T_11, _WIRE_2, cpu.io_dmem_wrEnable_2) @[WildcatTop.scala 31:15 70:79 77:22]
    node _WIRE_3 = UInt<1>("h0") @[WildcatTop.scala 77:{32,32}]
    node _GEN_14 = mux(_T_11, _WIRE_3, cpu.io_dmem_wrEnable_3) @[WildcatTop.scala 31:15 70:79 77:22]
    node _io_led_T = cat(UInt<1>("h1"), UInt<7>("h0")) @[WildcatTop.scala 80:17]
    reg io_led_REG : UInt<8>, clock with :
      reset => (UInt<1>("h0"), io_led_REG) @[WildcatTop.scala 80:39]
    node _io_led_T_1 = cat(_io_led_T, io_led_REG) @[WildcatTop.scala 80:29]
    io_led <= _io_led_T_1 @[WildcatTop.scala 80:10]
    io_tx <= tx.io_txd @[WildcatTop.scala 51:9]
    ledReg_0 <= ledReg
    doBranch <= cpu.doBranch_0
    decExReg_decOut_isECall <= cpu.decExReg_decOut_isECall
    instrReg <= cpu.instrReg_0
    instr <= cpu.instr_0
    decExReg_pc <= cpu.decExReg_pc
    cyclesReg <= cpu.cyclesReg_0
    pcReg <= cpu.pcReg_0
    pcRegReg <= cpu.pcRegReg_0
    debugRegs_0 <= cpu.debugRegs_0_0
    debugRegs_1 <= cpu.debugRegs_0_1
    debugRegs_2 <= cpu.debugRegs_0_2
    debugRegs_3 <= cpu.debugRegs_0_3
    debugRegs_4 <= cpu.debugRegs_0_4
    debugRegs_5 <= cpu.debugRegs_0_5
    debugRegs_6 <= cpu.debugRegs_0_6
    debugRegs_7 <= cpu.debugRegs_0_7
    debugRegs_8 <= cpu.debugRegs_0_8
    debugRegs_9 <= cpu.debugRegs_0_9
    debugRegs_10 <= cpu.debugRegs_0_10
    debugRegs_11 <= cpu.debugRegs_0_11
    debugRegs_12 <= cpu.debugRegs_0_12
    debugRegs_13 <= cpu.debugRegs_0_13
    debugRegs_14 <= cpu.debugRegs_0_14
    debugRegs_15 <= cpu.debugRegs_0_15
    debugRegs_16 <= cpu.debugRegs_0_16
    debugRegs_17 <= cpu.debugRegs_0_17
    debugRegs_18 <= cpu.debugRegs_0_18
    debugRegs_19 <= cpu.debugRegs_0_19
    debugRegs_20 <= cpu.debugRegs_0_20
    debugRegs_21 <= cpu.debugRegs_0_21
    debugRegs_22 <= cpu.debugRegs_0_22
    debugRegs_23 <= cpu.debugRegs_0_23
    debugRegs_24 <= cpu.debugRegs_0_24
    debugRegs_25 <= cpu.debugRegs_0_25
    debugRegs_26 <= cpu.debugRegs_0_26
    debugRegs_27 <= cpu.debugRegs_0_27
    debugRegs_28 <= cpu.debugRegs_0_28
    debugRegs_29 <= cpu.debugRegs_0_29
    debugRegs_30 <= cpu.debugRegs_0_30
    debugRegs_31 <= cpu.debugRegs_0_31
    cpu.clock <= clock
    cpu.reset <= reset
    cpu.io_imem_data <= imem.io_data @[WildcatTop.scala 34:20]
    cpu.io_imem_stall <= imem.io_stall @[WildcatTop.scala 35:21]
    cpu.io_dmem_rdData <= _GEN_4
    cpu.io_dmem_stall <= dmem.io_stall @[WildcatTop.scala 31:15]
    dmem.clock <= clock
    dmem.reset <= reset
    dmem.io_rdAddress <= cpu.io_dmem_rdAddress @[WildcatTop.scala 31:15]
    dmem.io_rdEnable <= cpu.io_dmem_rdEnable @[WildcatTop.scala 31:15]
    dmem.io_wrAddress <= cpu.io_dmem_wrAddress @[WildcatTop.scala 31:15]
    dmem.io_wrData <= cpu.io_dmem_wrData @[WildcatTop.scala 31:15]
    dmem.io_wrEnable_0 <= _GEN_11
    dmem.io_wrEnable_1 <= _GEN_12
    dmem.io_wrEnable_2 <= _GEN_13
    dmem.io_wrEnable_3 <= _GEN_14
    imem.clock <= clock
    imem.reset <= reset
    imem.io_address <= cpu.io_imem_address @[WildcatTop.scala 33:19]
    tx.clock <= clock
    tx.reset <= reset
    tx.io_channel_valid <= _GEN_9
    tx.io_channel_bits <= _tx_io_channel_bits_T @[WildcatTop.scala 54:22]
    rx.clock <= clock
    rx.reset <= reset
    rx.io_rxd <= io_rx @[WildcatTop.scala 52:13]
    rx.io_channel_ready <= _GEN_5
    uartStatusReg <= _uartStatusReg_T @[WildcatTop.scala 58:30]
    memAddressReg <= cpu.io_dmem_rdAddress @[WildcatTop.scala 59:30]
    ledReg <= mux(reset, UInt<8>("h0"), _GEN_10) @[WildcatTop.scala 69:{23,23}]
    io_led_REG <= ledReg @[WildcatTop.scala 80:39]
    printf(clock, and(and(and(and(UInt<1>("h1"), _T_11), _T_16), _T_20), UInt<1>("h1")), " %c %d\n", _T_17, _T_18) : printf @[WildcatTop.scala 72:13]

  module WildcatTestTop :
    input clock : Clock
    input reset : UInt<1>
    output io_regFile_0 : UInt<32>
    output io_regFile_1 : UInt<32>
    output io_regFile_2 : UInt<32>
    output io_regFile_3 : UInt<32>
    output io_regFile_4 : UInt<32>
    output io_regFile_5 : UInt<32>
    output io_regFile_6 : UInt<32>
    output io_regFile_7 : UInt<32>
    output io_regFile_8 : UInt<32>
    output io_regFile_9 : UInt<32>
    output io_regFile_10 : UInt<32>
    output io_regFile_11 : UInt<32>
    output io_regFile_12 : UInt<32>
    output io_regFile_13 : UInt<32>
    output io_regFile_14 : UInt<32>
    output io_regFile_15 : UInt<32>
    output io_regFile_16 : UInt<32>
    output io_regFile_17 : UInt<32>
    output io_regFile_18 : UInt<32>
    output io_regFile_19 : UInt<32>
    output io_regFile_20 : UInt<32>
    output io_regFile_21 : UInt<32>
    output io_regFile_22 : UInt<32>
    output io_regFile_23 : UInt<32>
    output io_regFile_24 : UInt<32>
    output io_regFile_25 : UInt<32>
    output io_regFile_26 : UInt<32>
    output io_regFile_27 : UInt<32>
    output io_regFile_28 : UInt<32>
    output io_regFile_29 : UInt<32>
    output io_regFile_30 : UInt<32>
    output io_regFile_31 : UInt<32>
    output io_led : UInt<8>
    output io_tx : UInt<1>
    input io_rx : UInt<1>
    output io_stop : UInt<1>
    output io_cycles : UInt<32>
    output io_pc : UInt<32>
    output io_pcRegReg : UInt<32>
    output io_decExReg : UInt<32>
    output io_doBranch : UInt<1>
    output io_instr : UInt<32>
    output io_instrReg : UInt<32>

    inst cpuTop of WildcatTop @[WildcatTestTop.scala 29:22]
    node debugRegs_0 = cpuTop.debugRegs_0
    node debugRegs_1 = cpuTop.debugRegs_1
    node debugRegs_2 = cpuTop.debugRegs_2
    node debugRegs_3 = cpuTop.debugRegs_3
    node debugRegs_4 = cpuTop.debugRegs_4
    node debugRegs_5 = cpuTop.debugRegs_5
    node debugRegs_6 = cpuTop.debugRegs_6
    node debugRegs_7 = cpuTop.debugRegs_7
    node debugRegs_8 = cpuTop.debugRegs_8
    node debugRegs_9 = cpuTop.debugRegs_9
    node debugRegs_10 = cpuTop.debugRegs_10
    node debugRegs_11 = cpuTop.debugRegs_11
    node debugRegs_12 = cpuTop.debugRegs_12
    node debugRegs_13 = cpuTop.debugRegs_13
    node debugRegs_14 = cpuTop.debugRegs_14
    node debugRegs_15 = cpuTop.debugRegs_15
    node debugRegs_16 = cpuTop.debugRegs_16
    node debugRegs_17 = cpuTop.debugRegs_17
    node debugRegs_18 = cpuTop.debugRegs_18
    node debugRegs_19 = cpuTop.debugRegs_19
    node debugRegs_20 = cpuTop.debugRegs_20
    node debugRegs_21 = cpuTop.debugRegs_21
    node debugRegs_22 = cpuTop.debugRegs_22
    node debugRegs_23 = cpuTop.debugRegs_23
    node debugRegs_24 = cpuTop.debugRegs_24
    node debugRegs_25 = cpuTop.debugRegs_25
    node debugRegs_26 = cpuTop.debugRegs_26
    node debugRegs_27 = cpuTop.debugRegs_27
    node debugRegs_28 = cpuTop.debugRegs_28
    node debugRegs_29 = cpuTop.debugRegs_29
    node debugRegs_30 = cpuTop.debugRegs_30
    node debugRegs_31 = cpuTop.debugRegs_31
    node pcRegReg = cpuTop.pcRegReg
    node pcReg = cpuTop.pcReg
    node cyclesReg = cpuTop.cyclesReg
    node decExRegpc = cpuTop.decExReg_pc
    node instr = cpuTop.instr
    node instrReg = cpuTop.instrReg
    node decExRegdecOutisECall = cpuTop.decExReg_decOut_isECall
    node doBranch = cpuTop.doBranch
    node ledReg = cpuTop.ledReg_0
    io_regFile_0 <= debugRegs_0
    io_regFile_1 <= debugRegs_1
    io_regFile_2 <= debugRegs_2
    io_regFile_3 <= debugRegs_3
    io_regFile_4 <= debugRegs_4
    io_regFile_5 <= debugRegs_5
    io_regFile_6 <= debugRegs_6
    io_regFile_7 <= debugRegs_7
    io_regFile_8 <= debugRegs_8
    io_regFile_9 <= debugRegs_9
    io_regFile_10 <= debugRegs_10
    io_regFile_11 <= debugRegs_11
    io_regFile_12 <= debugRegs_12
    io_regFile_13 <= debugRegs_13
    io_regFile_14 <= debugRegs_14
    io_regFile_15 <= debugRegs_15
    io_regFile_16 <= debugRegs_16
    io_regFile_17 <= debugRegs_17
    io_regFile_18 <= debugRegs_18
    io_regFile_19 <= debugRegs_19
    io_regFile_20 <= debugRegs_20
    io_regFile_21 <= debugRegs_21
    io_regFile_22 <= debugRegs_22
    io_regFile_23 <= debugRegs_23
    io_regFile_24 <= debugRegs_24
    io_regFile_25 <= debugRegs_25
    io_regFile_26 <= debugRegs_26
    io_regFile_27 <= debugRegs_27
    io_regFile_28 <= debugRegs_28
    io_regFile_29 <= debugRegs_29
    io_regFile_30 <= debugRegs_30
    io_regFile_31 <= debugRegs_31
    io_led <= ledReg
    io_tx <= cpuTop.io_tx @[WildcatTestTop.scala 54:9]
    io_stop <= decExRegdecOutisECall
    io_cycles <= cyclesReg
    io_pc <= pcReg
    io_pcRegReg <= pcRegReg
    io_decExReg <= decExRegpc
    io_doBranch <= doBranch
    io_instr <= instr
    io_instrReg <= instrReg
    cpuTop.clock <= clock
    cpuTop.reset <= reset
    cpuTop.io_rx <= io_rx @[WildcatTestTop.scala 53:16]
