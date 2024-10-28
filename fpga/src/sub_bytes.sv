// Troy Kaufman
// tkaufman@g.hmc.edu
// 10/16/24
// This module updates the state with every bytes' corresponding sbox value
// Make sure that a DFFE is present for this combinational logic

module sub_bytes(input logic [127:0] state,
                 output logic [127:0] new_state);

    logic [7:0] x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15;
    logic [7:0] y0, y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15;

    // 0th row of bytes
    assign x0 = 16 * state[127:124] + state[123:120] + 1;
    assign x1 = 16 * state[95:92] + state[91:88] + 1;
    assign x2 = 16 * state[63:60] + state[59:56] + 1;
    assign x3 = 16 * state[31:28] + state[27:24] + 1;

    // 1st row of bytes
    assign x4 = 16 * state[119:116] + state[115:112] + 1;
    assign x5 = 16 * state[87:84] + state[83:80] + 1;
    assign x6 = 16 * state[55:52] + state[51:48] + 1;
    assign x7 = 16 * state[23:20] + state[19:16] + 1;

    // 2nd row of bytes
    assign x8 = 16 * state[111:108] + state[107:104] + 1;
    assign x9 = 16 * state[79:76] + state[75:72] + 1;
    assign x10 = 16 * state[47:44] + state[43:40] + 1;
    assign x11 = 16 * state[15:12] + state[11:8] + 1;

    // 3rd row of bytes
    assign x12 = 16 * state[103:100] + state[99:96] + 1;
    assign x13 = 16 * state[71:68] + state[67:64] + 1;
    assign x14 = 16 * state[39:36] + state[35:32] + 1;
    assign x15 = 16 * state[7:4] + state[3:0] + 1;

    // Substitution for 0th row of bytes
    sbox_sync sbox0(x0, clk,  y0);
    sbox_sync sbox0(x1, clk,  y1);
    sbox_sync sbox0(x2, clk,  y2);
    sbox_sync sbox0(x3, clk,  y3);
    // Substitution for 1st row of bytes
    sbox_sync sbox0(x4, clk,  y4);
    sbox_sync sbox0(x5, clk,  y5);
    sbox_sync sbox0(x6, clk,  y6);
    sbox_sync sbox0(x7, clk,  y7);
    // Substitution for 2nd row of bytes
    sbox_sync sbox0(x8, clk,  y8);
    sbox_sync sbox0(x9, clk,  y9);
    sbox_sync sbox0(x10, clk,  y10);
    sbox_sync sbox0(x11, clk,  y11);
    // Substitution for 3rd row of bytes
    sbox_sync sbox0(x12, clk,  y12);
    sbox_sync sbox0(x13, clk,  y13);
    sbox_sync sbox0(x14, clk,  y14);
    sbox_sync sbox0(x15, clk,  y15);

    assign new_state = {y0, y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15};

endmodule 
