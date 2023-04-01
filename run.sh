#!/bin/bash
#Path: run.sh

while true; do
PS3='Please enter your choice: '
options=("Scripts" "Bank Options" "#" "Quit")
select opt in "${options[@]}"
do
case $opt in
"Scripts")
PS3='Please choose a tree viewer option: '
tree_options=("What is my xml/xslt path" "Convert XML to Website" "CMD Tools/Options" "Quit")
select tree_opt in "${tree_options[@]}"
do
case $tree_opt in
"What is my xml/xslt path")
# Do something for Option 1
cd scripts
python hunt_my_path.py
read -p "Press any key to continue... "
break
;;
"Convert XML to Website")
cd scripts
python make_website.py
read -p "Press any key to continue... "
break
;;
"CMD Tools/Options")
# Do something for Option 3
PS3='Please choose a tree viewer option: '
tree_viewer_options=("Code Counter" "Folder Structure" "Delete SASS Mistakes" "Quit")
select tree_viewer_opt in "${tree_viewer_options[@]}"
do
case $tree_viewer_opt in
"Code Counter")
# Do something for Option 1
cd scripts/cmd
exec ./code_counter.sh
read -p "Press any key to continue... "
break
;;
"Folder Structure")
# Do something for Option 2
cd scripts/cmd
exec ./structure_folder.sh
read -p "Press any key to continue... "
break
;;
"Delete SASS Mistakes")
# Do something for Option 2
cd scripts/cmd
exec ./delete_sass.sh
read -p "Press any key to continue... "
break
;;
"Quit")
# Do something for Option 3
break
exit 0
;;
*) echo "Invalid option.";;
esac
done
break
;;
"Quit")
# Do something for Option 4
exit 0
;;
*) echo "Invalid option.";;
esac
done
break
;;
"Bank Options")
python book_keeping.py
read -p "Press any key to continue... "
break
;;
"#")
echo $opt
# echo "you chose choice $REPLY which is $opt"
break
;;
"Quit")
exit 0
;;
*) echo "Invalid option.";;
esac
done
done
