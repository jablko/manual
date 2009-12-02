<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <fo:root>

      <fo:layout-master-set>
        <fo:simple-page-master margin=".5in 1in" master-name="all-pages">
          <fo:region-body margin=".5in 0"/>
          <fo:region-before/>
          <fo:region-after display-align="after"/>
        </fo:simple-page-master>
      </fo:layout-master-set>

      <fo:bookmark-tree>
        <xsl:apply-templates mode="aaa"/>
      </fo:bookmark-tree>

      <fo:page-sequence format="i" master-reference="all-pages">

        <fo:flow flow-name="xsl-region-body">
          <fo:block space-after="1in" space-before="1in" space-before.conditionality="retain">
            <fo:external-graphic src="url('http://ica-atom.org/images/ica-atom-logo-1_0.png')"/>
          </fo:block>
          <fo:block font-size="24pt" space-after="1in" space-before="1in" space-before.conditionality="retain" text-align="center">
            User manual
          </fo:block>
        </fo:flow>

      </fo:page-sequence>

      <fo:page-sequence format="i" master-reference="all-pages">

        <fo:flow flow-name="xsl-region-body">
          <fo:block>
            <xsl:apply-templates mode="bbb"/>
          </fo:block>
        </fo:flow>

      </fo:page-sequence>

      <fo:page-sequence initial-page-number="1" master-reference="all-pages">

        <fo:static-content flow-name="xsl-region-before">
          <fo:block>
            <fo:retrieve-marker retrieve-class-name="heading"/>
            <fo:page-number/>
          </fo:block>
        </fo:static-content>

        <fo:static-content flow-name="xsl-region-after">
          <fo:block color="gray" font-family="serif" text-align-last="justify">
            <fo:external-graphic content-height="12pt" src="url('http://ica-atom.org/images/ica-atom-logo-1_0.png')"/><fo:leader/>Brought to you by <fo:external-graphic content-height="12pt" src="url('http://artefactual.com/images/logo.png')"/>
          </fo:block>
        </fo:static-content>

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
        <xsl:apply-templates mode="aaa" select="document(html:a/@href)//html:h1"/>
      </fo:bookmark-title>
      <xsl:apply-templates mode="aaa"/>
    </fo:bookmark>
  </xsl:template>

  <xsl:template match="html:a" mode="bbb">
    <fo:block text-align-last="justify">
      <fo:basic-link internal-destination="{generate-id()}">
        <xsl:apply-templates mode="aaa" select="document(@href)//html:h1"/>
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

  <xsl:template match="html:a[@class='image']" priority="1">
    <fo:external-graphic src="url('{resolve-uri(document(@href)/id('file')//html:img/@src, resolve-uri(@href, base-uri()))}')"/>
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

  <xsl:template match="html:h1">
    <fo:marker marker-class-name="heading">
      <xsl:apply-templates/>
    </fo:marker>
  </xsl:template>

  <xsl:template match="html:img">
    <fo:external-graphic src="url('{resolve-uri(@src, base-uri())}')"/>
  </xsl:template>

</xsl:stylesheet>
