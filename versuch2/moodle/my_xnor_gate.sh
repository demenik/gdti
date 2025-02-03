#!/bin/bash
# Lab Date: 18.11.2024
# 1. Participant First and  Last Name: Dominik Bernroider
# 2. Participant First and Last Name: Christian Dreher

ghdl -a my_xnor_gate.vhdl
ghdl -a my_xnor_gate_tb.vhdl

ghdl -e my_xnor_gate_tb

ghdl -r my_xnor_gate_tb --vcd=my_xnor_gate.vcd

gtkwave my_xnor_gate.vcd
