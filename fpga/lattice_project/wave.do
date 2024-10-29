onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /aes_core_tb/clk
add wave -noupdate /aes_core_tb/load
add wave -noupdate /aes_core_tb/done
add wave -noupdate -radix hexadecimal /aes_core_tb/key
add wave -noupdate -radix hexadecimal /aes_core_tb/plaintext
add wave -noupdate -radix hexadecimal /aes_core_tb/cyphertext
add wave -noupdate -radix hexadecimal /aes_core_tb/expected
add wave -noupdate -radix binary /aes_core_tb/dut/addRoundKey/start_flag
add wave -noupdate -radix hexadecimal /aes_core_tb/dut/addRoundKey/state
add wave -noupdate -radix hexadecimal /aes_core_tb/dut/addRoundKey/round_key
add wave -noupdate -radix hexadecimal /aes_core_tb/dut/addRoundKey/new_state
add wave -noupdate -radix binary /aes_core_tb/dut/subBytes/clk
add wave -noupdate -radix hexadecimal /aes_core_tb/dut/subBytes/state
add wave -noupdate -radix hexadecimal /aes_core_tb/dut/subBytes/new_state
add wave -noupdate -radix hexadecimal /aes_core_tb/dut/shiftRows/state
add wave -noupdate -radix hexadecimal /aes_core_tb/dut/shiftRows/new_state
add wave -noupdate -radix hexadecimal /aes_core_tb/dut/mixColumn/a
add wave -noupdate -radix hexadecimal /aes_core_tb/dut/mixColumn/y
add wave -noupdate -radix hexadecimal /aes_core_tb/dut/keyExpansion/rcon
add wave -noupdate -radix hexadecimal /aes_core_tb/dut/keyExpansion/prev_key
add wave -noupdate -color {Blue Violet} -radix hexadecimal /aes_core_tb/dut/keyExpansion/round_key
add wave -noupdate -radix binary /aes_core_tb/dut/con/clk
add wave -noupdate -radix binary /aes_core_tb/dut/con/rst
add wave -noupdate -radix hexadecimal /aes_core_tb/dut/con/current_key
add wave -noupdate /aes_core_tb/dut/con/input_data_mux
add wave -noupdate /aes_core_tb/dut/con/mix_columns_flag
add wave -noupdate -radix unsigned /aes_core_tb/dut/con/round_count
add wave -noupdate -color Orange /aes_core_tb/dut/con/current_state
add wave -noupdate /aes_core_tb/dut/con/next_state
add wave -noupdate -radix unsigned /aes_core_tb/dut/con/round_cnt
add wave -noupdate -radix decimal /aes_core_tb/dut/con/buffer_cnt
add wave -noupdate /aes_core_tb/dut/con/buffer_en
add wave -noupdate -radix unsigned /aes_core_tb/dut/con/cypher_cnt
add wave -noupdate /aes_core_tb/dut/con/cyphertext_en
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {680 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 260
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {509 ns} {1399 ns}
