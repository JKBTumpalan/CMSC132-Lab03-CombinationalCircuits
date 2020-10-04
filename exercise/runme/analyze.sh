#!/bin/bash

ghdl -a and_gate.vhdl
ghdl -a or_gate.vhdl
ghdl -a xor_gate.vhdl
ghdl -a not_gate.vhdl
ghdl -a fa.vhdl
ghdl -a fa_2bit.vhdl
ghdl -a mux_8to1.vhdl
ghdl -a alu_2bit.vhdl
ghdl -a alu_2bit_tb.vhd
ghdl -e alu_2bit_tb
ghdl -r alu_2bit_tb
