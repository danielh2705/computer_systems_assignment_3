error id: file:///C:/Users/skoot/Desktop/Computer%20Systems/computer_systems_assignment_3/src/main/scala/Accelerator.scala:
file:///C:/Users/skoot/Desktop/Computer%20Systems/computer_systems_assignment_3/src/main/scala/Accelerator.scala
empty definition using pc, found symbol in pc: 
empty definition using semanticdb
empty definition using fallback
non-local guesses:
	 -chisel3/write.
	 -chisel3/write#
	 -chisel3/write().
	 -chisel3/util/write.
	 -chisel3/util/write#
	 -chisel3/util/write().
	 -write.
	 -write#
	 -write().
	 -scala/Predef.write.
	 -scala/Predef.write#
	 -scala/Predef.write().
offset: 2163
uri: file:///C:/Users/skoot/Desktop/Computer%20Systems/computer_systems_assignment_3/src/main/scala/Accelerator.scala
text:
```scala
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
      dataReg := Cat(0.U(24.W), io.dataRead(7, 0))
      stateReg := checkBorderAndSelf
    }

    is(checkBordeAndSelfr) {
      when(x === 0.U || y === 0.U || x === 19.U || y === 19.U||dataReg === 0.U) {
        stateReg := dataSet0
      }.otherwise {
        stateReg := checkNeighborLeft
      }
    }

  

    is(checkNeighborLeft) {
      io.address := addressReg - 1.U
      when(io.dataRead(7, 0) === 0.U) {
        stateReg := dataSet0
      }.otherwise {
        stateReg := checkNeighborRight
      }
    }

    is(checkNeighborRight) {
      io.address := addressReg + 1.U
      when(io.dataRead(7, 0) === 0.U) {
        stateReg := dataSet0
      }.otherwise {
        stateReg := checkNeighborUp
      }
    }

    is(checkNeighborUp) {
      io.address := addressReg - 20.U
      when(io.dataRead(7, 0) === 0.U) {
        stateReg := dataSet0
      }.otherwise {
        stateReg := checkNeighborDown
      }
    }

    is(checkNeighborDown) {
      io.address := addressReg + 20.U
      when(io.dataRead(7, 0) === 0.U) {
        dataReg := 0.U
        stateReg := wr@@ite
      }.otherwise {
        stateReg := dataSet255
      }
    }

    is(dataSet0) {
      dataReg := 0.U(32.W)
      stateReg := write
    }

    is(dataSet255) {
      dataReg := 255.U(32.W)
      stateReg := write
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

```


#### Short summary: 

empty definition using pc, found symbol in pc: 