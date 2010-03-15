all: manual.pdf

clean:
	rm -f manual.pdf

manual.pdf: ../manual.html manual.xsl
	CLASSPATH=../saxon9he.jar FOP_OPTS='-Djavax.xml.transform.TransformerFactory=net.sf.saxon.TransformerFactoryImpl -Dxml.catalog.files=/etc/xml/catalog' ../fop/fop -catalog -xml ../manual.html -xsl manual.xsl manual.pdf
