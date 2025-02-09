transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/NJU/3rd\ semester/digital\ logical\ circuit\ experiments/lab08 {D:/NJU/3rd semester/digital logical circuit experiments/lab08/ps2_keyboard.v}
vlog -vlog01compat -work work +incdir+D:/NJU/3rd\ semester/digital\ logical\ circuit\ experiments/lab08 {D:/NJU/3rd semester/digital logical circuit experiments/lab08/button_to_assic.v}
vlog -vlog01compat -work work +incdir+D:/NJU/3rd\ semester/digital\ logical\ circuit\ experiments/lab08 {D:/NJU/3rd semester/digital logical circuit experiments/lab08/seven_num.v}
vlog -vlog01compat -work work +incdir+D:/NJU/3rd\ semester/digital\ logical\ circuit\ experiments/lab08 {D:/NJU/3rd semester/digital logical circuit experiments/lab08/keyboard_lab.v}

vlog -vlog01compat -work work +incdir+D:/NJU/3rd\ semester/digital\ logical\ circuit\ experiments/lab08 {D:/NJU/3rd semester/digital logical circuit experiments/lab08/keyboard_sim.v}
vlog -vlog01compat -work work +incdir+D:/NJU/3rd\ semester/digital\ logical\ circuit\ experiments/lab08 {D:/NJU/3rd semester/digital logical circuit experiments/lab08/ps2_keyboard_model.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  keyboard_sim

add wave *
view structure
view signals
run -all
