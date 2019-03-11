if {[file exists work]} {
	vdel -lib work -all
}
vlib work
vmap work work

### ---------------------------------------------- ###
### Compile code ###
### Enter files here; copy line for multiple files ###
vcom -work work [pwd]/clockdiv.vhd

### ---------------------------------------------- ###
### Load design for simulation ###
### Replace topLevelEntity with the name of your top level entity (no .vhd) ###
### Do not duplicate! ###
vsim clockdiv

### ---------------------------------------------- ###
### Add waves here ###
### Use add wave * to see all signals ###
add wave iclk
add wave clr
add wave Count
### Force waves here ###
force iclk 0 0, 1 10 -repeat 20
force clr 0 0, 1 20, 0 120, 1 210, 0 750

### ---------------------------------------------- ###
### Run simulation ###
### Do not modify ###
# to see your design hierarchy and signals 
view structure


# to see all signal names and current values
view signals

### ---------------------------------------------- ###
### Edit run time ###
run 800 
wave zoomfull