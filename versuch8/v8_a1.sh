#!/bin/bash

echo Teste 4 Bit...
sed -i '22s/.*/constant C_DATA_WIDTH_GEN : Integer := 4;/' Constant_Package.vhdl
ghdl -a Constant_Package.vhdl
ghdl -a my_shifter.vhdl
ghdl -a my_shifter_tb.vhdl
ghdl -e my_shifter_tb
ghdl -r my_shifter_tb --vcd=my_shifter.vcd

echo Teste 8 Bit...
sed -i '22s/.*/constant C_DATA_WIDTH_GEN : Integer := 8;/' Constant_Package.vhdl
ghdl -a Constant_Package.vhdl
ghdl -a my_shifter.vhdl
ghdl -a my_shifter_tb.vhdl
ghdl -e my_shifter_tb
ghdl -r my_shifter_tb --vcd=my_shifter.vcd
