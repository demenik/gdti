#!/bin/bash
ghdl -a my_rail_crossing.vhdl
ghdl -a my_rail_crossing_tb_behavior.vhdl
ghdl -e my_rail_crossing_tb_behavior
ghdl -r my_rail_crossing_tb_behavior --vcd=my_rail_crossing.vcd
