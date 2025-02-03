#!/bin/bash
echo "C_DATA_WIDTH_GEN := 4"
sed -i 's/constant C_DATA_WIDTH_GEN : Integer := 10;/constant C_DATA_WIDTH_GEN : Integer := 4;/' ./Constant_Package.vhdl

ghdl -a Constant_Package.vhdl
ghdl -a my_gen_or.vhdl
ghdl -a my_gen_and.vhdl
ghdl -a my_gen_xor.vhdl
ghdl -a my_gates_tb.vhdl
ghdl -e my_gates_tb
ghdl -r my_gates_tb --vcd=my_gen_or.vcd
gtkwave my_gen_or.vcd

echo "C_DATA_WIDTH_GEN := 8"
sed -i 's/constant C_DATA_WIDTH_GEN : Integer := 4;/constant C_DATA_WIDTH_GEN : Integer := 8;/' ./Constant_Package.vhdl

ghdl -a Constant_Package.vhdl
ghdl -a my_gen_or.vhdl
ghdl -a my_gen_and.vhdl
ghdl -a my_gen_xor.vhdl
ghdl -a my_gates_tb.vhdl
ghdl -e my_gates_tb
ghdl -r my_gates_tb --vcd=my_gen_or.vcd
gtkwave my_gen_or.vcd

echo "C_DATA_WIDTH_GEN := 10"
sed -i 's/constant C_DATA_WIDTH_GEN : Integer := 8;/constant C_DATA_WIDTH_GEN : Integer := 10;/' ./Constant_Package.vhdl

ghdl -a Constant_Package.vhdl
ghdl -a my_gen_or.vhdl
ghdl -a my_gen_and.vhdl
ghdl -a my_gen_xor.vhdl
ghdl -a my_gates_tb.vhdl
ghdl -e my_gates_tb
ghdl -r my_gates_tb --vcd=my_gen_or.vcd
gtkwave my_gen_or.vcd
