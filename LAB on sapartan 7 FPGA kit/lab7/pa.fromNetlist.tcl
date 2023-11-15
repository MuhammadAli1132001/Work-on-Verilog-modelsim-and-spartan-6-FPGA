
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name lab7 -dir "C:/Users/Muhammad Ali khan/DSD/lab7/planAhead_run_1" -part xc6slx9csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Muhammad Ali khan/DSD/lab7/leveltopulseconverter.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Muhammad Ali khan/DSD/lab7} }
set_param project.pinAheadLayout  yes
set_param project.paUcfFile  "leveltopulseconverter.ucf"
add_files "leveltopulseconverter.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
