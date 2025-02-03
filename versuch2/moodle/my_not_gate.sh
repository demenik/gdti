#!/bin/bash
# Lab Date: 18.11.2024
# 1. Participant First and  Last Name: Dominik Bernroider
# 2. Participant First and Last Name: Christian Dreher

ghdl -a my_not_gate.vhdl
ghdl -a my_not_gate_tb.vhdl

ghdl -e my_not_gate_tb

ghdl -r my_not_gate_tb --vcd=my_not_gate.vcd

gtkwave my_not_gate.vcd
