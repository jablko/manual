<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="html:body">
    <xsl:copy>

      <xsl:apply-templates mode="front-cover"/>

      <html:section class="table-of-contents">
        <html:ol>
          <xsl:apply-templates mode="table-of-contents"/>
        </html:ol>
      </html:section>

      <xsl:apply-templates select="@*|node()"/>

    </xsl:copy>
  </xsl:template>

  <xsl:template match="*[contains(concat(' ', @class, ' '), ' front-cover ')]"/>

  <xsl:template match="*[contains(concat(' ', @class, ' '), ' image ')]//html:img/@src">
    <xsl:attribute name="src">
      <xsl:value-of select="resolve-uri(document(ancestor::*[contains(concat(' ', @class, ' '), ' image ')]/@href)/id('file')//html:img/@src, resolve-uri(ancestor::*[contains(concat(' ', @class, ' '), ' image ')]/@href, base-uri()))"/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="html:section">
    <xsl:copy>

      <xsl:attribute name="id">
        <xsl:value-of select="generate-id()"/>
      </xsl:attribute>

      <xsl:apply-templates select="@*|node()"/>

    </xsl:copy>
  </xsl:template>

  <xsl:template match="@href[//*[resolve-uri(current(), base-uri(current())) = base-uri()]]">
    <xsl:attribute name="href">
      <xsl:value-of select="concat('#', generate-id(//html:section[.//*[resolve-uri(current(), base-uri(current())) = base-uri()] and not(.//html:section[.//*[resolve-uri(current(), base-uri(current())) = base-uri()]])]))"/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="text()" mode="front-cover"/>

  <xsl:template match="*[contains(concat(' ', @class, ' '), ' front-cover ')]" mode="front-cover">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="text()" mode="table-of-contents"/>

  <xsl:template match="html:section" mode="table-of-contents">
    <html:li>

      <html:a href="#{generate-id()}">
        <xsl:apply-templates mode="table-of-contents.heading"/>
      </html:a>

      <xsl:if test="html:section">
        <html:ol>
          <xsl:apply-templates mode="table-of-contents"/>
        </html:ol>
      </xsl:if>

    </html:li>
  </xsl:template>

  <xsl:template match="text()" mode="table-of-contents.heading"/>

  <xsl:template match="html:section" mode="table-of-contents.heading"/>

  <xsl:template match="html:h1" mode="table-of-contents.heading">
    <xsl:apply-templates/>
  </xsl:template>

</xsl:stylesheet>
