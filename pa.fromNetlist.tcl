
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name LIFT -dir "C:/My_Designs/LIFT/planAhead_run_2" -part xc6slx16csg324-2
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/My_Designs/LIFT/main.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/My_Designs/LIFT} }
set_property target_constrs_file "filee.ucf" [current_fileset -constrset]
add_files [list {filee.ucf}] -fileset [get_property constrset [current_run]]
link_design
