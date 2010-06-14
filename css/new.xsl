<?xml version="1.0" encoding="UTF-8"?>
<stylesheet version="1.0" xmlns="http://www.w3.org/1999/XSL/Transform">

  <template match="@*|node()">
    <copy>
      <apply-templates select="@*|node()"/>
    </copy>
  </template>

  <template match="*[starts-with(normalize-space(@href), '#') and not(id(substring-after(@href, '#')))]">
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
