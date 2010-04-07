<?xml version="1.0" encoding="UTF-8"?>
<stylesheet version="1.0" xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:html="http://www.w3.org/1999/xhtml">

  <template match="@*|node()">
    <copy>

      <!-- Copy @xml:base -->

      <apply-templates select="*['content' = @id]/@*"/>

      <apply-templates select="@*|node()"/>

    </copy>
  </template>

  <!-- No two elements in a document may have the same unique ID, http://www.w3.org/TR/xpath/#unique-id -->

  <template match="*['content' = @id]">
    <apply-templates mode="content"/>
  </template>

  <!-- Content -->

  <template match="text()" mode="content"/>

  <template match="html:section" mode="content">
    <apply-templates/>
  </template>

</stylesheet>
