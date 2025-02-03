#!/bin/bash
ghdl -a my_and_gate.vhdl
ghdl -a my_and_gate_tb.vhdl
ghdl -e my_and_gate_tb
ghdl -r my_and_gate_tb --vcd=my_and_gate.vcd
gtkwave my_and_gate.vcd
