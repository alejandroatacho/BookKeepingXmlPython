#!/bin/bash
# Path: run.sh

PS3= 'Please enter your choice: '
options=("Tree viewer" "Add Investors" "#" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Tree viewer")
            cd script
            exec python tree_viewer.py
            ;;
        "Add new values")
        read -r -p "Press any key to continue!: " response
        response=${response,,}    # tolower
            exec python book_keeping.py
            ;;
        "#")
            echo $opt
            # echo "you chose choice $REPLY which is $opt"
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
