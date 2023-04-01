import lxml.etree as ET

def transform_xml_to_html(xml_file, xslt_file, output_file, css_path):
    # Load the XML and XSLT files
    xml_doc = ET.parse(xml_file)
    xslt_doc = ET.parse(xslt_file)

    # Get the XSLT root element
    xslt_root = xslt_doc.getroot()

    # Add the CSS link element to the XSLT stylesheet
    css_element = ET.Element("link")
    css_element.set("rel", "stylesheet")
    css_element.set("type", "text/css")
    css_element.set("href", css_path)
    xslt_root.find(".//head").append(css_element)

    # Add the JavaScript script element to the XSLT stylesheet
    # js_element = ET.Element("script")
    # js_element.set("src", js_path)
    # js_element.set("type", "text/javascript")
    # xslt_root.find(".//body").append(js_element)
    # js_closing_element = ET.SubElement(js_element, "script")
    # js_closing_element.text = "</script>"

    # Create the XSLT transformer
    transformer = ET.XSLT(xslt_doc)

    # Apply the transformation and get the resulting HTML document
    result_tree = transformer(xml_doc)
    html_doc = ET.tostring(result_tree, pretty_print=True)

    # Write the HTML document to a file
    with open(output_file, 'wb') as f:
        f.write(html_doc)

# Run all the functions
if __name__ == '__main__':
    transform_xml_to_html('../views/xml/transactions.xml', '../views/xslt/transactions.xslt', '../index.html', 'scss/style.css')
    # transform_xml_to_html('../views/xml/transactions.xml', '../views/xslt/transactions.xslt', '../index.html', 'scss/style.css', 'js/main.js')

# Add more calls for other XML and XSLT file pairs
# transform_xml_to_html('xml_file2', 'xslt_file2', 'output_file2', 'css_path2', 'js_path2')
# transform_xml_to_html('xml_file3', 'xslt_file3', 'output_file3', 'css_path3', 'js_path3')
