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

        <fo:flow font-size="24pt" flow-name="xsl-region-body" text-align="center">
          <fo:block>
            <fo:external-graphic src="url('http://ica-atom.org/images/ica-atom-logo-1_0.png')"/>
          </fo:block>
          <fo:block space-after="1in" space-before="1in">
            User manual
          </fo:block>
        </fo:flow>

      </fo:page-sequence>

      <fo:page-sequence format="i" master-reference="all-pages">

        <fo:flow flow-name="xsl-region-body">
          <fo:list-block>
            <xsl:apply-templates mode="bbb"/>
          </fo:list-block>
        </fo:flow>

      </fo:page-sequence>

      <fo:page-sequence initial-page-number="1" master-reference="all-pages">

        <fo:static-content flow-name="xsl-region-before" font-family="serif" text-align-last="justify">
          <fo:block>
            <fo:retrieve-marker retrieve-class-name="heading"/><fo:leader/><fo:page-number/>
          </fo:block>
        </fo:static-content>

        <fo:static-content color="gray" flow-name="xsl-region-after" font-family="serif" text-align-last="justify">
          <fo:block>
            <fo:external-graphic content-height="12pt" src="url('http://ica-atom.org/images/ica-atom-logo-1_0.png')"/><fo:leader/>Brought to you by <fo:external-graphic content-height="12pt" src="url('http://artefactual.com/images/logo.png')"/>
          </fo:block>
        </fo:static-content>

        <fo:flow flow-name="xsl-region-body" font-family="serif" text-align="justify">
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
        <xsl:apply-templates mode="bbb" select="document(@href)//html:h1"/><fo:leader/><fo:page-number-citation ref-id="{generate-id()}"/>
      </fo:basic-link>
    </fo:block>
  </xsl:template>

  <xsl:template match="html:li" mode="bbb">
    <fo:list-item font-weight="bold" leader-pattern="dots" space-after="1em" space-before="1em">
      <fo:list-item-label>
        <fo:block>
          <xsl:number/>.
        </fo:block>
      </fo:list-item-label>
      <fo:list-item-body start-indent="body-start()">
        <xsl:apply-templates mode="bbb"/>
      </fo:list-item-body>
    </fo:list-item>
  </xsl:template>

  <xsl:template match="html:li//html:li" mode="bbb">
    <!-- TODO Use fo:wrapper, https://issues.apache.org/bugzilla/show_bug.cgi?id=47530 -->
    <fo:block font-family="serif" font-weight="normal" leader-pattern="space">
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

  <xsl:template match="html:a[contains(concat(' ', @class, ' '), ' image ')]" priority="1">
    <fo:external-graphic content-height="4in" content-width="4in" src="url('{resolve-uri(document(@href)/id('file')//html:img/@src, resolve-uri(@href, base-uri()))}')"/>
  </xsl:template>

  <xsl:template match="html:div[contains(concat(' ', @class, ' '), ' thumb ')]">
    <fo:block>
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="html:div[contains(concat(' ', @class, ' '), ' thumbcaption ')]">
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

  <xsl:template match="html:p">
    <fo:block space-after=".5em" space-before=".5em">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

</xsl:stylesheet>
