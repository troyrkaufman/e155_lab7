// Troy Kaufman
// tkaufman@g.hmc.edu
// 10/27/24
// This testbench verifies the key_expansion module

module key_expansion_tb();
    logic clk;
    logic [3:0] round;
    logic [127:0] key, prev_key, round_key;

    key_expansion dut(clk, round, key, prev_key, round_key);

    always begin
        clk = 1; #5; clk = 0; #5;
    end

    initial begin
        round = 0; 
        key = 128'h2b7e151628aed2a6abf7158809cf4f3c; #850;
        
        round = 1;
	prev_key = 128'h2b7e151628aed2a6abf7158809cf4f3c; #850;
        //prev_key = 128'ha0fafe1788542cb123a339392a6c7605; #850;

        round = 2;
	prev_key = 128'ha0fafe1788542cb123a339392a6c7605; #850;

	round = 3;
	prev_key = 128'hf2c295f27a96b9435935807a7359f67f; #850;

	round = 4;
	prev_key = 128'h3d80477d4716fe3e1e2373446d7a883b; #850;

	round = 5;
	prev_key = 128'hef44a541a8525b7fb671253bdb0bad00; #850;

	round = 6;
	prev_key = 128'hd4d1c6f87c839d87caf2b8bc11f915bc; #850;

	round = 7;
	prev_key = 128'h6d88a37a110b3efddbf98641ca0093fd; #850;

	round = 8;
	prev_key = 128'h4e54f70e5f5fc9f384a64fb24ea6dc4f; #850;

	round = 9;
	prev_key = 128'head27321b58dbad2312bf5607f8d292f; #850;

	round = 10;
	prev_key = 128'hac7766f319fadc2128d12941575c006e; #850;

    end
endmodule