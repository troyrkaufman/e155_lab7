// Troy Kaufman
// tkaufman@g.hmc.edu
// 10/16/24
// This module creates a key every round 

module shift_rows(input logic [127:0] state,
                  output logic [127:0] new_state);

    // The 0th row remains unchanged
    assign new_state[127:120] =  state[127:120] ;
    assign new_state[95:88] = state[95:88];
    assign new_state[63:56] = state[63:56];
    assign new_state[31:24] = state[31:24];

    // The 1st row will be shifted to the left once
    assign new_state[119:112] = state[87:80];
    assign new_state[87:80] = state[55:48];
    assign new_state[55:48] = state[23:16];
    assign new_state[23:16] = state[119:112];

    // The 2nd row will be shifted to the left twice
    assign new_state[111:104] = state[47:40];
    assign new_state[79:72] = state[15:8];
    assign new_state[47:40] = state[111:104];
    assign new_state[15:8] = state[79:72];

    // The 3rd row will be shifted to the left three times
    assign new_state[103:96] = state[7:0];
    assign new_state[71:64] = state[103:96];
    assign new_state[39:32] = state[71:64];
    assign new_state[7:0] = state[39:32];

endmodule