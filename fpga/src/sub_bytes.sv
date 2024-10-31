// Troy Kaufman
// tkaufman@g.hmc.edu
// 10/16/24
// This module updates the state with every bytes' corresponding sbox value

module sub_bytes(input logic clk, //en,
		         input logic [127:0] state,
                 output logic [127:0] new_state);

    logic [7:0] y0, y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15;

    // Substitution for 0th row of bytes
    sbox_sync sbox0(state[127:120], clk,  y0);
    sbox_sync sbox1(state[119:112], clk,  y1);
    sbox_sync sbox2(state[111:104], clk,  y2);
    sbox_sync sbox3(state[103:96], clk,  y3);
    // Substitution for 1st row of bytes
    sbox_sync sbox4(state[95:88], clk,  y4);
    sbox_sync sbox5(state[87:80], clk,  y5);
    sbox_sync sbox6(state[79:72], clk,  y6);
    sbox_sync sbox7(state[71:64], clk,  y7);
    // Substitution for 2nd row of bytes
    sbox_sync sbox8(state[63:56], clk,  y8);
    sbox_sync sbox9(state[55:48], clk,  y9);
    sbox_sync sbox10(state[47:40], clk,  y10);
    sbox_sync sbox11(state[39:32], clk,  y11);
    // Substitution for 3rd row of bytes
    sbox_sync sbox12(state[31:24], clk,  y12);
    sbox_sync sbox13(state[23:16], clk,  y13);
    sbox_sync sbox14(state[15:8], clk,  y14);
    sbox_sync sbox15(state[7:0], clk,  y15);

    assign new_state = {y0, y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15};

endmodule 
