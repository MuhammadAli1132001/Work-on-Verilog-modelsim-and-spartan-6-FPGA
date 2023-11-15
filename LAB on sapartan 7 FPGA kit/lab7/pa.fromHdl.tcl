
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name lab7 -dir "C:/Users/Muhammad Ali khan/DSD/lab7/planAhead_run_1" -part xc6slx9csg324-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property top leveltopulseconverter $srcset
set_param project.paUcfFile  "leveltopulseconverter.ucf"
set hdlfile [add_files [list {leveltopulseconverter.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
add_files "leveltopulseconverter.ucf" -fileset [get_property constrset [current_run]]
add_files -norecurse { {C:/Users/Muhammad Ali khan/DSD/lab7} }
open_rtl_design -part xc6slx9csg324-3
