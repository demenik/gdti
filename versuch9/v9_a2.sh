#!/bin/bash
ghdl -a my_rail_crossing.vhdl
ghdl -a my_rail_crossing_tb_dataflow_full.vhdl
ghdl -e my_rail_crossing_tb_dataflow_full
ghdl -r my_rail_crossing_tb_dataflow_full --vcd=my_rail_crossing.vcd
