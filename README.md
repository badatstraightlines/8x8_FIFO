8×8 FIFO Design using Verilog

A synchronous 8-bit × 8-depth FIFO (First-In, First-Out) designed and implemented using Verilog HDL and verified through RTL simulation.

📌 Overview

A FIFO is a fundamental digital design block used for temporarily storing data while maintaining the order in which it was written.

This project implements an 8×8 FIFO, capable of storing:

8 data words
8 bits per word
64 bits of total storage

The design supports independent read and write operations while maintaining correct FIFO ordering and preventing invalid operations such as overflow and underflow.

⚙️ Architecture
                 ┌─────────────────────┐
        Write ──►│                     │
      write_en ─►│      8 × 8 FIFO     │──► Read
                 │                     │
       Full ◄────│                     │
      Empty ◄────│                     │
                 └─────────────────────┘
                       ▲       ▲
                       │       │
                  Write Ptr  Read Ptr
Key Components
8 × 8 Memory Array – stores eight 8-bit data words
Write Pointer – tracks the location for the next write
Read Pointer – tracks the location for the next read
Full Flag – indicates that the FIFO cannot accept additional data
Empty Flag – indicates that no data is available to read
Control Logic – manages valid read/write operations
🔄 FIFO Operation
Write Operation

When write_en is asserted and the FIFO is not full:

Input data is written into the memory location addressed by the write pointer.
The write pointer advances to the next location.
FIFO status is updated accordingly.
Read Operation

When read_en is asserted and the FIFO is not empty:

Data is read from the location addressed by the read pointer.
The read pointer advances to the next location.
FIFO status is updated accordingly.
Full & Empty Conditions

The control logic prevents:

Overflow: writing when the FIFO is full
Underflow: reading when the FIFO is empty
🧪 Verification

The FIFO was verified using an HDL testbench to validate:

Reset operation
Sequential write operations
Sequential read operations
FIFO data ordering
Full condition
Empty condition
Read/write pointer progression
Boundary conditions
Read/write operation behavior

A typical verification sequence is:

RESET
  ↓
WRITE DATA
  ↓
FILL FIFO
  ↓
CHECK FULL
  ↓
READ DATA
  ↓
CHECK FIFO ORDER
  ↓
EMPTY FIFO
  ↓
CHECK EMPTY
🛠️ Tools & Technologies
Tool / Technology	Purpose
Verilog HDL	RTL design
Xilinx Vivado	Simulation and RTL verification
HDL Testbench	Functional validation
Git / GitHub	Version control and project hosting
📂 Repository Structure
8x8_FIFO/
│
├── RTL / Verilog source files
├── Testbench
└── README.md

The exact filenames may vary depending on the RTL organization used in the project.

🎯 Learning Outcomes

This project demonstrates practical understanding of:

RTL design using Verilog
Sequential digital logic
Memory-based data storage
Read/write pointer design
FIFO control logic
Full and empty detection
HDL testbench development
RTL simulation and verification


👤 Author

Srihari Prabha

Electronics & VLSI Engineering
VIT Vellore
