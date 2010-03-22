all: $(patsubst ../manual%.html,manual%.pdf,$(wildcard ../manual*.html))

clean:
	rm -f manual*.html manual*.pdf

manual%.pdf: manual%.html prince.xsl print.css style.css
	java -jar ../saxon9he.jar $< prince.xsl base=../manual$*.html | ../prince-7.0-linux/lib/prince/bin/prince --baseurl ../manual$*.html - > $@

manual%.html: ../manual%.html ../base.xsl manual.xsl
	java -Dxml.catalog.files=/etc/xml/catalog -jar ../saxon9he.jar -r com.sun.org.apache.xml.internal.resolver.tools.CatalogResolver -x com.sun.org.apache.xml.internal.resolver.tools.ResolvingXMLReader -xi $< manual.xsl | java -jar ../saxon9he.jar - ../base.xsl base=$< > $@

# .SECONDARY doesn't support patterns?
# http://www.gnu.org/software/make/manual/make.html#index-precious-targets-234

.PRECIOUS: manual%.html
