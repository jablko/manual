<?xml version="1.0" encoding="UTF-8"?>
<stylesheet version="1.0" xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:html="http://www.w3.org/1999/xhtml">

  <template match="@*|node()">
    <copy>
      <apply-templates select="@*|node()"/>
    </copy>
  </template>

  <template match="html:body">
    <copy>

      <apply-templates mode="front-cover"/>

      <apply-templates mode="contributors"/>

      <html:section class="table-of-contents">

        <html:h>Table of Contents</html:h>

        <html:ol>
          <apply-templates mode="table-of-contents"/>
        </html:ol>

      </html:section>

      <apply-templates select="@*|node()"/>

    </copy>
  </template>

  <template match="html:section">
    <copy>

      <apply-templates select="@*"/>

      <!-- Override @id -->

      <attribute name="id">
        <value-of select="replace(base-uri(), '.*[/=]', '')"/>
      </attribute>

      <apply-templates select="node()"/>

    </copy>
  </template>

  <template match="html:section[base-uri(current()) = base-uri()]//html:section">
    <copy>

      <apply-templates select="@*"/>

      <!-- Override @id -->

      <attribute name="id">
        <value-of select="concat(replace(base-uri(), '.*[/=]', ''), '/', @id)"/>
      </attribute>

      <apply-templates select="node()"/>

    </copy>
  </template>

  <template match="*[contains(concat(' ', @class, ' '), ' contributors ')]"/>

  <template match="*[contains(concat(' ', @class, ' '), ' front-cover ')]"/>

  <template match="*[contains(concat(' ', @class, ' '), ' image ')]//html:img/@src">
    <attribute name="src">
      <value-of select="resolve-uri(document(ancestor::*[contains(concat(' ', @class, ' '), ' image ')]/@href)/id('file')//html:img/@src, resolve-uri(ancestor::*[contains(concat(' ', @class, ' '), ' image ')]/@href, base-uri()))"/>
    </attribute>
  </template>

  <!-- Likewise use substring-before() -->

  <template match="*[@href[//*[contains(concat(' ', @class, ' '), ' glossary ')]//*[substring-before(concat(resolve-uri(current()/@href, base-uri(current())), '#'), '#') = base-uri()]]]">
    <copy>

      <apply-templates select="@*"/>

      <!-- Append to @rel -->

      <attribute name="rel">
        <value-of select="@rel"/> glossary
      </attribute>

      <apply-templates select="node()"/>

    </copy>
  </template>

  <!-- Use substring-before() because neither OpenJDK 6 nor SAXON 9.2 resolve empty strings conformingly, http://thread.gmane.org/gmane.comp.java.openjdk.net.devel/1536, http://thread.gmane.org/gmane.text.xml.saxon.help/11638 -->

  <template match="@href[//*[substring-before(concat(resolve-uri(current(), base-uri(current())), '#'), '#') = base-uri()]]">
    <attribute name="href">
      #<value-of select="replace(replace(., '.*[/=]', ''), '#', '/')"/>
    </attribute>
  </template>

  <!-- Contributors -->

  <template match="text()" mode="contributors"/>

  <template match="*[contains(concat(' ', @class, ' '), ' contributors ')]" mode="contributors">
    <copy>
      <apply-templates select="@*|node()"/>
    </copy>
  </template>

  <!-- Front cover -->

  <template match="text()" mode="front-cover"/>

  <template match="*[contains(concat(' ', @class, ' '), ' front-cover ')]" mode="front-cover">
    <copy>
      <apply-templates select="@*|node()"/>
    </copy>
  </template>

  <!-- Table of contents -->

  <template match="text()" mode="table-of-contents"/>

  <template match="html:section" mode="table-of-contents">
    <html:li>

      <apply-templates select="@*"/>

      <html:a href="#{replace(base-uri(), '.*[/=]', '')}">
        <apply-templates mode="table-of-contents.heading"/>
      </html:a>

      <if test=".//html:section">
        <html:ol>
          <apply-templates mode="table-of-contents"/>
        </html:ol>
      </if>

    </html:li>
  </template>

  <template match="html:section[base-uri(current()) = base-uri()]//html:section" mode="table-of-contents">
    <html:li>

      <apply-templates select="@*"/>

      <html:a href="#{replace(base-uri(), '.*[/=]', '')}/{@id}">
        <apply-templates mode="table-of-contents.heading"/>
      </html:a>

      <if test=".//html:section">
        <html:ol>
          <apply-templates mode="table-of-contents"/>
        </html:ol>
      </if>

    </html:li>
  </template>

  <template match="*[contains(concat(' ', @class, ' '), ' contributors ')]" mode="table-of-contents"/>

  <template match="*[contains(concat(' ', @class, ' '), ' front-cover ')]" mode="table-of-contents"/>

  <template match="text()" mode="table-of-contents.heading"/>

  <template match="html:h1|html:h2|html:h3|html:h4|html:h5|html:h6" mode="table-of-contents.heading">
    <apply-templates/>
  </template>

  <template match="html:section" mode="table-of-contents.heading"/>

</stylesheet>
