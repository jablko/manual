all: manual.pdf

manual.pdf: manual.css manual.html
	../prince-7.0-linux/lib/prince/bin/prince --baseurl ../manual.html manual.html

manual.html: ../manual.html manual.xsl
	CLASSPATH=../saxon9he.jar java -Dxml.catalog.files=/etc/xml/catalog net.sf.saxon.Transform -r com.sun.org.apache.xml.internal.resolver.tools.CatalogResolver -x com.sun.org.apache.xml.internal.resolver.tools.ResolvingXMLReader -xi ../manual.html manual.xsl > manual.html
