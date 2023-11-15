
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name lab8 -dir "C:/Users/Muhammad Ali khan/DSD/lab8/planAhead_run_1" -part xc6slx9csg324-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property top task2 $srcset
set_param project.paUcfFile  "task2.ucf"
set hdlfile [add_files [list {labt1.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
add_files "task2.ucf" -fileset [get_property constrset [current_run]]
add_files -norecurse { {C:/Users/Muhammad Ali khan/DSD/lab8} }
open_rtl_design -part xc6slx9csg324-3
