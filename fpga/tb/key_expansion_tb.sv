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
        prev_key = 128'ha0fafe1788542cb123a339392a6c7605; #850;

        round = 2;
        prev_key = 128'hf2c295f27a96b9435935807a7359f67f; #850;

    end
endmodule