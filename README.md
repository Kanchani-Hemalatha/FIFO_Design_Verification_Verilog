# FIFO_Design_Verification_Verilog
This repository contains the Verilog implementation and testbench for an 8-bit FIFO.
# FIFO Design and Verification

## Overview

This project implements an **8-bit FIFO (First-In-First-Out) buffer** with a **parameterized depth of 16**.  
The design is written in **Verilog** and includes a **testbench for functional verification**.

---

## Features

✅ **Synchronous FIFO** with clocked operations  
✅ **Resettable state** to initialize FIFO contents  
✅ **Write and read enable** signals to control data flow  
✅ **Full and empty flags** to indicate buffer status  
✅ **Parameterized depth** for easy configurability  

---

## Module: `fifo`

### **Ports**

| Signal   | Direction | Width | Description                          |
|----------|----------|-------|--------------------------------------|
| `clk`    | Input    | 1-bit | Clock signal                        |
| `reset`  | Input    | 1-bit | Asynchronous reset signal           |
| `wr_en`  | Input    | 1-bit | Write enable signal                 |
| `rd_en`  | Input    | 1-bit | Read enable signal                  |
| `data_in`| Input    | 8-bit | 8-bit input data                    |
| `data_out` | Output | 8-bit | 8-bit output data                   |
| `full`   | Output   | 1-bit | FIFO full flag                      |
| `empty`  | Output   | 1-bit | FIFO empty flag                     |

---

## **Internal Signals**

| Signal   | Width  | Description                                  |
|----------|--------|----------------------------------------------|
| `mem`    | 8-bit  | Memory array storing FIFO data              |
| `wr_ptr` | 4-bit  | Write pointer tracking FIFO write position  |
| `rd_ptr` | 4-bit  | Read pointer tracking FIFO read position    |
| `count`  | 5-bit  | Counter tracking number of stored elements  |

---

## **Functionality**

🔹 **On reset**: All registers and memory are cleared.  
🔹 **On write enable (`wr_en`)**: Data is written to FIFO if it is not full.  
🔹 **On read enable (`rd_en`)**: Data is read from FIFO if it is not empty.  
🔹 **Full flag (`full`)**: Asserted when FIFO reaches maximum capacity.  
🔹 **Empty flag (`empty`)**: Asserted when FIFO is empty.  

## **EDA PLAYGROUND LINK**

https://www.edaplayground.com/x/vL2C

## **SIMULATION OUTPUT**
![image](https://github.com/user-attachments/assets/7831de32-54cc-467a-9941-e0b63f9e0f8b)

## **WAVEFORM**
![image](https://github.com/user-attachments/assets/09bb125b-e489-40ea-b006-b2267bcf4a89)


