# Reinforcement Learning and Neural-Fuzzy-based Self-Tuned PID Controller for Autonomous Underwater Vehicle (AUV) - MATLAB

This repository showcases a hybrid control system combining **Reinforcement Learning (Q-Learning)** and **Neural-Fuzzy Systems** to dynamically tune a PID controller for an Autonomous Underwater Vehicle (AUV). The implementation aims to enhance precision, adaptability, and robustness in underwater environments.

---

## Overview

Autonomous Underwater Vehicles (AUVs) face complex challenges due to the dynamic and uncertain nature of underwater environments. This project integrates:
- **Q-Learning**: For adaptive, model-free reinforcement learning.
- **Neural-Fuzzy Logic**: For addressing non-linear dynamics and uncertainties in real-time.

The system effectively tunes the PID controller parameters dynamically to improve performance, ensuring stability and energy efficiency in various underwater operations.

---

## Features

- **Dynamic PID Tuning**: Ensures optimal performance in real-time.
- **Hybrid Control Architecture**: Combines classical PID with modern AI-based approaches.
- **MATLAB Implementation**: Detailed simulations and visualization tools.
- **Adaptability**: Applicable to other robotic systems like drones and industrial manipulators.

---

## System Architecture

1. **AUV Dynamics Simulation**:
   - A 6-DOF model including forces like drag, buoyancy, and thrust.

2. **Reinforcement Learning (Q-Learning)**:
   - A state-action-reward mechanism for optimal control action selection.

3. **Neural-Fuzzy System**:
   - Fuzzy rules combined with neural networks for adaptive control adjustments.

4. **PID Controller**:
   - A classical controller enhanced by dynamic parameter tuning.

---

## Repository Contents

- `AUV_Dynamics`: MATLAB script for simulating AUV behavior.
- `Q_Learning_Controller`: Implementation of Q-Learning for self-tuning the PID controller.
- `Neural_Fuzzy_Tuner`: Adaptive control using Neural-Fuzzy logic.
- `Results_and_Visualization: Tools for analyzing and visualizing system performance.
- `README.md`: Documentation for the project.

---

## Prerequisites

- MATLAB R2021b or later.
- Required Toolboxes:
  - Control System Toolbox.
  - Fuzzy Logic Toolbox.

---

## Getting Started

### Clone the Repository
```bash
git clone https://github.com/AlinaBaber/ReinforcementLearning-QLearning-based-self-tuned-PID-controller-for-AUV-MatLab.git
cd ReinforcementLearning-QLearning-based-self-tuned-PID-controller-for-AUV-MatLab
```
Add to MATLAB Path
### Customize Parameters
Modify values in the script files to adjust simulation settings.

### Results
The system demonstrates:

- Improved navigation accuracy.
- Enhanced stability under disturbances.
- Reduced energy consumption.
- Example Visualization

### Applications
- Underwater Robotics: Autonomous navigation for AUVs.
- Drones: Control and stabilization for UAVs.
- Industrial Robotics: Adaptive control for manipulators.
- Future Enhancements
- Real-world hardware integration for AUV testing.
- Extending to multi-agent systems.
- Adapting the framework for surface and aerial robotics.
### License
This project is licensed under the MIT License. See the LICENSE file for more details.

### Contact
For queries or collaboration, reach out to:

#### Alina Baber

- 📧 Email: alinababer46@gmail.com
- 🌐 LinkedIn: Alina Baber
Let’s innovate underwater control systems together! 🌊🚀

vbnet
This `README.md` file is structured to be informative and user-friendly while meeting GitHub 
