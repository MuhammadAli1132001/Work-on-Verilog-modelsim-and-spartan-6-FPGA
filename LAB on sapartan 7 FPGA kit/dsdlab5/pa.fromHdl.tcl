
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name dsdlab5 -dir "C:/Users/Muhammad Ali khan/DSD/dsdlab5/planAhead_run_1" -part xc6slx9csg324-2
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property top lab5a $srcset
set_param project.paUcfFile  "lab5counter.ucf"
set hdlfile [add_files [list {lab5a.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
add_files "lab5counter.ucf" -fileset [get_property constrset [current_run]]
add_files -norecurse { {C:/Users/Muhammad Ali khan/DSD/dsdlab5} }
open_rtl_design -part xc6slx9csg324-2
