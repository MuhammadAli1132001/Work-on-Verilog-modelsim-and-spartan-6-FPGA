
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name lab7task2 -dir "D:/DSD Lab/2 cross 1 mux/lab4/lab7task2/planAhead_run_2" -part xc6slx9csg324-2
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "task2.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {task2.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top task2 $srcset
add_files [list {task2.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx9csg324-2
