# ANN Accelerator with Systolic Array Architecture Using FPGA KV260

This project implements an **Artificial Neural Network (ANN) accelerator** utilizing a **6x6 systolic array architecture** on the **FPGA KV260** platform. The design aims to accelerate ANN computations using parallel processing elements (PEs) and register modules in the systolic array for enhanced performance.

## Features
- **6x6 systolic array architecture** designed for high parallelism in neural network operations.
- **Verilog** design for hardware description and **Vivado** for synthesis, implementation, and deployment on FPGA.
- Integration of the systolic array into a **System-on-Chip (SoC)** for improved communication between components.
- **FPGA KV260** used as the deployment platform, optimized for real-time ANN acceleration.

## Problem Encountered
During the development process, an issue with **data synchronization** between the **Processing Elements (PEs)** arose. The system initially produced incorrect results due to **clocking signal mismatch**, which led to improper timing of data transfers between PEs and registers.

## Troubleshooting & Solution
To resolve the synchronization problem:
1. **Clocking Signals Analysis:** The clock signals were carefully analyzed to identify the mismatch causing timing issues.
2. **Timing Constraints:** Applied timing constraints in Vivado to properly synchronize the clock signals between the PEs and registers.
3. **Data Routing Optimization:** Optimized the routing of data between PEs and registers to reduce transfer delays and improve throughput.

After implementing these changes, the system showed improved synchronization, and the output became consistent with the expected results.

## Results
With the optimizations applied, the FPGA demonstrated significantly **faster execution times** as the number of iterations increased. This confirmed the effectiveness of the systolic array architecture in accelerating ANN computations, offering substantial performance gains for machine learning tasks.


