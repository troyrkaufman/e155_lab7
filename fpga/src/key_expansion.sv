// Troy Kaufman
// tkaufman@g.hmc.edu
// 10/16/24
// This module creates a key every round 
module key_expansion(input logic [3:0] round,          // round reset will be handled in controller module
                     input logic [127:0] key,          // Will need to be updated by 
                     input logic [127:0] prev_key,     // stored in controller module
                     output logic [127:0] round_key);

    logic [31:0] rw0, rw1, rw2, rw3;                            // words after rotation
    logic [31:0] cur_word0, cur_word1, cur_word2, cur_word3;    // current words for state that is being produced
    logic [31:0] rcon;                                          // round constant
    logic [127:0] changed_key;                                  // key after rot_word and sub_byte manipulation
    logic [31:0] prev_word0, prev_word1, prev_word2, prev_word3; // keeps track of previous key's word values

    // Perform RotWord on four bytes at a time
    rot_word r0([127:120]prev_key, [119:112]prev_key, [111:104]prev_key, [103:96]prev_key, rw0);
    rot_word r0([95:88]prev_key, [87:80]prev_key, [79:72]prev_key, [71:64]prev_key, rw1);
    rot_word r0([63:56]prev_key, [55:48]prev_key, [47:40]prev_key, [39:32]prev_key, rw2);
    rot_word r0([31:24]prev_key, [23:16]prev_key, [15:8]prev_key, [7:0]prev_key, rw3);

    // Perform SubWord on four bytes at a time
    sub_bytes s0({rw0, rw1, rw2, rw3}, changed_key);

    // Find previous word relationships
    assign prev_word0 = [127:96] changed_key;  
    assign prev_word1 = [95:64] changed_key;
    assign prev_word2 = [63:31] changed_key;
    assign prev_word3 = [31:0] changed_key;

    // Calculate round constant
    always_comb
        begin
            if (round <= 4d8){
                rcon = (32'h01000000 << round);
            } else if (count == 4d9) {
                rcon = 32'h1b000000;
            } else if (count == 4d10){
                rcon = 32'h36000000;
            }
        end
    
    always_comb 
        begin 
            // The first 4 words of the expanded key are the key itself
            if (round == 4d0) {
                round_key = key;
            } else if (round == 4d1) {
                cur_word0 = prev_word ^ prev_word0 ^ rcon;
                cur_word1 = cur_word0 ^ prev_word1;
                cur_word2 = cur_word1 ^ prev_word2;
                cur_word3 = cur_word2 ^ prev_word3;
                round_key = {cur_word0, cur_word1, cur_word2, cur_word3};
            } else if (round == 4d2) {
                cur_word0 = prev_word ^ prev_word0 ^ rcon;
                cur_word1 = cur_word0 ^ prev_word1;
                cur_word2 = cur_word1 ^ prev_word2;
                cur_word3 = cur_word2 ^ prev_word3;
                round_key = {cur_word0, cur_word1, cur_word2, cur_word3};
            } else if (round == 4d3) {
                cur_word0 = prev_word ^ prev_word0 ^ rcon;
                cur_word1 = cur_word0 ^ prev_word1;
                cur_word2 = cur_word1 ^ prev_word2;
                cur_word3 = cur_word2 ^ prev_word3;
                round_key = {cur_word0, cur_word1, cur_word2, cur_word3};
            } else if (round == 4d4) {
                cur_word0 = prev_word ^ prev_word0 ^ rcon;
                cur_word1 = cur_word0 ^ prev_word1;
                cur_word2 = cur_word1 ^ prev_word2;
                cur_word3 = cur_word2 ^ prev_word3;
                round_key = {cur_word0, cur_word1, cur_word2, cur_word3};
            } else if (round == 4d5) {
                cur_word0 = prev_word ^ prev_word0 ^ rcon;
                cur_word1 = cur_word0 ^ prev_word1;
                cur_word2 = cur_word1 ^ prev_word2;
                cur_word3 = cur_word2 ^ prev_word3;
                round_key = {cur_word0, cur_word1, cur_word2, cur_word3};
            } else if (round == 4d6) {
                cur_word0 = prev_word ^ prev_word0 ^ rcon;
                cur_word1 = cur_word0 ^ prev_word1;
                cur_word2 = cur_word1 ^ prev_word2;
                cur_word3 = cur_word2 ^ prev_word3;
                round_key = {cur_word0, cur_word1, cur_word2, cur_word3};
            } else if (round == 4d7) {
                cur_word0 = prev_word ^ prev_word0 ^ rcon;
                cur_word1 = cur_word0 ^ prev_word1;
                cur_word2 = cur_word1 ^ prev_word2;
                cur_word3 = cur_word2 ^ prev_word3;
                round_key = {cur_word0, cur_word1, cur_word2, cur_word3};
            } else if (round == 4d8) {
                cur_word0 = prev_word ^ prev_word0 ^ rcon;
                cur_word1 = cur_word0 ^ prev_word1;
                cur_word2 = cur_word1 ^ prev_word2;
                cur_word3 = cur_word2 ^ prev_word3;
                round_key = {cur_word0, cur_word1, cur_word2, cur_word3};
            } else if (round == 4d9) {
                cur_word0 = prev_word ^ prev_word0 ^ rcon;
                cur_word1 = cur_word0 ^ prev_word1;
                cur_word2 = cur_word1 ^ prev_word2;
                cur_word3 = cur_word2 ^ prev_word3;
                round_key = {cur_word0, cur_word1, cur_word2, cur_word3};
            } else if (round == 4d10) {
                cur_word0 = prev_word ^ prev_word0 ^ rcon;
                cur_word1 = cur_word0 ^ prev_word1;
                cur_word2 = cur_word1 ^ prev_word2;
                cur_word3 = cur_word2 ^ prev_word3;
                round_key = {cur_word0, cur_word1, cur_word2, cur_word3};
            } else {
                return 0;
            }
        end
endmodule 
    
