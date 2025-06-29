# Traffic-light-controller-using-verilog
A traffic light controller project using FSM implemented in Verilog HDL
# 🚦 Traffic Light Controller using FSM in Verilog HDL

This project implements a 4-way traffic light controller using a **Finite State Machine (FSM)**, written in Verilog HDL. The system is designed to handle four directions — **North, South, East, and West**, each with RED, GREEN, and YELLOW signals. The design is synthesized and simulated using Synopsys tools.

---

## 📌 Project Summary

- **Design Style:** RTL
- **Language:** Verilog HDL
- **Design Methodology:** Finite State Machine (FSM)
- **Tools Used:** Synopsys VCS, Verdi, Design Compiler, ICC2
- **Target Application:** Digital VLSI design – Traffic Management System

---

## 🔧 Tools Used

| Tool         | Purpose                         |
|--------------|----------------------------------|
| **VCS**      | RTL simulation                   |
| **Verdi**    | Waveform and FSM visualization   |
| **Design Compiler (DC)** | Logic synthesis      |
| **ICC2**     | Physical Design (FP, PP, PnR, CTS) |

---

## 🔁 FSM Design & Logic Explanation

### ➤ State Encoding

The FSM has **8 states** representing traffic light transitions for all 4 directions:

| State | Description                    | Light Active |
|-------|--------------------------------|--------------|
| s0    | North Green                    | North        |
| s1    | North Yellow                   | North        |
| s2    | West Green                     | West         |
| s3    | West Yellow                    | West         |
| s4    | South Green                    | South        |
| s5    | South Yellow                   | South        |
| s6    | East Green                     | East         |
| s7    | East Yellow                    | East         |

### ➤ FSM Operation

- Each direction is allowed **Green** for **15 clock cycles** (or until its traffic signal becomes LOW).
- After Green, **Yellow** stays ON for **3 clock cycles** to indicate transition.
- Then, the FSM moves to the next direction in clockwise order.
- The cycle continues in the order: **North → West → South → East → North...**

### ➤ Traffic Inputs

| Signal | Description                |
|--------|----------------------------|
| `t1`   | Traffic presence - North   |
| `t2`   | Traffic presence - West    |
| `t3`   | Traffic presence - South   |
| `t4`   | Traffic presence - East    |

If a direction has **no traffic**, its green signal time may **cut short**.

---

## 💡 Output Encoding

Each light signal is 3 bits:

| Binary | Light |
|--------|-------|
| `100`  | RED   |
| `001`  | GREEN |
| `010`  | YELLOW|

---

## 🧪 Testbench & Simulation

### 🧰 Simulation Flow

1. **Clock Generation** – 10ns period (`#5 clk = ~clk`)
2. **Reset Initialization**
3. **Random Traffic Input Simulation** using `$random % 2`
4. **FSM Output Monitoring**
5. **Waveform Dump** for Verdi (`.fsdb`)
---

## 🧪 Simulation

The testbench:
- Generates a **clock**
- Applies **reset and random traffic inputs**
- Monitors FSM transitions and outputs
- Dumps waveform to `.fsdb` for **Verdi visualization**

### 🖥 To simulate (using Synopsys VCS):
vcs -sverilog traffic_sys.v tb_traffic_sys.v -debug_all
./simv
verdi -sv traffic_sys.v tb_traffic_sys.v -ssf traffic_sys.fsdb &


---

