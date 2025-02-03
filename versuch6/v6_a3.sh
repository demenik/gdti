#!/bin/bash
ghdl -a my_rs_latch.vhdl
ghdl -a my_gated_d_latch.vhdl
ghdl -a my_d_ff.vhdl
ghdl -a my_d_ff_tb.vhdl
ghdl -e my_d_ff_tb
ghdl -r my_d_ff_tb --vcd=my_d_ff.vcd
gtkwave my_d_ff.vcd
