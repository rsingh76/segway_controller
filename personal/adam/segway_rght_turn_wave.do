onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Segway_tb/clk
add wave -noupdate /Segway_tb/RST_n
add wave -noupdate -radix hexadecimal /Segway_tb/iPHYS/torque_lft
add wave -noupdate -radix hexadecimal /Segway_tb/iPHYS/torque_rght
add wave -noupdate -radix hexadecimal /Segway_tb/iPHYS/net_torque
add wave -noupdate -radix decimal /Segway_tb/iPHYS/omega_lft
add wave -noupdate -radix decimal /Segway_tb/iPHYS/omega_rght
add wave -noupdate -radix decimal /Segway_tb/iPHYS/theta_lft
add wave -noupdate -radix decimal /Segway_tb/iPHYS/theta_rght
add wave -noupdate -format Analog-Step -height 84 -max 31504.0 -min -23982.0 -radix decimal /Segway_tb/iPHYS/omega_platform
add wave -noupdate -format Analog-Step -height 84 -max 5840.0 -min -18497.0 -radix decimal /Segway_tb/iPHYS/theta_platform
add wave -noupdate -radix hexadecimal /Segway_tb/rider_lean
add wave -noupdate -radix hexadecimal /Segway_tb/iDUT/i_Digital_core/lft_ld
add wave -noupdate -radix hexadecimal /Segway_tb/iDUT/i_Digital_core/rght_ld
add wave -noupdate -radix hexadecimal /Segway_tb/iDUT/batt_w
add wave -noupdate /Segway_tb/iDUT/i_Digital_core/moving
add wave -noupdate /Segway_tb/iDUT/i_Digital_core/rider_off_w
add wave -noupdate -format Analog-Step -height 84 -max 1019.9999999999999 -min -1013.0 -radix decimal /Segway_tb/iDUT/i_Digital_core/lft_spd
add wave -noupdate -format Analog-Step -height 84 -max 1019.9999999999999 -min -1013.0 -radix decimal /Segway_tb/iDUT/i_Digital_core/rght_spd
add wave -noupdate /Segway_tb/iDUT/i_Digital_core/lft_rev
add wave -noupdate /Segway_tb/iDUT/i_Digital_core/rght_rev
add wave -noupdate /Segway_tb/iDUT/ovr_spd_w
add wave -noupdate /Segway_tb/iDUT/batt_low_w
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {181139755 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 318
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {74699032 ps}
