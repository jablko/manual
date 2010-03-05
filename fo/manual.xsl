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

        <fo:simple-page-master margin=".5in 1in" master-name="glossary">
          <fo:region-body column-count="2" margin=".5in 0"/>
          <fo:region-before/>
          <fo:region-after display-align="after"/>
        </fo:simple-page-master>

      </fo:layout-master-set>

      <fo:bookmark-tree>
        <xsl:apply-templates mode="bookmark-tree"/>
      </fo:bookmark-tree>

      <xsl:apply-templates mode="front-cover"/>

      <fo:page-sequence format="i" master-reference="all-pages">

        <fo:flow flow-name="xsl-region-body">

          <fo:block font-size="24pt" space-after="1in" space-after.conditionality="retain" space-before="1in" space-before.conditionality="retain" span="all">
            Table of Contents
          </fo:block>

          <fo:list-block font-weight="bold">
            <xsl:apply-templates mode="table-of-contents"/>
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
          <xsl:apply-templates/>
        </fo:flow>

      </fo:page-sequence>

      <xsl:apply-templates mode="glossary"/>

    </fo:root>
  </xsl:template>

  <xsl:template match="html:a[@href]">
    <fo:basic-link external-destination="{@href}">
      <xsl:apply-templates/>
    </fo:basic-link>
  </xsl:template>

  <xsl:template match="html:h">
    <fo:block font-size="24pt" space-after="1in" space-after.conditionality="retain" space-before="1in" space-before.conditionality="retain" span="all">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="html:h1">

    <fo:marker marker-class-name="heading">
      Chapter <xsl:number/>: <xsl:apply-templates/>
    </fo:marker>

    <fo:block font-size="24pt" space-after="1in" space-after.conditionality="retain" space-before="1in" space-before.conditionality="retain" span="all">

      <fo:block font-size="14pt">
        Chapter <xsl:number/>
      </fo:block>

      <fo:block>
        <xsl:apply-templates/>
      </fo:block>

    </fo:block>

  </xsl:template>

  <xsl:template match="html:img">
    <fo:external-graphic src="url('{resolve-uri(@src, base-uri())}')"/>
  </xsl:template>

  <xsl:template match="html:p">
    <fo:block space-after=".5em" space-before=".5em">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="html:script"/>

  <xsl:template match="html:section">
    <fo:block break-after="page" break-before="page" id="{generate-id()}">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="html:section//html:section">
    <fo:block id="{generate-id()}" space-after=".5in" space-before=".5in">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="html:section//html:section//html:h1">
    <fo:block font-size="18pt" space-after=".25in" space-before=".25in">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="html:ul">
    <fo:list-block space-after=".5em" space-before=".5em">
      <xsl:apply-templates/>
    </fo:list-block>
  </xsl:template>

  <xsl:template match="html:ul//html:li">
    <fo:list-item>

      <fo:list-item-label start-indent="1em">
        <fo:block>
          &#x2022;
        </fo:block>
      </fo:list-item-label>

      <fo:list-item-body end-indent="2em" start-indent="2em">
        <fo:block>
          <xsl:apply-templates/>
        </fo:block>
      </fo:list-item-body>

    </fo:list-item>
  </xsl:template>

  <xsl:template match="id('jump-to-nav')"/>

  <xsl:template match="id('siteSub')"/>

  <xsl:template match="id('toc')"/>

  <xsl:template match="*[contains(concat(' ', @class, ' '), ' front-cover ')]"/>

  <xsl:template match="*[contains(concat(' ', @class, ' '), ' glossary ')]"/>

  <xsl:template match="*[contains(concat(' ', @class, ' '), ' glossary ')]//html:h1">

    <fo:marker marker-class-name="heading">
      <xsl:apply-templates/>
    </fo:marker>

    <fo:block font-size="24pt" space-after="1in" space-after.conditionality="retain" space-before="1in" space-before.conditionality="retain" span="all">
      <xsl:apply-templates/>
    </fo:block>

  </xsl:template>

  <xsl:template match="*[contains(concat(' ', @class, ' '), ' image ')]">
    <fo:block>
      <fo:external-graphic content-height="4in" content-width="4in" src="url('{resolve-uri(document(@href)/id('file')//html:img/@src, resolve-uri(@href, base-uri()))}')"/>
    </fo:block>
  </xsl:template>

  <xsl:template match="*[contains(concat(' ', @class, ' '), ' magnify ')]"/>

  <xsl:template match="*[contains(concat(' ', @class, ' '), ' printfooter ')]"/>

  <xsl:template match="*[contains(concat(' ', @class, ' '), ' thumb ')]">
    <!-- TODO Use fo:float, http://wiki.apache.org/xmlgraphics-fop/GoogleSummerOfCode2006/FloatsImplementationProgress/ImplementingSideFloats -->
    <fo:block keep-together="always" space-after="1em" space-before="1em">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="*[contains(concat(' ', @class, ' '), ' thumbcaption ')]">
    <fo:block font-style="italic">
      Figure <xsl:number/>. <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <!-- Bookmark tree -->

  <xsl:template match="text()" mode="bookmark-tree"/>

  <xsl:template match="html:h1" mode="bookmark-tree">
    <fo:bookmark-title>
      <xsl:apply-templates/>
    </fo:bookmark-title>
  </xsl:template>

  <xsl:template match="html:h2" mode="bookmark-tree">
    <fo:bookmark internal-destination="{generate-id()}">
      <fo:bookmark-title>
        <xsl:apply-templates/>
      </fo:bookmark-title>
    </fo:bookmark>
  </xsl:template>

  <xsl:template match="html:section" mode="bookmark-tree">
    <fo:bookmark internal-destination="{generate-id()}">
      <xsl:apply-templates mode="bookmark-tree"/>
    </fo:bookmark>
  </xsl:template>

  <xsl:template match="*[contains(concat(' ', @class, ' '), ' front-cover ')]" mode="bookmark-tree"/>

  <!-- Front cover -->

  <xsl:template match="text()" mode="front-cover"/>

  <xsl:template match="*[contains(concat(' ', @class, ' '), ' front-cover ')]" mode="front-cover">
    <fo:page-sequence format="i" master-reference="all-pages">
      <fo:flow flow-name="xsl-region-body" text-align="center">
        <fo:block break-after="page" break-before="page" id="{generate-id()}">
          <xsl:apply-templates/>
        </fo:block>
      </fo:flow>
    </fo:page-sequence>
  </xsl:template>

  <!-- Glossary -->

  <xsl:template match="text()" mode="glossary"/>

  <xsl:template match="*[contains(concat(' ', @class, ' '), ' glossary ')]" mode="glossary">
    <fo:page-sequence master-reference="glossary">

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
        <fo:block break-after="page" break-before="page" id="{generate-id()}">
          <xsl:apply-templates/>
        </fo:block>
      </fo:flow>

    </fo:page-sequence>
  </xsl:template>

  <!-- Table of contents -->

  <xsl:template match="text()" mode="table-of-contents"/>

  <xsl:template match="html:section" mode="table-of-contents">
    <fo:list-item leader-pattern="dots" leader-pattern-width=".5em" space-after="1em" space-before="1em">

      <fo:list-item-label start-indent="1em">
        <fo:block>
          <xsl:number/>.
        </fo:block>
      </fo:list-item-label>

      <fo:list-item-body end-indent="2em" start-indent="2em">

        <fo:block text-align-last="justify">
          <fo:basic-link internal-destination="{generate-id()}">
            <xsl:apply-templates mode="table-of-contents.heading"/><fo:leader/><fo:page-number-citation ref-id="{generate-id()}"/>
          </fo:basic-link>
        </fo:block>

        <fo:block font-family="serif" font-weight="normal" leader-pattern="space">
          <xsl:apply-templates mode="table-of-contents"/>
        </fo:block>

      </fo:list-item-body>

    </fo:list-item>
  </xsl:template>

  <xsl:template match="html:section//html:section" mode="table-of-contents">
    <fo:block text-align-last="justify">
      <fo:basic-link internal-destination="{generate-id()}">
        <xsl:apply-templates mode="table-of-contents.heading"/><fo:leader/><fo:page-number-citation ref-id="{generate-id()}"/>
      </fo:basic-link>
    </fo:block>
  </xsl:template>

  <xsl:template match="*[contains(concat(' ', @class, ' '), ' front-cover ')]" mode="table-of-contents"/>

  <xsl:template match="text()" mode="table-of-contents.heading"/>

  <xsl:template match="html:section" mode="table-of-contents.heading"/>

  <xsl:template match="html:h1" mode="table-of-contents.heading">
    <xsl:apply-templates/>
  </xsl:template>

</xsl:stylesheet>
