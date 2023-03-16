from asyncio.windows_events import NULL
import xml.etree.ElementTree as ET

# opens the file #sample.xml is original file
tree = ET.parse('views\main.xml')
root = tree.getroot()  # gets the root of the file
storage = "views\main.xml"  # sample.xml original

print(root.tag, root.attrib)


def check():
    for elm in root.findall("."):
        print(elm.tag, elm.attrib)


def check_value():
    for elm in root:
        for elm2 in elm:
            print(elm2.attrib)

        print(elm2.tag, elm2.attrib)


def country():
    for elm in root.findall("country"):
        print(elm.tag, elm.attrib)


def specific_country():
    for elm in root.findall("country[@name='Panama']"):
       # print(elm.tag, elm.attrib)
        print(elm.attrib)


def rank():
    for elm in root.findall("country/rank"):
        print(elm.tag, elm.attrib)


def direction():
    for elm in root.findall("./country[@name='Panama']/neighbor[@direction='W']"):
        print(elm.tag, elm.attrib)


def value_change():
    for elm in root.findall("./country[@name='Liechtenstein']"):
        elm.set("name", "USA")
        tree.write(storage)


def value_change2():
    for elm in root.findall("./namespace"):
        print(elm.text, elm.attrib, elm.tag)
        elm.set("name", "Python Injections")
        print(elm.text, elm.attrib, elm.tag)
        tree.write(storage)
# def add_value():
#     for elm in root.findall("./data_holder[@sample ='Python Injections']"):
#         elm.set("name", "Python Injections")
#         tree.write(storage)

# def button():
#     new_storage = NULL

#     def check():
#         for elm in root.findall("button"):
#             print(elm.tag, elm.attrib)
#     if button == "check":
#         check()
#     else:
#         print("No button has been found")


def tree_viewer():
    ET.dump(tree)
    print(root.tag, root.attrib, "root/parent has been found")
    print(f"\nPython code space has initiated successfully!\n")
    for child in root:
        print(child.tag, child.attrib, child.text)
        print(len(child), f"child has been found\n")
        for subchild in child:
            print(subchild.tag, subchild.attrib, subchild.text)
            print(len(subchild), f"subchild has been found\n")
            for subsubchild in subchild:
                print(subsubchild.tag, subsubchild.attrib, subsubchild.text)
                print(len(subsubchild), f"subsubchild has been found\n")
                for subsubsubchild in subsubchild:
                    print(subsubsubchild.tag, subsubsubchild.attrib,
                          subsubsubchild.text)
                    print(len(subsubsubchild),
                          f"subsubsubchild has been found\n")
                    for subsubsubsubchild in subsubsubchild:
                        print(subsubsubsubchild.tag, subsubsubsubchild.attrib,
                              subsubsubsubchild.text)
                        print(len(subsubsubsubchild),
                              f"subsubsubsubchild has been found\n")
                        for subsubsubsubsubchild in subsubsubsubchild:
                            print(subsubsubsubsubchild.tag, subsubsubsubsubchild.attrib,
                                  subsubsubsubsubchild.text)
                            print(len(subsubsubsubsubchild),
                                  "subsubsubsubsubchild has been found\n")
        else:
            print(f"No more subchild has been found\n")
            return


if __name__ == "__main__":
    # check_value()
    # value_change2()
    tree_viewer()
    # country()
    # direction()
    # value_change()
