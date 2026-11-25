import chisel3._
import chisel3.util._

class Accelerator extends Module {
  val io = IO(new Bundle {
    val start = Input(Bool())
    val done = Output(Bool())

    val address = Output(UInt(16.W))
    val dataRead = Input(UInt(32.W))
    val writeEnable = Output(Bool())
    val dataWrite = Output(UInt(32.W))
  })
  // Write here your code
  val idle :: read :: write :: done :: checkBorderAndSelf :: checkNeighborLeft :: checkNeighborRight :: checkNeighborUp :: checkNeighborDown :: dataSet0 :: dataSet255 :: Nil =
    Enum(11)
  val stateReg = RegInit(idle)
  val x = RegInit(0.U(16.W))
  val y = RegInit(0.U(16.W))
  val addressReg = RegInit(0.U(16.W))
  val dataReg = RegInit(0.U(32.W))
  io.writeEnable := false.B
  io.address := addressReg
  io.dataWrite := dataReg
  io.done := false.B

  switch(stateReg) {

    is(idle) {
      when(io.start === 0.U) {
        stateReg := idle
      }.otherwise {
        stateReg := read
      }
    }
    is(read) {
      io.address := addressReg
      when(
        x === 0.U || y === 0.U || x === 19.U || y === 19.U ||
        io.dataRead(7, 0) === 0.U
      ) {
        dataReg := 0.U
        stateReg := write
      }.otherwise {
        stateReg := checkNeighborLeft
      }
    }
      

    is(checkNeighborLeft) {
      io.address := addressReg - 1.U
      when(io.dataRead(7, 0) === 0.U) {
        dataReg := 0.U
        stateReg := write
      }.otherwise {
        dataReg := 255.U
        stateReg := checkNeighborRight
      }
    }

    is(checkNeighborRight) {
      io.address := addressReg + 1.U
      when(io.dataRead(7, 0) === 0.U) {
        dataReg := 0.U
        stateReg := write
      }.otherwise {
        dataReg := 255.U
        stateReg := checkNeighborUp
      }
    }

    is(checkNeighborUp) {
      io.address := addressReg - 20.U
      when(io.dataRead(7, 0) === 0.U) {
        dataReg := 0.U
        stateReg := write
      }.otherwise {
        dataReg := 255.U
        stateReg := checkNeighborDown
      }
    }

    is(checkNeighborDown) {
      io.address := addressReg + 20.U
      when(io.dataRead(7, 0) === 0.U) {
        dataReg := 0.U
        stateReg := write
      }.otherwise {
        dataReg := 255.U
        stateReg := write
      }
    }


    is(write) {
      io.address := addressReg + 400.U(16.W)
      io.writeEnable := true.B
      when(addressReg === 399.U(16.W)) {
        stateReg := done
      }.otherwise {
        when(y === 19.U) {
          x := x + 1.U
          y := 0.U
          addressReg := x + 1.U
        }.otherwise {
          y := y + 1.U
          addressReg := addressReg + 20.U
        }
        stateReg := read
      }
    }

    is(done) {
      io.done := true.B
      stateReg := done
    }

  }
}
