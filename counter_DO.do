if {[file exists work]} {
	vdel -lib work -all
}
vlib work
vmap work work

### ---------------------------------------------- ###
### Compile code ###
### Enter files here; copy line for multiple files ###
vcom -work work [pwd]/counter.vhd

### ---------------------------------------------- ###
### Load design for simulation ###
### Replace topLevelEntity with the name of your top level entity (no .vhd) ###
### Do not duplicate! ###
vsim counter

### ---------------------------------------------- ###
### Add waves here ###
### Use add wave * to see all signals ###
add wave clock
add wave clrn
add wave ud

add wave q
### Force waves here ###

force clock 0 0, 1 100 -repeat 200
force clrn 0 0, 1 100, 0 800, 1 900
force ud 1 0, 1 250, 0 500, 1 900
### ---------------------------------------------- ###
### Run simulation ###
### Do not modify ###
# to see your design hierarchy and signals 
view structure

# to see all signal names and current values
view signals

### ---------------------------------------------- ###
### Edit run time ###
run 1400 
