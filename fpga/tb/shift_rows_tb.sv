// Troy Kaufman
// tkaufman@g.hmc.edu
// 10/27/24
// Testbench for shift_rows module

`timescale 1ns/1ns

module shift_rows_tb();
	logic [127:0] state, new_state;

	shift_rows dut(state, new_state);

	initial begin
		state = 128'h3243f6a8885a308d313198a2e0370734; 
		//state = 32'h1;
	end

endmodule
