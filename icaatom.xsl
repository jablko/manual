<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <fo:root>

      <fo:layout-master-set>
        <fo:simple-page-master master-name="all-pages">
          <fo:region-body/>
        </fo:simple-page-master>
      </fo:layout-master-set>

      <fo:bookmark-tree>
        <xsl:apply-templates mode="aaa"/>
      </fo:bookmark-tree>

      <fo:page-sequence master-reference="all-pages">
        <fo:flow flow-name="xsl-region-body">
          <fo:block space-after="1in" space-before="1in" space-before.conditionality="retain">
            <fo:external-graphic src="url('http://ica-atom.org/images/ica-atom-logo-1_0.png')"/>
          </fo:block>
          <fo:block font-size="24pt" space-after="1in" space-before="1in" space-before.conditionality="retain" text-align="center">
            User manual
          </fo:block>
        </fo:flow>
      </fo:page-sequence>

      <fo:page-sequence master-reference="all-pages">
        <fo:flow flow-name="xsl-region-body">
          <fo:block>
            <xsl:apply-templates mode="bbb"/>
          </fo:block>
        </fo:flow>
      </fo:page-sequence>

      <fo:page-sequence master-reference="all-pages">
        <fo:flow flow-name="xsl-region-body">
          <fo:block>
            <xsl:apply-templates mode="ccc"/>
          </fo:block>
        </fo:flow>
      </fo:page-sequence>

    </fo:root>
  </xsl:template>

  <xsl:template match="html:li" mode="aaa">
    <fo:bookmark internal-destination="{html:a/generate-id()}">
      <fo:bookmark-title>
        <xsl:apply-templates select="document(html:a/@href)//html:h1"/>
      </fo:bookmark-title>
      <xsl:apply-templates mode="aaa"/>
    </fo:bookmark>
  </xsl:template>

  <xsl:template match="html:a" mode="bbb">
    <fo:block text-align-last="justify">
      <fo:basic-link internal-destination="{generate-id()}">
        <xsl:apply-templates select="document(@href)//html:h1"/>
        <fo:leader leader-pattern="dots"/>
        <fo:page-number-citation ref-id="{generate-id()}"/>
      </fo:basic-link>
    </fo:block>
  </xsl:template>

  <xsl:template match="html:li" mode="bbb">
    <fo:block margin-left="1em">
      <xsl:apply-templates mode="bbb"/>
    </fo:block>
  </xsl:template>

  <xsl:template match="html:a" mode="ccc">
    <fo:block id="{generate-id()}">
      <xsl:apply-templates select="document(@href)/id('content')"/>
    </fo:block>
  </xsl:template>

  <xsl:template match="html:a[@href]">
    <fo:basic-link external-destination="{@href}">
      <xsl:apply-templates/>
    </fo:basic-link>
  </xsl:template>

  <xsl:template match="html:div[@class='thumb']">
    <fo:block>
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="html:div[@class='thumbcaption']">
    <fo:block>
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="html:img">
    <fo:external-graphic src="url('{@src}')"/>
  </xsl:template>

</xsl:stylesheet>
