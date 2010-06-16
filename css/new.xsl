<?xml version="1.0" encoding="UTF-8"?>
<stylesheet version="1.0" xmlns="http://www.w3.org/1999/XSL/Transform">

  <template match="@*|node()">
    <copy>
      <apply-templates select="@*|node()"/>
    </copy>
  </template>

  <!-- TODO Use idref()? http://thread.gmane.org/gmane.text.xml.xsl.general.mulberrytech/80527 -->

  <template match="*[contains(concat(' ', @class, ' '), ' glossary ')]//*[@xml:id][not(//@href[starts-with(normalize-space(.), '#')][current()/@xml:id = substring-after(., '#')])]">
    <copy>

      <apply-templates select="@*"/>

      <!-- Append to @class -->

      <attribute name="class">
        <value-of select="@class"/> new
      </attribute>

      <apply-templates select="node()"/>

    </copy>
  </template>

</stylesheet>
