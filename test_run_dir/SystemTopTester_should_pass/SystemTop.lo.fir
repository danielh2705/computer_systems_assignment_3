FIRRTL version 1.2.0
circuit SystemTop :
  module DataMemory :
    input clock : Clock
    input reset : UInt<1>
    input io_address : UInt<16> @[\\src\\main\\scala\\DataMemory.scala 5:14]
    output io_dataRead : UInt<32> @[\\src\\main\\scala\\DataMemory.scala 5:14]
    input io_writeEnable : UInt<1> @[\\src\\main\\scala\\DataMemory.scala 5:14]
    input io_dataWrite : UInt<32> @[\\src\\main\\scala\\DataMemory.scala 5:14]
    input io_testerEnable : UInt<1> @[\\src\\main\\scala\\DataMemory.scala 5:14]
    input io_testerAddress : UInt<16> @[\\src\\main\\scala\\DataMemory.scala 5:14]
    output io_testerDataRead : UInt<32> @[\\src\\main\\scala\\DataMemory.scala 5:14]
    input io_testerWriteEnable : UInt<1> @[\\src\\main\\scala\\DataMemory.scala 5:14]
    input io_testerDataWrite : UInt<32> @[\\src\\main\\scala\\DataMemory.scala 5:14]

    mem memory : @[\\src\\main\\scala\\DataMemory.scala 19:20]
      data-type => UInt<32>
      depth => 65536
      read-latency => 0
      write-latency => 1
      reader => io_testerDataRead_MPORT
      reader => io_dataRead_MPORT
      writer => MPORT
      writer => MPORT_1
      read-under-write => undefined
    node _GEN_0 = validif(io_testerWriteEnable, io_testerAddress) @[\\src\\main\\scala\\DataMemory.scala 28:32]
    node _GEN_1 = validif(io_testerWriteEnable, clock) @[\\src\\main\\scala\\DataMemory.scala 28:32]
    node _GEN_2 = mux(io_testerWriteEnable, UInt<1>("h1"), UInt<1>("h0")) @[\\src\\main\\scala\\DataMemory.scala 19:20 28:32]
    node _GEN_3 = validif(io_testerWriteEnable, UInt<1>("h1")) @[\\src\\main\\scala\\DataMemory.scala 28:32]
    node _GEN_4 = validif(io_testerWriteEnable, io_testerDataWrite) @[\\src\\main\\scala\\DataMemory.scala 28:32]
    node _GEN_5 = mux(io_testerWriteEnable, io_testerDataWrite, memory.io_testerDataRead_MPORT.data) @[\\src\\main\\scala\\DataMemory.scala 25:23 28:32 31:25]
    node _GEN_6 = validif(io_writeEnable, io_address) @[\\src\\main\\scala\\DataMemory.scala 38:26]
    node _GEN_7 = validif(io_writeEnable, clock) @[\\src\\main\\scala\\DataMemory.scala 38:26]
    node _GEN_8 = mux(io_writeEnable, UInt<1>("h1"), UInt<1>("h0")) @[\\src\\main\\scala\\DataMemory.scala 19:20 38:26]
    node _GEN_9 = validif(io_writeEnable, UInt<1>("h1")) @[\\src\\main\\scala\\DataMemory.scala 38:26]
    node _GEN_10 = validif(io_writeEnable, io_dataWrite) @[\\src\\main\\scala\\DataMemory.scala 38:26]
    node _GEN_11 = mux(io_writeEnable, io_dataWrite, memory.io_dataRead_MPORT.data) @[\\src\\main\\scala\\DataMemory.scala 35:17 38:26 41:19]
    node _GEN_12 = validif(io_testerEnable, io_testerAddress) @[\\src\\main\\scala\\DataMemory.scala 23:24 25:37]
    node _GEN_13 = validif(io_testerEnable, clock) @[\\src\\main\\scala\\DataMemory.scala 23:24 25:37]
    node _GEN_14 = mux(io_testerEnable, UInt<1>("h1"), UInt<1>("h0")) @[\\src\\main\\scala\\DataMemory.scala 19:20 23:24 25:37]
    node _GEN_15 = mux(io_testerEnable, _GEN_5, UInt<32>("h0")) @[\\src\\main\\scala\\DataMemory.scala 23:24 37:23]
    node _GEN_16 = mux(io_testerEnable, UInt<32>("h0"), _GEN_11) @[\\src\\main\\scala\\DataMemory.scala 23:24 27:17]
    node _GEN_17 = validif(io_testerEnable, _GEN_0) @[\\src\\main\\scala\\DataMemory.scala 23:24]
    node _GEN_18 = validif(io_testerEnable, _GEN_1) @[\\src\\main\\scala\\DataMemory.scala 23:24]
    node _GEN_19 = mux(io_testerEnable, _GEN_2, UInt<1>("h0")) @[\\src\\main\\scala\\DataMemory.scala 19:20 23:24]
    node _GEN_20 = validif(io_testerEnable, _GEN_3) @[\\src\\main\\scala\\DataMemory.scala 23:24]
    node _GEN_21 = validif(io_testerEnable, _GEN_4) @[\\src\\main\\scala\\DataMemory.scala 23:24]
    node _GEN_22 = validif(eq(io_testerEnable, UInt<1>("h0")), io_address) @[\\src\\main\\scala\\DataMemory.scala 23:24 35:31]
    node _GEN_23 = validif(eq(io_testerEnable, UInt<1>("h0")), clock) @[\\src\\main\\scala\\DataMemory.scala 23:24 35:31]
    node _GEN_24 = mux(io_testerEnable, UInt<1>("h0"), UInt<1>("h1")) @[\\src\\main\\scala\\DataMemory.scala 19:20 23:24 35:31]
    node _GEN_25 = validif(eq(io_testerEnable, UInt<1>("h0")), _GEN_6) @[\\src\\main\\scala\\DataMemory.scala 23:24]
    node _GEN_26 = validif(eq(io_testerEnable, UInt<1>("h0")), _GEN_7) @[\\src\\main\\scala\\DataMemory.scala 23:24]
    node _GEN_27 = mux(io_testerEnable, UInt<1>("h0"), _GEN_8) @[\\src\\main\\scala\\DataMemory.scala 19:20 23:24]
    node _GEN_28 = validif(eq(io_testerEnable, UInt<1>("h0")), _GEN_9) @[\\src\\main\\scala\\DataMemory.scala 23:24]
    node _GEN_29 = validif(eq(io_testerEnable, UInt<1>("h0")), _GEN_10) @[\\src\\main\\scala\\DataMemory.scala 23:24]
    io_dataRead <= _GEN_16
    io_testerDataRead <= _GEN_15
    memory.io_testerDataRead_MPORT.addr <= _GEN_12
    memory.io_testerDataRead_MPORT.en <= _GEN_14
    memory.io_testerDataRead_MPORT.clk <= _GEN_13
    memory.io_dataRead_MPORT.addr <= _GEN_22
    memory.io_dataRead_MPORT.en <= _GEN_24
    memory.io_dataRead_MPORT.clk <= _GEN_23
    memory.MPORT.addr <= _GEN_17
    memory.MPORT.en <= _GEN_19
    memory.MPORT.clk <= _GEN_18
    memory.MPORT.data <= _GEN_21
    memory.MPORT.mask <= _GEN_20
    memory.MPORT_1.addr <= _GEN_25
    memory.MPORT_1.en <= _GEN_27
    memory.MPORT_1.clk <= _GEN_26
    memory.MPORT_1.data <= _GEN_29
    memory.MPORT_1.mask <= _GEN_28

  module Accelerator :
    input clock : Clock
    input reset : UInt<1>
    input io_start : UInt<1> @[\\src\\main\\scala\\Accelerator.scala 5:14]
    output io_done : UInt<1> @[\\src\\main\\scala\\Accelerator.scala 5:14]
    output io_address : UInt<16> @[\\src\\main\\scala\\Accelerator.scala 5:14]
    input io_dataRead : UInt<32> @[\\src\\main\\scala\\Accelerator.scala 5:14]
    output io_writeEnable : UInt<1> @[\\src\\main\\scala\\Accelerator.scala 5:14]
    output io_dataWrite : UInt<32> @[\\src\\main\\scala\\Accelerator.scala 5:14]

    reg stateReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[\\src\\main\\scala\\Accelerator.scala 17:25]
    reg x : UInt<16>, clock with :
      reset => (UInt<1>("h0"), x) @[\\src\\main\\scala\\Accelerator.scala 18:18]
    reg y : UInt<16>, clock with :
      reset => (UInt<1>("h0"), y) @[\\src\\main\\scala\\Accelerator.scala 19:18]
    reg addressReg : UInt<16>, clock with :
      reset => (UInt<1>("h0"), addressReg) @[\\src\\main\\scala\\Accelerator.scala 20:27]
    reg dataReg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[\\src\\main\\scala\\Accelerator.scala 21:24]
    node _T = eq(UInt<4>("h0"), stateReg) @[\\src\\main\\scala\\Accelerator.scala 27:20]
    node _T_1 = eq(io_start, UInt<1>("h0")) @[\\src\\main\\scala\\Accelerator.scala 30:21]
    node _GEN_0 = mux(_T_1, UInt<4>("h0"), UInt<4>("h1")) @[\\src\\main\\scala\\Accelerator.scala 30:30 31:18 33:18]
    node _T_2 = eq(UInt<4>("h1"), stateReg) @[\\src\\main\\scala\\Accelerator.scala 27:20]
    node _T_3 = eq(x, UInt<1>("h0")) @[\\src\\main\\scala\\Accelerator.scala 39:7]
    node _T_4 = eq(y, UInt<1>("h0")) @[\\src\\main\\scala\\Accelerator.scala 39:20]
    node _T_5 = or(_T_3, _T_4) @[\\src\\main\\scala\\Accelerator.scala 39:15]
    node _T_6 = eq(x, UInt<5>("h13")) @[\\src\\main\\scala\\Accelerator.scala 39:33]
    node _T_7 = or(_T_5, _T_6) @[\\src\\main\\scala\\Accelerator.scala 39:28]
    node _T_8 = eq(y, UInt<5>("h13")) @[\\src\\main\\scala\\Accelerator.scala 39:47]
    node _T_9 = or(_T_7, _T_8) @[\\src\\main\\scala\\Accelerator.scala 39:42]
    node _T_10 = bits(io_dataRead, 7, 0) @[\\src\\main\\scala\\Accelerator.scala 40:16]
    node _T_11 = eq(_T_10, UInt<1>("h0")) @[\\src\\main\\scala\\Accelerator.scala 40:23]
    node _T_12 = or(_T_9, _T_11) @[\\src\\main\\scala\\Accelerator.scala 39:56]
    node _GEN_1 = mux(_T_12, UInt<1>("h0"), dataReg) @[\\src\\main\\scala\\Accelerator.scala 41:5 42:13 21:24]
    node _GEN_2 = mux(_T_12, UInt<4>("h2"), UInt<4>("h5")) @[\\src\\main\\scala\\Accelerator.scala 41:5 43:14 45:14]
    node _T_13 = eq(UInt<4>("h5"), stateReg) @[\\src\\main\\scala\\Accelerator.scala 27:20]
    node _io_address_T = sub(addressReg, UInt<1>("h1")) @[\\src\\main\\scala\\Accelerator.scala 51:32]
    node _io_address_T_1 = tail(_io_address_T, 1) @[\\src\\main\\scala\\Accelerator.scala 51:32]
    node _T_14 = bits(io_dataRead, 7, 0) @[\\src\\main\\scala\\Accelerator.scala 52:23]
    node _T_15 = eq(_T_14, UInt<1>("h0")) @[\\src\\main\\scala\\Accelerator.scala 52:30]
    node _GEN_3 = mux(_T_15, UInt<1>("h0"), UInt<8>("hff")) @[\\src\\main\\scala\\Accelerator.scala 52:39 53:17 56:17]
    node _GEN_4 = mux(_T_15, UInt<4>("h2"), UInt<4>("h6")) @[\\src\\main\\scala\\Accelerator.scala 52:39 54:18 57:18]
    node _T_16 = eq(UInt<4>("h6"), stateReg) @[\\src\\main\\scala\\Accelerator.scala 27:20]
    node _io_address_T_2 = add(addressReg, UInt<1>("h1")) @[\\src\\main\\scala\\Accelerator.scala 62:32]
    node _io_address_T_3 = tail(_io_address_T_2, 1) @[\\src\\main\\scala\\Accelerator.scala 62:32]
    node _T_17 = bits(io_dataRead, 7, 0) @[\\src\\main\\scala\\Accelerator.scala 63:23]
    node _T_18 = eq(_T_17, UInt<1>("h0")) @[\\src\\main\\scala\\Accelerator.scala 63:30]
    node _GEN_5 = mux(_T_18, UInt<1>("h0"), UInt<8>("hff")) @[\\src\\main\\scala\\Accelerator.scala 63:39 64:17 67:17]
    node _GEN_6 = mux(_T_18, UInt<4>("h2"), UInt<4>("h7")) @[\\src\\main\\scala\\Accelerator.scala 63:39 65:18 68:18]
    node _T_19 = eq(UInt<4>("h7"), stateReg) @[\\src\\main\\scala\\Accelerator.scala 27:20]
    node _io_address_T_4 = sub(addressReg, UInt<5>("h14")) @[\\src\\main\\scala\\Accelerator.scala 73:32]
    node _io_address_T_5 = tail(_io_address_T_4, 1) @[\\src\\main\\scala\\Accelerator.scala 73:32]
    node _T_20 = bits(io_dataRead, 7, 0) @[\\src\\main\\scala\\Accelerator.scala 74:23]
    node _T_21 = eq(_T_20, UInt<1>("h0")) @[\\src\\main\\scala\\Accelerator.scala 74:30]
    node _GEN_7 = mux(_T_21, UInt<1>("h0"), UInt<8>("hff")) @[\\src\\main\\scala\\Accelerator.scala 74:39 75:17 78:17]
    node _GEN_8 = mux(_T_21, UInt<4>("h2"), UInt<4>("h8")) @[\\src\\main\\scala\\Accelerator.scala 74:39 76:18 79:18]
    node _T_22 = eq(UInt<4>("h8"), stateReg) @[\\src\\main\\scala\\Accelerator.scala 27:20]
    node _io_address_T_6 = add(addressReg, UInt<5>("h14")) @[\\src\\main\\scala\\Accelerator.scala 84:32]
    node _io_address_T_7 = tail(_io_address_T_6, 1) @[\\src\\main\\scala\\Accelerator.scala 84:32]
    node _T_23 = bits(io_dataRead, 7, 0) @[\\src\\main\\scala\\Accelerator.scala 85:23]
    node _T_24 = eq(_T_23, UInt<1>("h0")) @[\\src\\main\\scala\\Accelerator.scala 85:30]
    node _GEN_9 = mux(_T_24, UInt<1>("h0"), UInt<8>("hff")) @[\\src\\main\\scala\\Accelerator.scala 85:39 86:17 89:17]
    node _GEN_10 = mux(_T_24, UInt<4>("h2"), UInt<4>("h2")) @[\\src\\main\\scala\\Accelerator.scala 85:39 87:18 90:18]
    node _T_25 = eq(UInt<4>("h2"), stateReg) @[\\src\\main\\scala\\Accelerator.scala 27:20]
    node _io_address_T_8 = add(addressReg, UInt<16>("h190")) @[\\src\\main\\scala\\Accelerator.scala 96:32]
    node _io_address_T_9 = tail(_io_address_T_8, 1) @[\\src\\main\\scala\\Accelerator.scala 96:32]
    node _T_26 = eq(addressReg, UInt<16>("h18f")) @[\\src\\main\\scala\\Accelerator.scala 98:23]
    node _T_27 = eq(y, UInt<5>("h13")) @[\\src\\main\\scala\\Accelerator.scala 101:16]
    node _x_T = add(x, UInt<1>("h1")) @[\\src\\main\\scala\\Accelerator.scala 102:18]
    node _x_T_1 = tail(_x_T, 1) @[\\src\\main\\scala\\Accelerator.scala 102:18]
    node _addressReg_T = add(x, UInt<1>("h1")) @[\\src\\main\\scala\\Accelerator.scala 104:27]
    node _addressReg_T_1 = tail(_addressReg_T, 1) @[\\src\\main\\scala\\Accelerator.scala 104:27]
    node _y_T = add(y, UInt<1>("h1")) @[\\src\\main\\scala\\Accelerator.scala 106:18]
    node _y_T_1 = tail(_y_T, 1) @[\\src\\main\\scala\\Accelerator.scala 106:18]
    node _addressReg_T_2 = add(addressReg, UInt<5>("h14")) @[\\src\\main\\scala\\Accelerator.scala 107:36]
    node _addressReg_T_3 = tail(_addressReg_T_2, 1) @[\\src\\main\\scala\\Accelerator.scala 107:36]
    node _GEN_11 = mux(_T_27, _x_T_1, x) @[\\src\\main\\scala\\Accelerator.scala 101:26 102:13 18:18]
    node _GEN_12 = mux(_T_27, UInt<1>("h0"), _y_T_1) @[\\src\\main\\scala\\Accelerator.scala 101:26 103:13 106:13]
    node _GEN_13 = mux(_T_27, _addressReg_T_1, _addressReg_T_3) @[\\src\\main\\scala\\Accelerator.scala 101:26 104:22 107:22]
    node _GEN_14 = mux(_T_26, UInt<4>("h3"), UInt<4>("h1")) @[\\src\\main\\scala\\Accelerator.scala 109:18 98:40 99:18]
    node _GEN_15 = mux(_T_26, x, _GEN_11) @[\\src\\main\\scala\\Accelerator.scala 18:18 98:40]
    node _GEN_16 = mux(_T_26, y, _GEN_12) @[\\src\\main\\scala\\Accelerator.scala 19:18 98:40]
    node _GEN_17 = mux(_T_26, addressReg, _GEN_13) @[\\src\\main\\scala\\Accelerator.scala 20:27 98:40]
    node _T_28 = eq(UInt<4>("h3"), stateReg) @[\\src\\main\\scala\\Accelerator.scala 27:20]
    node _GEN_18 = mux(_T_28, UInt<1>("h1"), UInt<1>("h0")) @[\\src\\main\\scala\\Accelerator.scala 114:15 25:11 27:20]
    node _GEN_19 = mux(_T_28, UInt<4>("h3"), stateReg) @[\\src\\main\\scala\\Accelerator.scala 115:16 27:20 17:25]
    node _GEN_20 = mux(_T_25, _io_address_T_9, addressReg) @[\\src\\main\\scala\\Accelerator.scala 23:14 27:20 96:18]
    node _GEN_21 = mux(_T_25, UInt<1>("h1"), UInt<1>("h0")) @[\\src\\main\\scala\\Accelerator.scala 22:18 27:20 97:22]
    node _GEN_22 = mux(_T_25, _GEN_14, _GEN_19) @[\\src\\main\\scala\\Accelerator.scala 27:20]
    node _GEN_23 = mux(_T_25, _GEN_15, x) @[\\src\\main\\scala\\Accelerator.scala 18:18 27:20]
    node _GEN_24 = mux(_T_25, _GEN_16, y) @[\\src\\main\\scala\\Accelerator.scala 19:18 27:20]
    node _GEN_25 = mux(_T_25, _GEN_17, addressReg) @[\\src\\main\\scala\\Accelerator.scala 27:20 20:27]
    node _GEN_26 = mux(_T_25, UInt<1>("h0"), _GEN_18) @[\\src\\main\\scala\\Accelerator.scala 25:11 27:20]
    node _GEN_27 = mux(_T_22, _io_address_T_7, _GEN_20) @[\\src\\main\\scala\\Accelerator.scala 27:20 84:18]
    node _GEN_28 = mux(_T_22, _GEN_9, dataReg) @[\\src\\main\\scala\\Accelerator.scala 27:20 21:24]
    node _GEN_29 = mux(_T_22, _GEN_10, _GEN_22) @[\\src\\main\\scala\\Accelerator.scala 27:20]
    node _GEN_30 = mux(_T_22, UInt<1>("h0"), _GEN_21) @[\\src\\main\\scala\\Accelerator.scala 22:18 27:20]
    node _GEN_31 = mux(_T_22, x, _GEN_23) @[\\src\\main\\scala\\Accelerator.scala 18:18 27:20]
    node _GEN_32 = mux(_T_22, y, _GEN_24) @[\\src\\main\\scala\\Accelerator.scala 19:18 27:20]
    node _GEN_33 = mux(_T_22, addressReg, _GEN_25) @[\\src\\main\\scala\\Accelerator.scala 27:20 20:27]
    node _GEN_34 = mux(_T_22, UInt<1>("h0"), _GEN_26) @[\\src\\main\\scala\\Accelerator.scala 25:11 27:20]
    node _GEN_35 = mux(_T_19, _io_address_T_5, _GEN_27) @[\\src\\main\\scala\\Accelerator.scala 27:20 73:18]
    node _GEN_36 = mux(_T_19, _GEN_7, _GEN_28) @[\\src\\main\\scala\\Accelerator.scala 27:20]
    node _GEN_37 = mux(_T_19, _GEN_8, _GEN_29) @[\\src\\main\\scala\\Accelerator.scala 27:20]
    node _GEN_38 = mux(_T_19, UInt<1>("h0"), _GEN_30) @[\\src\\main\\scala\\Accelerator.scala 22:18 27:20]
    node _GEN_39 = mux(_T_19, x, _GEN_31) @[\\src\\main\\scala\\Accelerator.scala 18:18 27:20]
    node _GEN_40 = mux(_T_19, y, _GEN_32) @[\\src\\main\\scala\\Accelerator.scala 19:18 27:20]
    node _GEN_41 = mux(_T_19, addressReg, _GEN_33) @[\\src\\main\\scala\\Accelerator.scala 27:20 20:27]
    node _GEN_42 = mux(_T_19, UInt<1>("h0"), _GEN_34) @[\\src\\main\\scala\\Accelerator.scala 25:11 27:20]
    node _GEN_43 = mux(_T_16, _io_address_T_3, _GEN_35) @[\\src\\main\\scala\\Accelerator.scala 27:20 62:18]
    node _GEN_44 = mux(_T_16, _GEN_5, _GEN_36) @[\\src\\main\\scala\\Accelerator.scala 27:20]
    node _GEN_45 = mux(_T_16, _GEN_6, _GEN_37) @[\\src\\main\\scala\\Accelerator.scala 27:20]
    node _GEN_46 = mux(_T_16, UInt<1>("h0"), _GEN_38) @[\\src\\main\\scala\\Accelerator.scala 22:18 27:20]
    node _GEN_47 = mux(_T_16, x, _GEN_39) @[\\src\\main\\scala\\Accelerator.scala 18:18 27:20]
    node _GEN_48 = mux(_T_16, y, _GEN_40) @[\\src\\main\\scala\\Accelerator.scala 19:18 27:20]
    node _GEN_49 = mux(_T_16, addressReg, _GEN_41) @[\\src\\main\\scala\\Accelerator.scala 27:20 20:27]
    node _GEN_50 = mux(_T_16, UInt<1>("h0"), _GEN_42) @[\\src\\main\\scala\\Accelerator.scala 25:11 27:20]
    node _GEN_51 = mux(_T_13, _io_address_T_1, _GEN_43) @[\\src\\main\\scala\\Accelerator.scala 27:20 51:18]
    node _GEN_52 = mux(_T_13, _GEN_3, _GEN_44) @[\\src\\main\\scala\\Accelerator.scala 27:20]
    node _GEN_53 = mux(_T_13, _GEN_4, _GEN_45) @[\\src\\main\\scala\\Accelerator.scala 27:20]
    node _GEN_54 = mux(_T_13, UInt<1>("h0"), _GEN_46) @[\\src\\main\\scala\\Accelerator.scala 22:18 27:20]
    node _GEN_55 = mux(_T_13, x, _GEN_47) @[\\src\\main\\scala\\Accelerator.scala 18:18 27:20]
    node _GEN_56 = mux(_T_13, y, _GEN_48) @[\\src\\main\\scala\\Accelerator.scala 19:18 27:20]
    node _GEN_57 = mux(_T_13, addressReg, _GEN_49) @[\\src\\main\\scala\\Accelerator.scala 27:20 20:27]
    node _GEN_58 = mux(_T_13, UInt<1>("h0"), _GEN_50) @[\\src\\main\\scala\\Accelerator.scala 25:11 27:20]
    node _GEN_59 = mux(_T_2, addressReg, _GEN_51) @[\\src\\main\\scala\\Accelerator.scala 27:20 37:14]
    node _GEN_60 = mux(_T_2, _GEN_1, _GEN_52) @[\\src\\main\\scala\\Accelerator.scala 27:20]
    node _GEN_61 = mux(_T_2, _GEN_2, _GEN_53) @[\\src\\main\\scala\\Accelerator.scala 27:20]
    node _GEN_62 = mux(_T_2, UInt<1>("h0"), _GEN_54) @[\\src\\main\\scala\\Accelerator.scala 22:18 27:20]
    node _GEN_63 = mux(_T_2, x, _GEN_55) @[\\src\\main\\scala\\Accelerator.scala 18:18 27:20]
    node _GEN_64 = mux(_T_2, y, _GEN_56) @[\\src\\main\\scala\\Accelerator.scala 19:18 27:20]
    node _GEN_65 = mux(_T_2, addressReg, _GEN_57) @[\\src\\main\\scala\\Accelerator.scala 27:20 20:27]
    node _GEN_66 = mux(_T_2, UInt<1>("h0"), _GEN_58) @[\\src\\main\\scala\\Accelerator.scala 25:11 27:20]
    node _GEN_67 = mux(_T, _GEN_0, _GEN_61) @[\\src\\main\\scala\\Accelerator.scala 27:20]
    node _GEN_68 = mux(_T, addressReg, _GEN_59) @[\\src\\main\\scala\\Accelerator.scala 23:14 27:20]
    node _GEN_69 = mux(_T, dataReg, _GEN_60) @[\\src\\main\\scala\\Accelerator.scala 27:20 21:24]
    node _GEN_70 = mux(_T, UInt<1>("h0"), _GEN_62) @[\\src\\main\\scala\\Accelerator.scala 22:18 27:20]
    node _GEN_71 = mux(_T, x, _GEN_63) @[\\src\\main\\scala\\Accelerator.scala 18:18 27:20]
    node _GEN_72 = mux(_T, y, _GEN_64) @[\\src\\main\\scala\\Accelerator.scala 19:18 27:20]
    node _GEN_73 = mux(_T, addressReg, _GEN_65) @[\\src\\main\\scala\\Accelerator.scala 27:20 20:27]
    node _GEN_74 = mux(_T, UInt<1>("h0"), _GEN_66) @[\\src\\main\\scala\\Accelerator.scala 25:11 27:20]
    io_done <= _GEN_74
    io_address <= _GEN_68
    io_writeEnable <= _GEN_70
    io_dataWrite <= dataReg @[\\src\\main\\scala\\Accelerator.scala 24:16]
    stateReg <= mux(reset, UInt<4>("h0"), _GEN_67) @[\\src\\main\\scala\\Accelerator.scala 17:{25,25}]
    x <= mux(reset, UInt<16>("h0"), _GEN_71) @[\\src\\main\\scala\\Accelerator.scala 18:{18,18}]
    y <= mux(reset, UInt<16>("h0"), _GEN_72) @[\\src\\main\\scala\\Accelerator.scala 19:{18,18}]
    addressReg <= mux(reset, UInt<16>("h0"), _GEN_73) @[\\src\\main\\scala\\Accelerator.scala 20:{27,27}]
    dataReg <= mux(reset, UInt<32>("h0"), _GEN_69) @[\\src\\main\\scala\\Accelerator.scala 21:{24,24}]

  module SystemTop :
    input clock : Clock
    input reset : UInt<1>
    output io_done : UInt<1> @[\\src\\main\\scala\\SystemTop.scala 5:14]
    input io_start : UInt<1> @[\\src\\main\\scala\\SystemTop.scala 5:14]
    input io_testerDataMemEnable : UInt<1> @[\\src\\main\\scala\\SystemTop.scala 5:14]
    input io_testerDataMemAddress : UInt<16> @[\\src\\main\\scala\\SystemTop.scala 5:14]
    output io_testerDataMemDataRead : UInt<32> @[\\src\\main\\scala\\SystemTop.scala 5:14]
    input io_testerDataMemWriteEnable : UInt<1> @[\\src\\main\\scala\\SystemTop.scala 5:14]
    input io_testerDataMemDataWrite : UInt<32> @[\\src\\main\\scala\\SystemTop.scala 5:14]

    inst dataMemory of DataMemory @[\\src\\main\\scala\\SystemTop.scala 18:26]
    inst accelerator of Accelerator @[\\src\\main\\scala\\SystemTop.scala 19:27]
    io_done <= accelerator.io_done @[\\src\\main\\scala\\SystemTop.scala 23:11]
    io_testerDataMemDataRead <= dataMemory.io_testerDataRead @[\\src\\main\\scala\\SystemTop.scala 34:28]
    dataMemory.clock <= clock
    dataMemory.reset <= reset
    dataMemory.io_address <= accelerator.io_address @[\\src\\main\\scala\\SystemTop.scala 28:25]
    dataMemory.io_writeEnable <= accelerator.io_writeEnable @[\\src\\main\\scala\\SystemTop.scala 30:29]
    dataMemory.io_dataWrite <= accelerator.io_dataWrite @[\\src\\main\\scala\\SystemTop.scala 29:27]
    dataMemory.io_testerEnable <= io_testerDataMemEnable @[\\src\\main\\scala\\SystemTop.scala 36:30]
    dataMemory.io_testerAddress <= io_testerDataMemAddress @[\\src\\main\\scala\\SystemTop.scala 33:31]
    dataMemory.io_testerWriteEnable <= io_testerDataMemWriteEnable @[\\src\\main\\scala\\SystemTop.scala 37:35]
    dataMemory.io_testerDataWrite <= io_testerDataMemDataWrite @[\\src\\main\\scala\\SystemTop.scala 35:33]
    accelerator.clock <= clock
    accelerator.reset <= reset
    accelerator.io_start <= io_start @[\\src\\main\\scala\\SystemTop.scala 24:24]
    accelerator.io_dataRead <= dataMemory.io_dataRead @[\\src\\main\\scala\\SystemTop.scala 27:27]
