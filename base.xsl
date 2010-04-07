<?xml version="1.0" encoding="UTF-8"?>
<stylesheet version="1.0" xmlns="http://www.w3.org/1999/XSL/Transform">

  <param name="base"/>

  <template match="@*|node()">
    <copy>
      <apply-templates select="@*|node()"/>
    </copy>
  </template>

  <template match="/*">
    <copy>

      <if test="$base">
        <attribute name="xml:base">
          <value-of select="$base"/>
        </attribute>
      </if>

      <apply-templates select="@*|node()"/>

    </copy>
  </template>

</stylesheet>
