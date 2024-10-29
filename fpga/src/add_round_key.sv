// Troy Kaufman
// tkaufman@g.hmc.edu
// 10/27/24
// This module adds the current state with a round key produced by key_expansion's key schedule

module add_round_key(input logic [127:0] state, key, round_key,
                    input logic start_flag,
                     output logic [127:0] new_state);

    always_comb
        if (start_flag)
            new_state = state ^ key;
        else 
            new_state = state ^ round_key;
endmodule

