// Troy Kaufman
// tkaufman@g.hmc.edu
// 10/16/24
// This module creates a key every round 
module key_expansion(input logic [3:0] round, 
                     input logic [127:0] key,
                     input lgoic [127:0] prev_key, 
                     output logic [127:0] round_key);

    logic [7:0] starting_counter;

    // Perform RotWord on four bytes at a time

    // Perform SubWord on four bytes at a time

    // The first 4 words of the expanded key are the key itself
    always_comb 
        case (round)
            0d0: round_key = key;
            0d1: 


        endcase

    // Every subsequent word w[i] is generated recurively form the preceding word, w[i-1],
    // and the word 4 positions earlier, w[i-4]



endmodule 
    
