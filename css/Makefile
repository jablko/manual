all: manual.pdf

manual.pdf: manual.css manual.html prince.xsl
	java -jar ../saxon9he.jar manual.html prince.xsl base=../manual.html | ../prince-7.0-linux/lib/prince/bin/prince --baseurl ../manual.html - > manual.pdf

manual.html: ../base.xsl ../manual.html manual.xsl
	java -Dxml.catalog.files=/etc/xml/catalog -jar ../saxon9he.jar -r com.sun.org.apache.xml.internal.resolver.tools.CatalogResolver -x com.sun.org.apache.xml.internal.resolver.tools.ResolvingXMLReader -xi ../manual.html manual.xsl | java -jar ../saxon9he.jar - ../base.xsl base=../manual.html > manual.html
