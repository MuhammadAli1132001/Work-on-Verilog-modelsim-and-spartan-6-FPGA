
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name lab8a -dir "C:/Users/Muhammad Ali khan/DSD/lab8a/planAhead_run_1" -part xc6slx9ftg256-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Muhammad Ali khan/DSD/lab8a/Lock_SD.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Muhammad Ali khan/DSD/lab8a} }
set_param project.pinAheadLayout  yes
set_param project.paUcfFile  "Lock_SD.ucf"
add_files "Lock_SD.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
