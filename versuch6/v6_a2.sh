#!/bin/bash
ghdl -a my_rs_latch.vhdl
ghdl -a my_gated_d_latch.vhdl
ghdl -a my_gated_d_latch_tb.vhdl
ghdl -e my_gated_d_latch_tb
ghdl -r my_gated_d_latch_tb --vcd=my_gated_d_latch.vcd
gtkwave my_gated_d_latch.vcd
