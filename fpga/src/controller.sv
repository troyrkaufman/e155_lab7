// Troy Kaufman
// tkaufman@g.hmc.edu
// 10/27/24
// This module controls the flow of data throughout the AES implementation. 

module controller(input logic clk, rst,
                  input logic [127:0] current_key,   // received from key_expansion
                  output logic input_data_mux,       // selects whether new input data is selected or previous ciphertext
                  output logic mix_columns_flag,     // Flag that will allow data to have their columns mixed or not base on conditional
                  output logic buffer_en,        // Will enable this flip flop to account for latency after every round...Extra: sub_byte_en,
                  output logic [127:0] prev_key, 
                  output logic start_flag,
                  output logic cyphertext_en,
                  output logic [3:0] round_count,
		  output logic control_done, cypher_flag);       // enable signal to let ciphertext propogate through final DFF

    typedef enum logic [3:0] {start = 4'd0, round1 = 4'd1, round2 = 4'd2, round3 = 4'd3, round4 = 4'd4, round5 = 4'd5, round6 = 4'd6, round7 = 4'd7, round8 = 4'd8, round9 = 4'd9, finish = 4'd10}statetype;
    statetype next_state, current_state;

    // input_data_mux -> mux that decides whether to let plaintext or mixed_data to propogate to the AES implementation
    // mix_columns_flag -> flag that allows data to propagate through mix_columns module or not
    // sub_byte_en -> EN signal placed on DFF within sub_byte to take the 1 clock cycle latency from BRAM data transfer
    // mixed_Data_en -> EN signal placed on DFF to create a buffer between outputs and inputs

    logic [3:0] round_cnt;  // keeps track of the number of rounds; round = 0 -> start; round = 10 -> finish;
    logic [3:0] buffer_cnt; // enable signal that is set only after a certain number of clock cycles. this accounts for the clock cycles eaten up by sbox instantiations
    logic [7:0] cypher_cnt;
	logic [7:0] counter;

    always_ff@(posedge clk)
        if (rst) begin
            buffer_cnt <= 4'b0;
            cypher_cnt <= 5'b0;
            round_cnt <= 4'b0;
            counter <= 6'b0;
            cypher_flag <= 0;
		end
        else begin
            buffer_cnt <= buffer_cnt + 1;
            cypher_cnt <= cypher_cnt + 1;
            if (buffer_cnt == 'd1) begin 
                prev_key <= current_key;
                buffer_cnt <= 1'b0;
                current_state <= next_state;
                round_cnt <= round_cnt + 1;
            end
            if (cypher_cnt >= 'd23)
		        counter <= counter + 1;
	        if (cypher_cnt == 'd22)
		        cypher_flag <= 1;
	        else 
		        cypher_flag <= 0;

        end
        
    

    always_comb
        case(current_state)
            start: begin 
                 next_state = round1;
                end
            round1:begin 
                next_state = round2;
                end
            round2: begin 
                next_state = round3;
                end
            round3: begin 
                next_state = round4;
                end
            round4: begin 
                next_state = round5;
                end
            round5: begin 
                next_state = round6;
                end
            round6: begin 
                next_state = round7;
                end
            round7: begin 
                next_state = round8;
                end
            round8: begin 
                next_state = round9;
                end
            round9: begin 
                next_state = finish;
                end
            finish: begin 
                next_state = finish; //delay;
                end
            default: next_state = start;
        endcase

        // Output logic
        always_comb
            begin
                if (current_state == start)begin 
                    input_data_mux = 1'b0;       // let altered plaintext through
                    mix_columns_flag = 1'b0;     // allow mix_columns to manipulate data
                    buffer_en = (buffer_cnt == 'd1) ?  1'b1 : 1'b0;
                    start_flag = 1'b1;
                    cyphertext_en = 0; 
                    round_count = round_cnt;
                end

                else if (current_state == round1 | current_state == round2 | current_state == round3 | current_state == round4 | current_state == round5 | current_state == round6 | current_state == round7 | current_state == round8 | current_state == round9) begin
                    input_data_mux = 1'b1;       // ...let unfinished_cyphertext through
                    mix_columns_flag = 1'b0;     // allow mix_columns to manipulate data
                    buffer_en = (buffer_cnt == 'd1) ?  1'b1 : 1'b0;
                    start_flag = 1'b0;
                    cyphertext_en = 1'b0; 
                    round_count = round_cnt;
                end
                else if (current_state == finish) begin
                    input_data_mux = 1'b1;       // let cyphertext through
                    mix_columns_flag = 1'b1;     // don't allow mix_columns to manipulate data

			        buffer_en = 0;

                    start_flag = 1'b0;
                    cyphertext_en = (cypher_cnt == 'd23) ? 1'b1 : 1'b0;
		    
                    round_count = round_cnt; 
			
                end
		        if (counter >= 'd2) control_done = 1; else control_done = 0;
                end
        

endmodule



