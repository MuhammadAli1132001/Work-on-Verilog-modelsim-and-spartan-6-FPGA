
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Parking -dir "C:/Users/mohsi/Desktop/PArking/Parking/planAhead_run_1" -part xc6slx9csg324-2
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "Parking.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {D_FF.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Sync.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Seven_Seg_Dec.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Pulse.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Clk_Div.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {Parking.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top Parking $srcset
add_files [list {Parking.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx9csg324-2
