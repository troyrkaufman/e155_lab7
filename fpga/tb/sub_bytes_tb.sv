// Troy Kaufman
// tkaufman@g.hmc.edu
// 10/27/24
// Testbench for shift_rows module

`timescale 1ns/1ns

module sub_bytes_tb();
	logic clk;
	logic [127:0] state, new_state;

	sub_bytes dut(clk, state, new_state);

	always begin
		clk = 1; #1; clk = 0; #1;
	end

	initial begin
		state = 128'h3243f6a8885a308d313198a2e0370734; 
	end

endmodule