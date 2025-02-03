#!/bin/bash
ghdl -a dice_decoder.vhdl
ghdl -a dice_decoder_tb.vhdl
ghdl -e dice_decoder_tb
ghdl -r dice_decoder_tb --vcd=dice_decoder.vcd
gtkwave dice_decoder.vcd
