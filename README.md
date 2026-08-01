# 🛰️ Satellite Collision Detection System

A digital hardware implementation of a **Satellite Collision Detection System** using **Verilog HDL**. The system continuously monitors the relative positions of two satellites and generates a collision alert whenever the calculated distance falls below a predefined threshold.

---

## 📖 Overview

Space missions require reliable collision detection to prevent satellites from entering unsafe proximity. This project demonstrates a hardware-based collision detection algorithm using Verilog HDL and digital logic concepts. The design compares positional values and produces an alert signal whenever a collision risk is detected.

---

## ✨ Features

- Threshold-based collision detection
- Digital hardware implementation
- Modular Verilog design
- Simulation using Xilinx ISE
- Testbench included
- Waveform verification

---

## 🛠 Technologies Used

- Verilog HDL
- Xilinx ISE
- Digital Logic Design

---

## 📂 Repository Structure

```text
satellite-collision-detection/
│
├── src/
├── testbench/
├── simulation/
├── docs/
├── README.md
├── LICENSE
└── .gitignore
```

---

## ⚙ Inputs

| Signal | Description |
|---------|-------------|
| sat1_x | Satellite 1 X coordinate |
| sat1_y | Satellite 1 Y coordinate |
| sat2_x | Satellite 2 X coordinate |
| sat2_y | Satellite 2 Y coordinate |
| threshold | Minimum safe distance |

---

## 📤 Outputs

| Signal | Description |
|---------|-------------|
| collision_alert | High when satellites are too close |

---

## 🧪 Simulation

### Collision Detection Waveform

![Waveform](simulation/waveform.png)

---

## 🚀 Future Improvements

- 3D position tracking
- Multi-satellite monitoring
- FPGA implementation
- Real orbital prediction
- AI-assisted collision prediction

---

## 👨‍💻 Author

**Kavin Shah**

Electronics & Communication Engineering Student
