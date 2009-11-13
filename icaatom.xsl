<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <fo:root>
      <fo:layout-master-set>
        <fo:simple-page-master master-name="all-pages">
          <fo:region-body/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="all-pages">
        <fo:flow flow-name="xsl-region-body">
          <fo:block>
            <xsl:apply-templates mode="foo"/>
          </fo:block>
        </fo:flow>
      </fo:page-sequence>
      <fo:page-sequence master-reference="all-pages">
        <fo:flow flow-name="xsl-region-body">
          <fo:block>
            <xsl:apply-templates mode="bar"/>
          </fo:block>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>

  <xsl:template match="html:a" mode="foo">
    <fo:block text-align-last="justify">
      <xsl:apply-templates select="document(@href)//html:h1"/>
      <fo:leader leader-pattern="dots"/>
      <fo:page-number-citation ref-id="{generate-id()}"/>
    </fo:block>
  </xsl:template>

  <xsl:template match="html:ol" mode="foo">
    <fo:block margin-left="1em">
      <xsl:apply-templates mode="foo"/>
    </fo:block>
  </xsl:template>

  <xsl:template match="html:a" mode="bar">
    <fo:block id="{generate-id()}">
      <xsl:apply-templates select="document(@href)/id('content')"/>
    </fo:block>
  </xsl:template>

  <xsl:template match="html:a[@href]">
    <fo:basic-link external-destination="{@href}">
      <xsl:apply-templates/>
    </fo:basic-link>
  </xsl:template>

  <xsl:template match="html:img">
    <fo:external-graphic src="url('{@src}')"/>
  </xsl:template>

</xsl:stylesheet>
