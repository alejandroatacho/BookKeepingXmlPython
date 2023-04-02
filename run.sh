#!/bin/bash
#Path: run.sh

execute_scripts() {
  case $1 in
    1) cd scripts; python hunt_my_path.py ;;
    2) cd scripts; python make_website.py ;;
    3) cd scripts/cmd; exec ./code_counter.sh ;;
    4) cd scripts/cmd; exec ./structure_folder.sh ;;
    5) cd scripts/cmd; exec ./delete_sass.sh ;;
  esac
  read -p "Press any key to continue... "
}

while true; do
  echo "Hello Cutie _(:3」∠)_ , $(whoami), $(hostname)"
  PS3='Please enter your choice: '
  options=("Scripts" "Bank Options" "Quick Parse" "Quit")
  select opt in "${options[@]}"; do
    case $opt in
      "Scripts")
        PS3='Please choose a tree viewer option: '
        tree_options=("What is my xml/xslt path" "Convert XML to Website" "CMD Tools/Options" "Quit")
        select tree_opt in "${tree_options[@]}"; do
          case $tree_opt in
            "What is my xml/xslt path") execute_scripts 1; break ;;
            "Convert XML to Website") execute_scripts 2; break ;;
            "CMD Tools/Options")
              PS3='Please choose a tree viewer option: '
              tree_viewer_options=("Code Counter" "Folder Structure" "Delete SASS Mistakes" "Quit")
              select tree_viewer_opt in "${tree_viewer_options[@]}"; do
                case $tree_viewer_opt in
                  "Code Counter") execute_scripts 3; break ;;
                  "Folder Structure") execute_scripts 4; break ;;
                  "Delete SASS Mistakes") execute_scripts 5; break ;;
                  "Quit") break ;;
                  *) echo "Invalid option." ;;
                esac
              done
              break
              ;;
            "Quit") break ;;
            *) echo "Invalid option." ;;
          esac
        done
        ;;
      "Bank Options") python book_keeping.py; read -p "Press any key to continue... "; break ;;
      "Quick Parse") execute_scripts 2; break;;
      "Quit") exit 0 ;;
      *) echo "Invalid option." ;;
    esac
  done
done
