#!/bin/bash
ghdl -a my_rs_latch.vhdl
ghdl -a my_rs_latch_tb.vhdl
ghdl -e my_rs_latch_tb
ghdl -r my_rs_latch_tb --vcd=my_rs_latch.vcd
gtkwave my_rs_latch.vcd
