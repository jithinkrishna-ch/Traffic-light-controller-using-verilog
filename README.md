# Traffic-light-controller-using-verilog
A traffic light controller project using FSM implemented in Verilog HDL
# 🚦 Traffic Light Controller using FSM in Verilog HDL

This project implements a 4-way traffic light controller using a **Finite State Machine (FSM)**, written in Verilog HDL. The system is designed to handle four directions — **North, South, East, and West**, each with RED, GREEN, and YELLOW signals. The design is synthesized and simulated using Synopsys tools.

---

## 🧠 FSM Logic

The FSM operates in 8 states:
- **s0, s1**: North direction — Green → Yellow
- **s2, s3**: West direction — Green → Yellow
- **s4, s5**: South direction — Green → Yellow
- **s6, s7**: East direction — Green → Yellow

Each GREEN signal stays on for up to **15 cycles**, or until a **low-priority traffic input (`t1` to `t4`) is deasserted**. YELLOW stays for **3 cycles** to ensure smooth transition.

---

## 🔧 Tools Used

| Tool         | Purpose                         |
|--------------|----------------------------------|
| **VCS**      | RTL simulation                   |
| **Verdi**    | Waveform and FSM visualization   |
| **Design Compiler (DC)** | Logic synthesis      |
| **ICC2**     | Physical Design (FP, PP, PnR, CTS) |

---

---

## 🧪 Simulation

The testbench:
- Generates a **clock**
- Applies **reset and random traffic inputs**
- Monitors FSM transitions and outputs
- Dumps waveform to `.fsdb` for **Verdi visualization**

### 🖥 To simulate (using Synopsys VCS):
```bash
vcs -sverilog traffic_sys.v tb_traffic_sys.v -debug_all
./simv
dve -vpd vcdplus.vpd &

---

🔬 Synthesis & Physical Design Flow 
This RTL design was also:

Synthesized using Design Compiler

Floorplanned, Power Planned, Placed, Routed using ICC2

Clock Tree Synthesized (CTS) with timing closure
