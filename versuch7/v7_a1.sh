#!/bin/bash
ghdl -a my_half_adder.vhdl
ghdl -a my_half_adder_tb.vhdl
ghdl -e my_half_adder_tb
ghdl -r my_half_adder_tb --vcd=my_half_adder.vcd

ghdl -a my_full_adder.vhdl
ghdl -a my_full_adder_tb.vhdl
ghdl -e my_full_adder_tb
ghdl -r my_full_adder_tb --vcd=my_full_adder.vcd
gtkwave my_full_adder.vcd
