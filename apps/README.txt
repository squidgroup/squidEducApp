1) "base_structure" is a folder with the necessary files to create a new app.
2) one only needs to add a server_module.R file and a ui_module.R file to create a new app.
3) The paths for all files specific to an app are sourced by constructing the path using the folder number. Currently: server_module*.R, ui_module*.R
4) The source folder includes files where variables, texts, or utility functions are stored separately. 
5) global.R sources all files required anywhere else, as  stored under any folder in ./sources, except for some CSS and javascript files. global.R never has to be modified, unless a library is added since those are also loaded here.
6) upon making a new app from "base_structure", various include files and folders will need to be cleaned up, since everything that is stored in /sources is loaded by default.


Apps 1-4: previously module 1 steps 1-4
Apps 5-7: previously module 2 steps 1-3
Apps 8-10: previously module 3 steps 1-3
Apps 11-15: previously module 4 steps 1-5
Apps 16-17: previously module 5 steps 1-2
Apps 18-20: previously module 6 steps 1-3
Apps 21-22: previously module 8 steps 1-2
