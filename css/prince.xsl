<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:param name="base"/>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="@href[starts-with(., '#')]">
    <xsl:attribute name="href">
      file:<xsl:value-of select="concat($base, .)"/>
    </xsl:attribute>
  </xsl:template>

</xsl:stylesheet>
