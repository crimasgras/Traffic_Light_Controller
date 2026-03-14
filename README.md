## FPGA Smart Traffic Light Controller

VHDL implementation of a smart traffic light controller on Basys3 FPGA,
using a Finite State Machine with sensor-based adaptive signal timing
and pedestrian crossing support.

## Technologies
VHDL, Basys3 FPGA, Vivado

## Project Structure
- `TrafficLightController.vhd` — top-level module
- `FSM.vhd` — Finite State Machine logic
- `DivizorFrecventa.vhd` — clock frequency divider
- `Basys3.xdc` — pin constraints for Basys3 board

## State Diagram
![FSM Transition Diagram](Diagram.png)

## Features
- Sensor-based adaptive signal timing
- Pedestrian crossing support
- Automatic priority switching between Street A and Street B
