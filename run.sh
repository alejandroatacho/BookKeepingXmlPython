#!/bin/bash
#Path: run.sh

while true; do
PS3='Please enter your choice: '
options=("Python Scripts" "Bank Options" "#" "Quit")
select opt in "${options[@]}"
do
case $opt in
"Python Scripts")
PS3='Please choose a tree viewer option: '
tree_options=("What is my xml/xslt path" "Convert XML to Website" "Tree Viewer" "Quit")
select tree_opt in "${tree_options[@]}"
do
case $tree_opt in
"What is my xml/xslt path")
# Do something for Option 1
cd script
python hunt_my_path.py
read -p "Press any key to continue... "
break
;;
"Convert XML to Website")
cd script
python make_website.py
read -p "Press any key to continue... "
break
;;
"Tree Viewer")
# Do something for Option 3
cd script
python tree_viewer.py
read -p "Press any key to continue... "
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
