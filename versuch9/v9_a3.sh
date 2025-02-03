#!/bin/bash
ghdl -a my_rail_crossing.vhdl
ghdl -a my_rail_crossing_tb_dataflow_min.vhdl
ghdl -e my_rail_crossing_tb_dataflow_min
ghdl -r my_rail_crossing_tb_dataflow_min --vcd=my_rail_crossing.vcd
