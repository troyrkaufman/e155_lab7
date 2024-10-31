// Troy Kaufman
// tkaufman@g.hmc.edu
// 10/27/24
// This module creates a key every round 
module key_expansion(input logic clk,
                     input logic [3:0] round,          // round reset will be handled in controller module
                     input logic [127:0] key,          // Will need to be updated by 
                     input logic [127:0] prev_key,     // stored in controller module
                     output logic [127:0] round_key);

    logic [31:0] rot_word0, rot_word1, rot_word2, rot_word3;                            // words after rotation
    logic [31:0] cur_word0, cur_word1, cur_word2, cur_word3;    // current words for state that is being produced
    logic [31:0] rcon;                                          // round constant
    logic [127:0] changed_key;                                  // key after rot_word and sub_byte manipulation
    logic [31:0] prev_word0, prev_word1, prev_word2, prev_word3;// keeps track of previous key's word values

    // Perform RotWord on four bytes at a time
    rot_word r0(prev_key[127:120], prev_key[119:112], prev_key[111:104], prev_key[103:96], rot_word0);
    rot_word r1(prev_key[95:88], prev_key[87:80], prev_key[79:72], prev_key[71:64], rot_word1);
    rot_word r2(prev_key[63:56], prev_key[55:48], prev_key[47:40], prev_key[39:32], rot_word2);
    rot_word r3(prev_key[31:24], prev_key[23:16], prev_key[15:8], prev_key[7:0], rot_word3);

    // Perform SubWord on the 4 words
    sub_bytes s0(clk, {rot_word0, rot_word1, rot_word2, rot_word3}, changed_key);

    // Find previous word relationships
    assign prev_word0 =  changed_key[127:96];  
    assign prev_word1 =  changed_key[95:64];
    assign prev_word2 =  changed_key[63:31];
    assign prev_word3 =  changed_key[31:0];

    // Calculate round constant
    always_comb
        begin
            if (round <= 4'd9)
                rcon = (32'h01000000 << round - 2);
              else if (round == 4'd10) 
                rcon = 32'h1b000000;
              else if (round == 4'd11)
                rcon = 32'h36000000;
        end
    
    always_comb 
        begin 
            // The first 4 words of the expanded key are the key itself
            if (round == 4'd1) 
                round_key = key;
             else if (round == 4'd2) begin
		cur_word0 = prev_word3 ^ prev_key[127:96] ^ rcon;
                cur_word1 = cur_word0 ^ prev_key[95:64];
                cur_word2 = cur_word1 ^ prev_key[63:32];
                cur_word3 = cur_word2 ^ prev_key[31:0];
                round_key = {cur_word0, cur_word1, cur_word2, cur_word3};
		end
             else if (round == 4'd3) begin
                cur_word0 = prev_word3 ^ prev_key[127:96] ^ rcon;
                cur_word1 = cur_word0 ^ prev_key[95:64];
                cur_word2 = cur_word1 ^ prev_key[63:32];
                cur_word3 = cur_word2 ^ prev_key[31:0];
                round_key = {cur_word0, cur_word1, cur_word2, cur_word3};
		end
             else if (round == 4'd4) begin
                cur_word0 = prev_word3 ^ prev_key[127:96] ^ rcon;
                cur_word1 = cur_word0 ^ prev_key[95:64];
                cur_word2 = cur_word1 ^ prev_key[63:32];
                cur_word3 = cur_word2 ^ prev_key[31:0];
                round_key = {cur_word0, cur_word1, cur_word2, cur_word3};
		end
             else if (round == 4'd5) begin
                cur_word0 = prev_word3 ^ prev_key[127:96] ^ rcon;
                cur_word1 = cur_word0 ^ prev_key[95:64];
                cur_word2 = cur_word1 ^ prev_key[63:32];
                cur_word3 = cur_word2 ^ prev_key[31:0];
                round_key = {cur_word0, cur_word1, cur_word2, cur_word3};
		end
             else if (round == 4'd6) begin
                cur_word0 = prev_word3 ^ prev_key[127:96] ^ rcon;
                cur_word1 = cur_word0 ^ prev_key[95:64];
                cur_word2 = cur_word1 ^ prev_key[63:32];
                cur_word3 = cur_word2 ^ prev_key[31:0];
                round_key = {cur_word0, cur_word1, cur_word2, cur_word3};
		end
             else if (round == 4'd7) begin
                cur_word0 = prev_word3 ^ prev_key[127:96] ^ rcon;
                cur_word1 = cur_word0 ^ prev_key[95:64];
                cur_word2 = cur_word1 ^ prev_key[63:32];
                cur_word3 = cur_word2 ^ prev_key[31:0];
                round_key = {cur_word0, cur_word1, cur_word2, cur_word3};
		end
             else if (round == 4'd8) begin
                cur_word0 = prev_word3 ^ prev_key[127:96] ^ rcon;
                cur_word1 = cur_word0 ^ prev_key[95:64];
                cur_word2 = cur_word1 ^ prev_key[63:32];
                cur_word3 = cur_word2 ^ prev_key[31:0];
                round_key = {cur_word0, cur_word1, cur_word2, cur_word3};
		end
             else if (round == 4'd9) begin
                cur_word0 = prev_word3 ^ prev_key[127:96] ^ rcon;
                cur_word1 = cur_word0 ^ prev_key[95:64];
                cur_word2 = cur_word1 ^ prev_key[63:32];
                cur_word3 = cur_word2 ^ prev_key[31:0];
                round_key = {cur_word0, cur_word1, cur_word2, cur_word3};
		end
             else if (round == 4'd10) begin
                cur_word0 = prev_word3 ^ prev_key[127:96] ^ rcon;
                cur_word1 = cur_word0 ^ prev_key[95:64];
                cur_word2 = cur_word1 ^ prev_key[63:32];
                cur_word3 = cur_word2 ^ prev_key[31:0];
                round_key = {cur_word0, cur_word1, cur_word2, cur_word3};
		end
             else if (round == 4'd11) begin
                cur_word0 = prev_word3 ^ prev_key[127:96] ^ rcon;
                cur_word1 = cur_word0 ^ prev_key[95:64];
                cur_word2 = cur_word1 ^ prev_key[63:32];
                cur_word3 = cur_word2 ^ prev_key[31:0];
                round_key = {cur_word0, cur_word1, cur_word2, cur_word3};
		end
             else begin
                cur_word0 = 0;
		cur_word1 = 0;
		cur_word2 = 0;
		cur_word3 = 0;
		round_key = {cur_word0, cur_word1, cur_word2, cur_word3};
		end
            
        end
endmodule 
    
