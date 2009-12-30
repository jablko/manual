<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="html:body">
    <xsl:copy>

      <html:ol>
        <xsl:apply-templates mode="aaa"/>
      </html:ol>

      <xsl:apply-templates select="@*|node()"/>

    </xsl:copy>
  </xsl:template>

  <xsl:template match="*[contains(concat(' ', @class, ' '), ' image ')]//html:img/@src">
    <xsl:attribute name="src">
      <xsl:value-of select="resolve-uri(document(ancestor::*[contains(concat(' ', @class, ' '), ' image ')]/@href)/id('file')//html:img/@src, resolve-uri(ancestor::*[contains(concat(' ', @class, ' '), ' image ')]/@href, base-uri()))"/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@href">
    <xsl:attribute name="href">
      <xsl:value-of select="resolve-uri(., base-uri())"/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="*[contains(concat(' ', @class, ' '), ' section ')]" mode="aaa">
    <html:li>
      <html:a href="#{generate-id()}">
        <xsl:apply-templates mode="aaa" select=".//html:h1"/>
      </html:a>
      <xsl:if test="*[contains(concat(' ', @class, ' '), ' section ')]">
        <html:ol>
          <xsl:apply-templates mode="aaa"/>
        </html:ol>
      </xsl:if>
    </html:li>
  </xsl:template>

</xsl:stylesheet>
