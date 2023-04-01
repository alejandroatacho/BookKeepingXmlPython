#!/bin/bash

# Delete folder
cd ..
cd ..
cd scss
echo "Deleting my SASS compiler mistakes!"
sleep 3
rm -rf *.css.map mobile.css animation.css navbar_footer.css 2> /dev/null
if [ $? -eq 0 ]; then
  echo "Done!, all your compiler mistakes have been deleted."
  sleep 2
  echo "Closing Terminal!"
  sleep 1
else
  echo "Failed to delete files or missing files exist."
  sleep 1
fi
# open menu.html
exit