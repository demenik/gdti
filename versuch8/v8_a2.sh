#!/bin/bash
ghdl -a --std=08 Constant_Package.vhdl
ghdl -a --std=08 my_shifter.vhdl
ghdl -a --std=08 my_gen_and.vhdl
ghdl -a --std=08 my_gen_or.vhdl
ghdl -a --std=08 my_gen_xor.vhdl
ghdl -a --std=08 my_half_adder.vhdl
ghdl -a --std=08 my_full_adder.vhdl
ghdl -a --std=08 my_gen_n_bit_full_adder.vhdl
ghdl -a --std=08 my_alu.vhdl
ghdl -a --std=08 my_alu_tb.vhdl
ghdl -e --std=08 my_alu_tb
ghdl -r --std=08 my_alu_tb --vcd=my_alu.vcd
gtkwave my_alu.vcd
