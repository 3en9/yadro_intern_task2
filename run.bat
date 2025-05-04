iverilog -g2012 -o sim test_yadro.sv tb.sv
vvp sim
python main.py
gtkwave wave.vcd