<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="@*|node()">
    <xsl:copy>

      <!-- Copy @xml:base -->

      <xsl:apply-templates select="*['content' = @id]/@*"/>

      <xsl:apply-templates select="@*|node()"/>

    </xsl:copy>
  </xsl:template>

  <!-- No two elements in a document may have the same unique ID, http://www.w3.org/TR/xpath/#unique-id -->

  <xsl:template match="*['content' = @id]">
    <xsl:apply-templates mode="content"/>
  </xsl:template>

  <!-- Content -->

  <xsl:template match="text()" mode="content"/>

  <xsl:template match="html:section" mode="content">
    <xsl:apply-templates/>
  </xsl:template>

</xsl:stylesheet>
