import lxml.etree as ET

# Load the XML and XSLT files
xml_file = '../views/storage.xml'
xslt_file = '../views/bank.xslt'
xml_doc = ET.parse(xml_file)
xslt_doc = ET.parse(xslt_file)

# Get the XSLT root element
xslt_root = xslt_doc.getroot()

# Add the CSS link element to the XSLT stylesheet
css_element = ET.Element("link")
css_element.set("rel", "stylesheet")
css_element.set("type", "text/css")
css_element.set("href", "scss/style.css")
xslt_root.find(".//head").append(css_element)

# Add the JavaScript script element to the XSLT stylesheet
js_element = ET.Element("script")
js_element.set("src", "js/main.js")
xslt_root.find(".//body").append(js_element)

# Add the closing script tag after the first script element
js_closing_element = ET.SubElement(js_element, "script")
js_closing_element.text = "</script>"

# Create the XSLT transformer
transformer = ET.XSLT(xslt_doc)

# Apply the transformation and get the resulting HTML document
result_tree = transformer(xml_doc)
html_doc = ET.tostring(result_tree, pretty_print=True)

# Write the HTML document to a file
with open('../index.html', 'wb') as f:
    f.write(html_doc)
