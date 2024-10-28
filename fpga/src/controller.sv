// Troy Kaufman
// tkaufman@g.hmc.edu
// 10/27/24
// This module controls the flow of data throughout the AES implementation. 

module controller(input logic clk, nrst,
                  output logic input_data_mux, 
                  output logic mix_columns_flag, 
                  output logic sub_byte_en, mixed_data_en);

    // input_data_mux -> mux that decides whether to let plaintext or mixed_data to propogate to the AES implementation
    // mix_columns_check -> flag that allows data to propagate through mix_columns module or not
    // sub_byte_en -> EN signal placed on DFF within sub_byte to take the 1 clock cycle latency from BRAM data transfer
    // mixed_Data_en -> EN signal placed on DFF to create a buffer between outputs and inputs

    logic [3:0] round_cnt;
    
    // Build simple counter for keeping track of the current round
    always_ff@(posedge clk){
        if (~nrst) {
            round_cnt <= 0;
        } else if (round_cnt == 11){
            round_cnt <= 0;
        } else {
            round_cnt <= round_cnt + 1;
        }
    }

    // Update control signals on every round
    



endmodule