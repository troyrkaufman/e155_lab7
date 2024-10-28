// Troy Kaufman
// tkaufman@g.hmc.edu
// 10/27/24
// This module controls the flow of data throughout the AES implementation. 

/*
    FSM: 
*/

module controller(input logic clk, nrst, DO WE NEED A RESET? TB DOESN'T HAVE ONE
                  input logic [127:0] current_key,   // received from key_expansion
                  output logic input_data_mux,       // selects whether new input data is selected or previous ciphertext
                  output logic mix_columns_flag,     // Flag that will allow data to have their columns mixed or not base on conditional
                  output logic mixed_data_en,        // Will enable this flip flop to account for latency after every round...Extra: sub_byte_en,
                  output logic [127:0] prev_key);

    typdef logic enum [3:0] {start = 0d0, round1 = 0d1, round2 = 0d2, round3 = 0d3, round4 = 0d4, round5 = 0d5, round6 = 0d6, round7 = 0d7, round8 = 0d8, round9 = 0d9, finish = 0d10}statetype;
    statetype next_state, current_state;

    // input_data_mux -> mux that decides whether to let plaintext or mixed_data to propogate to the AES implementation
    // mix_columns_check -> flag that allows data to propagate through mix_columns module or not
    // sub_byte_en -> EN signal placed on DFF within sub_byte to take the 1 clock cycle latency from BRAM data transfer
    // mixed_Data_en -> EN signal placed on DFF to create a buffer between outputs and inputs

    logic [3:0] round_cnt;  // keeps track of the number of rounds; round = 0 -> start; round = 10 -> finish;
    logic [3:0] buffer_cnt; // enable signal that is set only after a certain number of clock cycles. this accounts for the clock cycles eaten up by sbox instantiations
    
    // Build simple counter for keeping track of the current round
    always_ff@(posedge clk){
        if (~nrst) {
            begin
            round_cnt <= 0;
            prev_key <= 0;
            buffer_cnt <= 0;
            end
        } else if (round_cnt == 4d10){
            begin
            round_cnt <= 0;
            prev_key <= 0;
            buffer_cnt <= 0;
            end
        } else {
            begin
            prev_key <= current_key;
            buffer_cnt <= buffer_cnt + 1;
            if (buffer_cnt == 4) begin
                round_cnt <= round_cnt + 1;
                buffer_cnt <= 0;
            end
            
            end
        }
    }

    // Update control signals on every round
    



endmodule