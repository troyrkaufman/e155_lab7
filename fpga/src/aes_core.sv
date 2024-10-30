/////////////////////////////////////////////
// aes_core
//   top level AES encryption module
//   when load is asserted, takes the current key and plaintext
//   generates cyphertext and asserts done when complete 11 cycles later
// 
//   See FIPS-197 with Nk = 4, Nb = 4, Nr = 10
//
//   The key and message are 128-bit values packed into an array of 16 bytes as
//   shown below
//        [127:120] [95:88] [63:56] [31:24]     S0,0    S0,1    S0,2    S0,3
//        [119:112] [87:80] [55:48] [23:16]     S1,0    S1,1    S1,2    S1,3
//        [111:104] [79:72] [47:40] [15:8]      S2,0    S2,1    S2,2    S2,3
//        [103:96]  [71:64] [39:32] [7:0]       S3,0    S3,1    S3,2    S3,3
//
//   Equivalently, the values are packed into four words as given
//        [127:96]  [95:64] [63:32] [31:0]      w[0]    w[1]    w[2]    w[3]
/////////////////////////////////////////////

module aes_core(input  logic         clk, 
                input  logic         load,
                input  logic [127:0] key, 
                input  logic [127:0] plaintext, 
                output logic         done, 
                output logic [127:0] cyphertext);

    logic [127:0] input_data_ARK, new_state_ARK;
    logic [127:0] input_data_SB, new_state_SB;
    logic [127:0] input_data_SR, new_state_SR;
    logic [127:0] input_data_MC, new_state_MC;

    logic [127:0] round_key, prev_key;

    logic input_round_select, mix_columns_select, buffer_en, start_flag, cyphertext_en;

    logic [3:0] round_count; 

    logic [127:0] unfinished_cyphertext, cyphertext_output;

    // TODO: Your code goes here
    add_round_key addRoundKey(input_data_ARK, key, round_key, start_flag, new_state_ARK);

    sub_bytes subBytes(clk, input_data_SB, new_state_SB);

    shift_rows shiftRows(new_state_SB, new_state_SR);

    mixcolumns mixColumn(new_state_SR, new_state_MC);

    controller con(clk, load, round_key, input_round_select, mix_columns_select, buffer_en, prev_key, start_flag, cyphertext_en, round_count);

    key_expansion keyExpansion(clk, round_count, key, prev_key, round_key);
    
    // if statement for DFF buffer between output and input
    always_ff@(posedge clk)begin
        if (buffer_en)
            unfinished_cyphertext <= new_state_ARK;
        if (cyphertext_en)
            cyphertext <= new_state_ARK;
	end

    // mux for controlling plaintext or mixed_data input into add_round_key
    assign input_data_ARK = (start_flag == 1'b1) ? plaintext: (mix_columns_select == 1'b1) ? new_state_SR : new_state_MC;
    
    // mux for input to sub_byte
    assign input_data_SB = (input_round_select == 1'b1) ? unfinished_cyphertext : new_state_ARK;
endmodule
