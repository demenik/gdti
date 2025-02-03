#!/bin/bash
ghdl -a my_half_adder.vhdl
ghdl -a my_full_adder.vhdl
ghdl -a Constant_Package.vhdl
ghdl -a my_gen_n_bit_full_adder.vhdl
ghdl -a my_gen_n_bit_full_adder_tb2.vhdl
ghdl -e my_gen_n_bit_full_adder_tb2
ghdl -r my_gen_n_bit_full_adder_tb2 --vcd=my_gen_n_bit_full_adder.vcd
gtkwave my_gen_n_bit_full_adder.vcd
