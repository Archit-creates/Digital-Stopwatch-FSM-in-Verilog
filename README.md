# Digital-Stopwatch-FSM-in-Verilog
This project implements a digital stopwatch using Verilog HDL based on an FSM (Finite State Machine) architecture. It simulates the stopwatch in Xilinx Vivado, and optionally supports deployment on FPGA boards like Basys 3 or Nexys A7.
📌 Features
1. Start / Pause / Reset functionality via FSM
2. MM:SS BCD counter (0–59:59)
3. 7-segment display multiplexing
4. Behavioral simulation in Vivado
5. Modular, well-documented Verilog code

🧠 FSM Design
1. IDLE: Await start
2. RUN: Counting
3. PAUSE: Halt without resetting
4. Transitions triggered by single push-button logic (start_stop)

🖥️ Simulation (Vivado)
1. Create RTL project in Vivado
2. Add all .v files
3. Set stopwatch_tb.v as top
4. Run Behavioral Simulation
5. Observe FSM states and counter in waveform viewer
