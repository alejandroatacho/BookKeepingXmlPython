import xml.etree.ElementTree as ET
# opens the file #sample.xml is original file
tree = ET.parse('views/database.xml')
root = tree.getroot()  # gets the root of the file


_name = ET.SubElement(root, "name")
_lastname= ET.SubElement(root,"lastname")
_address= ET.SubElement(root,"address")


_name.text = input("Please enter your name: ")
_lastname.text = input("Please enter your last name: ")
_address.text =input("What is your address?: ")


tree.write("views/database.xml")
