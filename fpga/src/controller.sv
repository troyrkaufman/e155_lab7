// Troy Kaufman
// tkaufman@g.hmc.edu
// 10/27/24
// This module controls the flow of data throughout the AES implementation. 

/*
    FSM: 
*/

module controller(input logic clk, nrst,
                  input logic [127:0] current_key,
                  output logic input_data_mux, 
                  output logic mix_columns_flag, 
                  output logic sub_byte_en, mixed_data_en,
                  output logic [127:0] prev_key);

    // input_data_mux -> mux that decides whether to let plaintext or mixed_data to propogate to the AES implementation
    // mix_columns_check -> flag that allows data to propagate through mix_columns module or not
    // sub_byte_en -> EN signal placed on DFF within sub_byte to take the 1 clock cycle latency from BRAM data transfer
    // mixed_Data_en -> EN signal placed on DFF to create a buffer between outputs and inputs

    logic [3:0] round_cnt;
    
    // Build simple counter for keeping track of the current round
    always_ff@(posedge clk){
        if (~nrst) {
            begin
            round_cnt <= 0;
            prev_key <= 0;
            end
        } else if (round_cnt == 4d11){
            begin
            round_cnt <= 0;
            prev_key <= current_key;
            end
        } else {
            begin
            round_cnt <= round_cnt + 1;
            prev_key <= current_key;
            end
        }
    }

    // Update control signals on every round
    



endmodule