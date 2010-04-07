<?xml version="1.0" encoding="UTF-8"?>
<stylesheet version="1.0" xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:html="http://www.w3.org/1999/xhtml">

  <template match="/">
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
        <apply-templates mode="bookmark-tree"/>
      </fo:bookmark-tree>

      <apply-templates mode="front-cover"/>

      <fo:page-sequence format="i" master-reference="all-pages">

        <fo:static-content flow-name="xsl-region-before" font-family="serif" font-size="9pt" text-align-last="justify">
          <fo:block>
            Table of Contents<fo:leader/><fo:page-number/>
          </fo:block>
        </fo:static-content>

        <fo:static-content color="gray" flow-name="xsl-region-after" font-family="serif" font-size="9pt" text-align-last="justify">
          <fo:block>
            <fo:external-graphic content-height="12pt" src="url('http://ica-atom.org/images/ica-atom-logo-1_0.png')"/><fo:leader/>Brought to you by <fo:external-graphic content-height="12pt" src="url('http://artefactual.com/images/logo.png')"/>
          </fo:block>
        </fo:static-content>

        <fo:flow flow-name="xsl-region-body" font-family="serif">

          <fo:block font-family="Arial, sans-serif" font-size="24pt" space-after="1in" space-after.conditionality="retain" space-before="1in" space-before.conditionality="retain" span="all">
            Table of Contents
          </fo:block>

          <fo:list-block color="#069" font-family="Arial, sans-serif" font-weight="bold" leader-pattern="dots" leader-pattern-width=".5em">
            <apply-templates mode="table-of-contents"/>
          </fo:list-block>

        </fo:flow>

      </fo:page-sequence>

      <fo:page-sequence initial-page-number="1" master-reference="all-pages">

        <fo:static-content flow-name="xsl-region-before" font-family="serif" font-size="9pt" text-align-last="justify">
          <fo:block>
            <fo:retrieve-marker retrieve-class-name="heading"/><fo:leader/><fo:page-number/>
          </fo:block>
        </fo:static-content>

        <fo:static-content color="gray" flow-name="xsl-region-after" font-family="serif" font-size="9pt" text-align-last="justify">
          <fo:block>
            <fo:external-graphic content-height="12pt" src="url('http://ica-atom.org/images/ica-atom-logo-1_0.png')"/><fo:leader/>Brought to you by <fo:external-graphic content-height="12pt" src="url('http://artefactual.com/images/logo.png')"/>
          </fo:block>
        </fo:static-content>

        <fo:flow flow-name="xsl-region-body" font-family="serif" text-align="justify">
          <apply-templates/>
        </fo:flow>

      </fo:page-sequence>

      <apply-templates mode="glossary"/>

    </fo:root>
  </template>

  <template match="html:a[@href]">
    <fo:basic-link external-destination="{@href}">
      <apply-templates/>
    </fo:basic-link>
  </template>

  <template match="html:h">
    <fo:block font-size="24pt" space-after="1in" space-after.conditionality="retain" space-before="1in" space-before.conditionality="retain" span="all">
      <apply-templates/>
    </fo:block>
  </template>

  <template match="html:h1">

    <fo:marker marker-class-name="heading">
      Chapter <number/>: <apply-templates/>
    </fo:marker>

    <fo:block font-family="Arial, sans-serif" font-size="24pt" space-after="1in" space-after.conditionality="retain" space-before="1in" space-before.conditionality="retain" span="all">

      <fo:block font-size="14pt" space-after=".5em" space-before=".5em">
        Chapter <number/>
      </fo:block>

      <fo:block>
        <apply-templates/>
      </fo:block>

    </fo:block>

  </template>

  <template match="html:h2">
    <fo:block color="#069" font-family="Arial, sans-serif" font-size="14pt" id="{generate-id()}">
      <apply-templates/>
    </fo:block>
  </template>

  <template match="html:img">
    <fo:external-graphic src="url('{resolve-uri(@src, base-uri())}')"/>
  </template>

  <template match="html:p">
    <fo:block space-after=".5em" space-before=".5em">
      <apply-templates/>
    </fo:block>
  </template>

  <template match="html:script"/>

  <template match="html:section">
    <fo:block break-after="page" break-before="page" id="{generate-id()}">
      <apply-templates/>
    </fo:block>
  </template>

  <template match="html:section//html:section">
    <fo:block id="{generate-id()}" space-after=".5in" space-before=".5in">
      <apply-templates/>
    </fo:block>
  </template>

  <template match="html:section//html:section//html:h1">
    <fo:block color="#069" font-family="Arial, sans-serif" font-size="18pt" space-after="1em" space-before="1em">
      <apply-templates/>
    </fo:block>
  </template>

  <template match="html:ul">
    <fo:list-block space-after=".5em" space-before=".5em">
      <apply-templates/>
    </fo:list-block>
  </template>

  <template match="html:ul//html:li">
    <fo:list-item>

      <fo:list-item-label start-indent="1em">
        <fo:block>
          &#x2022;
        </fo:block>
      </fo:list-item-label>

      <fo:list-item-body end-indent="2em" start-indent="2em">
        <fo:block>
          <apply-templates/>
        </fo:block>
      </fo:list-item-body>

    </fo:list-item>
  </template>

  <template match="id('jump-to-nav')"/>

  <template match="id('siteSub')"/>

  <template match="id('toc')"/>

  <template match="*[contains(concat(' ', @class, ' '), ' front-cover ')]"/>

  <template match="*[contains(concat(' ', @class, ' '), ' glossary ')]"/>

  <template match="*[contains(concat(' ', @class, ' '), ' glossary ')]//html:h1">

    <fo:marker marker-class-name="heading">
      <apply-templates/>
    </fo:marker>

    <fo:block font-size="24pt" space-after="1in" space-after.conditionality="retain" space-before="1in" space-before.conditionality="retain" span="all">
      <apply-templates/>
    </fo:block>

  </template>

  <template match="*[contains(concat(' ', @class, ' '), ' image ')]">
    <fo:block>
      <fo:external-graphic content-height="4in" content-width="4in" src="url('{resolve-uri(document(@href)/id('file')//html:img/@src, resolve-uri(@href, base-uri()))}')"/>
    </fo:block>
  </template>

  <template match="*[contains(concat(' ', @class, ' '), ' magnify ')]"/>

  <template match="*[contains(concat(' ', @class, ' '), ' printfooter ')]"/>

  <template match="*[contains(concat(' ', @class, ' '), ' thumb ')]">
    <!-- TODO Use fo:float, http://wiki.apache.org/xmlgraphics-fop/GoogleSummerOfCode2006/FloatsImplementationProgress/ImplementingSideFloats -->
    <fo:block keep-together="always" space-after="1em" space-before="1em">
      <apply-templates/>
    </fo:block>
  </template>

  <template match="*[contains(concat(' ', @class, ' '), ' thumbcaption ')]">
    <fo:block font-style="italic">
      Figure <number/>. <apply-templates/>
    </fo:block>
  </template>

  <!-- Bookmark tree -->

  <template match="text()" mode="bookmark-tree"/>

  <template match="html:h1" mode="bookmark-tree">
    <fo:bookmark-title>
      <apply-templates/>
    </fo:bookmark-title>
  </template>

  <template match="html:h2" mode="bookmark-tree">
    <fo:bookmark internal-destination="{generate-id()}">
      <fo:bookmark-title>
        <apply-templates/>
      </fo:bookmark-title>
    </fo:bookmark>
  </template>

  <template match="html:section" mode="bookmark-tree">
    <fo:bookmark internal-destination="{generate-id()}">
      <apply-templates mode="bookmark-tree"/>
    </fo:bookmark>
  </template>

  <template match="*[contains(concat(' ', @class, ' '), ' front-cover ')]" mode="bookmark-tree"/>

  <!-- Front cover -->

  <template match="text()" mode="front-cover"/>

  <template match="*[contains(concat(' ', @class, ' '), ' front-cover ')]" mode="front-cover">
    <fo:page-sequence format="i" master-reference="all-pages">
      <fo:flow flow-name="xsl-region-body" text-align="center">
        <fo:block break-after="page" break-before="page" id="{generate-id()}">
          <apply-templates/>
        </fo:block>
      </fo:flow>
    </fo:page-sequence>
  </template>

  <!-- Glossary -->

  <template match="text()" mode="glossary"/>

  <template match="*[contains(concat(' ', @class, ' '), ' glossary ')]" mode="glossary">
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
          <apply-templates/>
        </fo:block>
      </fo:flow>

    </fo:page-sequence>
  </template>

  <!-- Table of contents -->

  <template match="text()" mode="table-of-contents"/>

  <template match="html:section" mode="table-of-contents">
    <fo:list-item space-after="1em" space-before="1em">

      <fo:list-item-label start-indent="1em">
        <fo:block>
          <number/>.
        </fo:block>
      </fo:list-item-label>

      <fo:list-item-body end-indent="2em" start-indent="2em">

        <fo:block text-align-last="justify">
          <fo:basic-link internal-destination="{generate-id()}">
            <apply-templates mode="table-of-contents.heading"/><fo:leader/><fo:page-number-citation ref-id="{generate-id()}"/>
          </fo:basic-link>
        </fo:block>

        <fo:block color="#000" font-family="serif" font-weight="normal" leader-pattern="space">
          <apply-templates mode="table-of-contents"/>
        </fo:block>

      </fo:list-item-body>

    </fo:list-item>
  </template>

  <template match="html:section//html:section" mode="table-of-contents">
    <fo:block text-align-last="justify">
      <fo:basic-link internal-destination="{generate-id()}">
        <apply-templates mode="table-of-contents.heading"/><fo:leader/><fo:page-number-citation ref-id="{generate-id()}"/>
      </fo:basic-link>
    </fo:block>
  </template>

  <template match="*[contains(concat(' ', @class, ' '), ' front-cover ')]" mode="table-of-contents"/>

  <template match="text()" mode="table-of-contents.heading"/>

  <template match="html:section" mode="table-of-contents.heading"/>

  <template match="html:h1" mode="table-of-contents.heading">
    <apply-templates/>
  </template>

</stylesheet>
