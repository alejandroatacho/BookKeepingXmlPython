import xml.etree.ElementTree as ET
import os
import tkinter as tk
from tkinter import filedialog


def traverse_tree(node, level=0, out_file=None):
    indent = '  ' * level
    print(f"{indent}{node.tag}", file=out_file)

    if node.attrib:
        for name, value in node.attrib.items():
            print(f"{indent}  @{name}: {value}", file=out_file)

    if node.text:
        print(f"{indent}  {node.text.strip()}", file=out_file)

    for child in node:
        traverse_tree(child, level + 1, out_file)


# Ask the user to select an XML file
root = tk.Tk()
root.withdraw()  # Hide the main window
file_path = filedialog.askopenfilename(title="Select an XML file")

# Python code space


def run():
    tree = ET.parse(file_path)
    root = tree.getroot()  # root is the root element of the XML file

    # Create the data folder if it does not exist
    os.makedirs("data", exist_ok=True)

    # Get the base filename without extension
    base_filename = os.path.splitext(os.path.basename(file_path))[0]

    # Set the output file path
    output_file_path = os.path.join("../data", f"{base_filename}_tree_viewer.txt")

    with open(output_file_path, "w") as output_file:
        print(root.tag, root.attrib, "root/parent has been found", file=output_file)
        print(f"\nPython code space has initiated successfully!\n", file=output_file)

        traverse_tree(root, out_file=output_file)

        # Convert the XML tree to a string and write it to the output file
        tree_str = ET.tostring(root, encoding='utf-8').decode('utf-8')
        output_file.write(tree_str)

        # This can be removed if running in a terminal
        # input("Press any key to exit...")


# Run all the functions
if __name__ == '__main__':
    run()
