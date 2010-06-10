<?xml version="1.0" encoding="UTF-8"?>
<stylesheet version="1.0" xmlns="http://www.w3.org/1999/XSL/Transform" xmlns:html="http://www.w3.org/1999/xhtml">

  <template match="@*|node()">

    <copy>
      <apply-templates select="@*|node()[1]"/>
    </copy>

    <apply-templates select="following-sibling::node()[1]"/>

  </template>

  <template match="html:h1">

    <html:section>

      <apply-templates select="@id"/>

      <copy>
        <apply-templates select="@*|node()[1]"/>
      </copy>

      <apply-templates select="following-sibling::node()[1]" mode="h1"/>

    </html:section>

    <apply-templates select="following-sibling::html:h1[1]"/>

  </template>

  <template match="html:h2">

    <html:section>

      <apply-templates select="@id"/>

      <copy>
        <apply-templates select="@*|node()[1]"/>
      </copy>

      <apply-templates select="following-sibling::node()[1]" mode="h2"/>

    </html:section>

    <apply-templates select="following-sibling::*[self::html:h1|self::html:h2][1]"/>

  </template>

  <template match="html:h3">

    <html:section>

      <apply-templates select="@id"/>

      <copy>
        <apply-templates select="@*|node()[1]"/>
      </copy>

      <apply-templates select="following-sibling::node()[1]" mode="h3"/>

    </html:section>

    <apply-templates select="following-sibling::*[self::html:h1|self::html:h2|self::html:h3][1]"/>

  </template>

  <template match="html:h4">

    <html:section>

      <apply-templates select="@id"/>

      <copy>
        <apply-templates select="@*|node()[1]"/>
      </copy>

      <apply-templates select="following-sibling::node()[1]" mode="h4"/>

    </html:section>

    <apply-templates select="following-sibling::*[self::html:h1|self::html:h2|self::html:h3|self::html:h4][1]"/>

  </template>

  <template match="html:h5">

    <html:section>

      <apply-templates select="@id"/>

      <copy>
        <apply-templates select="@*|node()[1]"/>
      </copy>

      <apply-templates select="following-sibling::node()[1]" mode="h5"/>

    </html:section>

    <apply-templates select="following-sibling::*[self::html:h1|self::html:h2|self::html:h3|self::html:h4|self::html:h4|self::html:h5][1]"/>

  </template>

  <template match="html:h6">

    <html:section>

      <apply-templates select="@id"/>

      <copy>
        <apply-templates select="@*|node()[1]"/>
      </copy>

      <apply-templates select="following-sibling::node()[1]" mode="h6"/>

    </html:section>

    <apply-templates select="following-sibling::*[self::html:h1|self::html:h2|self::html:h3|self::html:h4][1]"/>

  </template>

  <!-- h1 -->

  <template match="@*|node()" mode="h1">

    <copy>
      <apply-templates select="@*|node()[1]"/>
    </copy>

    <apply-templates select="following-sibling::node()[1]" mode="h1"/>

  </template>

  <template match="html:h1" mode="h1"/>

  <template match="html:h2" mode="h1">

    <html:section>

      <apply-templates select="@id"/>

      <copy>
        <apply-templates select="@*|node()[1]"/>
      </copy>

      <apply-templates select="following-sibling::node()[1]" mode="h2"/>

    </html:section>

    <apply-templates select="(following-sibling::html:h1|following-sibling::html:h2)[1]" mode="h1"/>

  </template>

  <template match="html:h3" mode="h1">

    <html:section>

      <apply-templates select="@id"/>

      <copy>
        <apply-templates select="@*|node()[1]"/>
      </copy>

      <apply-templates select="following-sibling::node()[1]" mode="h3"/>

    </html:section>

    <apply-templates select="following-sibling::*[self::html:h2|self::html:h3][1]" mode="h1"/>

  </template>

  <template match="html:h4" mode="h1">

    <html:section>

      <apply-templates select="@id"/>

      <copy>
        <apply-templates select="@*|node()[1]"/>
      </copy>

      <apply-templates select="following-sibling::node()[1]" mode="h4"/>

    </html:section>

    <apply-templates select="following-sibling::*[self::html:h2|self::html:h3|self::html:h4][1]" mode="h1"/>

  </template>

  <template match="html:h5" mode="h1">

    <html:section>

      <apply-templates select="@id"/>

      <copy>
        <apply-templates select="@*|node()[1]"/>
      </copy>

      <apply-templates select="following-sibling::node()[1]" mode="h5"/>

    </html:section>

    <apply-templates select="following-sibling::*[self::html:h2|self::html:h3|self::html:h4|self::html:h5][1]" mode="h1"/>

  </template>

  <template match="html:h6" mode="h1">

    <html:section>

      <apply-templates select="@id"/>

      <copy>
        <apply-templates select="@*|node()[1]"/>
      </copy>

      <apply-templates select="following-sibling::node()[1]" mode="h6"/>

    </html:section>

    <apply-templates select="following-sibling::*[self::html:h2|self::html:h3|self::html:h4|self::html:h5|self::html:h6][1]" mode="h1"/>

  </template>

  <!-- h2 -->

  <template match="@*|node()" mode="h2">

    <copy>
      <apply-templates select="@*|node()[1]"/>
    </copy>

    <apply-templates select="following-sibling::node()[1]" mode="h2"/>

  </template>

  <template match="html:h1|html:h2" mode="h2"/>

  <template match="html:h3" mode="h2">

    <html:section>

      <apply-templates select="@id"/>

      <copy>
        <apply-templates select="@*|node()[1]"/>
      </copy>

      <apply-templates select="following-sibling::node()[1]" mode="h3"/>

    </html:section>

    <apply-templates select="(following-sibling::html:h1|following-sibling::html:h2|following-sibling::html:h3)[1]" mode="h2"/>

  </template>

  <template match="html:h4" mode="h2">

    <html:section>

      <apply-templates select="@id"/>

      <copy>
        <apply-templates select="@*|node()[1]"/>
      </copy>

      <apply-templates select="following-sibling::node()[1]" mode="h4"/>

    </html:section>

    <apply-templates select="following-sibling::*[self::html:h3|self::html:h4][1]" mode="h2"/>

  </template>

  <template match="html:h5" mode="h2">

    <html:section>

      <apply-templates select="@id"/>

      <copy>
        <apply-templates select="@*|node()[1]"/>
      </copy>

      <apply-templates select="following-sibling::node()[1]" mode="h5"/>

    </html:section>

    <apply-templates select="following-sibling::*[self::html:h3|self::html:h4|self::html:h5][1]" mode="h2"/>

  </template>

  <template match="html:h6" mode="h2">

    <html:section>

      <apply-templates select="@id"/>

      <copy>
        <apply-templates select="@*|node()[1]"/>
      </copy>

      <apply-templates select="following-sibling::node()[1]" mode="h6"/>

    </html:section>

    <apply-templates select="following-sibling::*[self::html:h3|self::html:h4|self::html:h5|self::html:h6][1]" mode="h2"/>

  </template>

  <!-- h3 -->

  <template match="@*|node()" mode="h3">

    <copy>
      <apply-templates select="@*|node()[1]"/>
    </copy>

    <apply-templates select="following-sibling::node()[1]" mode="h3"/>

  </template>

  <template match="html:h1|html:h2|html:h3" mode="h3"/>

  <template match="html:h4" mode="h3">

    <html:section>

      <apply-templates select="@id"/>

      <copy>
        <apply-templates select="@*|node()[1]"/>
      </copy>

      <apply-templates select="following-sibling::node()[1]" mode="h4"/>

    </html:section>

    <apply-templates select="(following-sibling::html:h1|following-sibling::html:h2|following-sibling::html:h3|following-sibling::html:h4)[1]" mode="h3"/>

  </template>

  <template match="html:h5" mode="h3">

    <html:section>

      <apply-templates select="@id"/>

      <copy>
        <apply-templates select="@*|node()[1]"/>
      </copy>

      <apply-templates select="following-sibling::node()[1]" mode="h5"/>

    </html:section>

    <apply-templates select="following-sibling::*[self::html:h4|self::html:h5][1]" mode="h3"/>

  </template>

  <template match="html:h6" mode="h3">

    <html:section>

      <apply-templates select="@id"/>

      <copy>
        <apply-templates select="@*|node()[1]"/>
      </copy>

      <apply-templates select="following-sibling::node()[1]" mode="h6"/>

    </html:section>

    <apply-templates select="following-sibling::*[self::html:h4|self::html:h5|self::html:h6][1]" mode="h3"/>

  </template>

  <!-- h4 -->

  <template match="@*|node()" mode="h4">

    <copy>
      <apply-templates select="@*|node()[1]"/>
    </copy>

    <apply-templates select="following-sibling::node()[1]" mode="h4"/>

  </template>

  <template match="html:h1|html:h2|html:h3|html:h4" mode="h4"/>

  <template match="html:h5" mode="h4">

    <html:section>

      <apply-templates select="@id"/>

      <copy>
        <apply-templates select="@*|node()[1]"/>
      </copy>

      <apply-templates select="following-sibling::node()[1]" mode="h5"/>

    </html:section>

    <apply-templates select="(following-sibling::html:h1|following-sibling::html:h2|following-sibling::html:h3|following-sibling::html:h4|following-sibling::html:h5)[1]" mode="h4"/>

  </template>

  <template match="html:h6" mode="h4">

    <html:section>

      <apply-templates select="@id"/>

      <copy>
        <apply-templates select="@*|node()[1]"/>
      </copy>

      <apply-templates select="following-sibling::node()[1]" mode="h6"/>

    </html:section>

    <apply-templates select="following-sibling::*[self::html:h5|self::html:h6][1]" mode="h4"/>

  </template>

  <!-- h5 -->

  <template match="@*|node()" mode="h5">

    <copy>
      <apply-templates select="@*|node()[1]"/>
    </copy>

    <apply-templates select="following-sibling::node()[1]" mode="h5"/>

  </template>

  <template match="html:h1|html:h2|html:h3|html:h4|html:h5" mode="h5"/>

  <template match="html:h6" mode="h5">

    <html:section>

      <apply-templates select="@id"/>

      <copy>
        <apply-templates select="@*|node()[1]"/>
      </copy>

      <apply-templates select="following-sibling::node()[1]" mode="h6"/>

    </html:section>

    <apply-templates select="(following-sibling::html:h1|following-sibling::html:h2|following-sibling::html:h3|following-sibling::html:h4|following-sibling::html:h5|following-sibling::html:h6)[1]" mode="h5"/>

  </template>

  <!-- h6 -->

  <template match="@*|node()" mode="h6">

    <copy>
      <apply-templates select="@*|node()[1]"/>
    </copy>

    <apply-templates select="following-sibling::node()[1]" mode="h6"/>

  </template>

  <template match="html:h1|html:h2|html:h3|html:h4|html:h5|html:h6" mode="h6"/>

</stylesheet>
