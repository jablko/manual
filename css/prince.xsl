<?xml version="1.0" encoding="UTF-8"?>
<stylesheet version="1.0" xmlns="http://www.w3.org/1999/XSL/Transform">

  <param name="base"/>

  <template match="@*|node()">
    <copy>
      <apply-templates select="@*|node()"/>
    </copy>
  </template>

  <template match="@href[starts-with(., '#')]">
    <attribute name="href">
      file:<value-of select="concat($base, .)"/>
    </attribute>
  </template>

</stylesheet>
