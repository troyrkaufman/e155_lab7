// Troy Kaufman
// tkaufman@g.hmc.edu
// 10/27/24
// This testbench verifies the key_expansion module

module controller_tb();
    logic clk, rst;
    logic input_data_mux, mix_columns_flag, buffer_en, start_flag, cyphertext_en;
    logic [127:0] current_key, prev_key;

    controller dut(clk, rst, current_key, input_data_mux, mix_columns_flag, buffer_en, prev_key, start_flag, cyphertext_en);

    always begin
        clk = 1; #5; clk = 0; #5;
    end

    initial begin
	rst = 1; #10; rst = 0; //rst represents when load = '1'
        //round = 0; 
        current_key = 128'h2b7e151628aed2a6abf7158809cf4f3c; #5;
        
        //round = 1;
	current_key = 128'h2b7e151628aed2a6abf7158809cf4f3c; #5;
        //prev_key = 128'ha0fafe1788542cb123a339392a6c7605; #850;

        //round = 2;
	current_key = 128'ha0fafe1788542cb123a339392a6c7605; #5;

	//round = 3;
	current_key = 128'hf2c295f27a96b9435935807a7359f67f; #5;

	//round = 4;
	current_key = 128'h3d80477d4716fe3e1e2373446d7a883b; #5;

	//round = 5;
	current_key = 128'hef44a541a8525b7fb671253bdb0bad00; #5;

	//round = 6;
	current_key = 128'hd4d1c6f87c839d87caf2b8bc11f915bc; #5;

	//round = 7;
	current_key = 128'h6d88a37a110b3efddbf98641ca0093fd; #5;

	//round = 8;
	current_key = 128'h4e54f70e5f5fc9f384a64fb24ea6dc4f; #5;

	//round = 9;
	current_key = 128'head27321b58dbad2312bf5607f8d292f; #5;

	//round = 10;
	current_key = 128'hac7766f319fadc2128d12941575c006e; #5;

	current_key = 128'hd014f9a8c9ee2589e13f0cc8b6630ca6; 

    end
endmodule