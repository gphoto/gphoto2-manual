<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

  <!--xsl:import href="../../../../../../../usr/share/sgml/docbook/stylesheet/xsl/nwalsh/html/docbook.xsl"/-->
  <xsl:import href="docbook-params.xsl"/>

  <xsl:template name="gphoto2-replace-string">
    <xsl:param name="content" select="''"/>
    <xsl:param name="replace" select="''"/>
    <xsl:param name="with" select="''"/>
    <xsl:choose>
      <xsl:when test="not(contains($content,$replace))">
	<xsl:value-of select="$content"/>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="substring-before($content,$replace)"/>
	<xsl:value-of select="$with"/>
	<xsl:call-template name="gphoto2-replace-string">
	  <xsl:with-param name="content"><xsl:value-of select="substring-after($content,$replace)"/></xsl:with-param>
	  <xsl:with-param name="replace"><xsl:value-of select="$replace"/></xsl:with-param>
	  <xsl:with-param name="with"><xsl:value-of select="$with"/></xsl:with-param>
	</xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="gphoto2-obfuscate-email-address">
    <xsl:param name="email-address"/>
    <xsl:variable name="at">
      <xsl:call-template name="gphoto2-replace-string">
	<xsl:with-param name="content"><xsl:value-of select="$email-address"/></xsl:with-param>
	<xsl:with-param name="replace">@</xsl:with-param>
	<xsl:with-param name="with"> at </xsl:with-param>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="dot">
      <xsl:call-template name="gphoto2-replace-string">
	<xsl:with-param name="content"><xsl:value-of select="$at"/></xsl:with-param>
	<xsl:with-param name="replace">.</xsl:with-param>
	<xsl:with-param name="with"> dot </xsl:with-param>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="plus">
      <xsl:call-template name="gphoto2-replace-string">
	<xsl:with-param name="content"><xsl:value-of select="$dot"/></xsl:with-param>
	<xsl:with-param name="replace">+</xsl:with-param>
	<xsl:with-param name="with"> plus </xsl:with-param>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="minus">
      <xsl:call-template name="gphoto2-replace-string">
	<xsl:with-param name="content"><xsl:value-of select="$plus"/></xsl:with-param>
	<xsl:with-param name="replace">-</xsl:with-param>
	<xsl:with-param name="with"> minus </xsl:with-param>
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="result" select="$minus"/>
    <xsl:value-of select="$result"/>
  </xsl:template>

  <xsl:template match="email">
    <xsl:choose>
      <xsl:when test="$obfuscate-email-address">
	<xsl:variable name="obfuscated">
	  <xsl:call-template name="gphoto2-obfuscate-email-address">
	    <xsl:with-param name="email-address"><xsl:value-of select="."/></xsl:with-param>
	  </xsl:call-template>
	</xsl:variable>
	<xsl:call-template name="inline.monoseq">
	  <xsl:with-param name="content">
	    <xsl:text>[ </xsl:text>
	    <xsl:value-of select="$obfuscated"/>
	    <xsl:text> ]</xsl:text>
	  </xsl:with-param>
	</xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
	<xsl:call-template name="inline.monoseq">
	  <xsl:with-param name="content">
	    <xsl:text>&lt;</xsl:text>
	    <a>
	      <xsl:attribute name="href">mailto:<xsl:value-of select="."/></xsl:attribute>
	      <xsl:value-of select="."/>
	    </a>
	    <xsl:text>&gt;</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!--xsl:template match="sect3/authorblurb">
    <div class="authorblurb" 
      style="left-margin:3em;right-margin:3em;top-margin:1ex;bottom-margin:1ex;">
      <xsl:apply-templates/>
    </div>
  </xsl:template-->

  <!--xsl:template match="editor/affiliation" mode="x">
    <xsl:apply-templates/>
  </xsl:template-->

  <xsl:template match="affiliation/address" mode="titlepage.mode">
    <xsl:apply-templates/>
    <xsl:text>[[]]</xsl:text>
  </xsl:template>

</xsl:stylesheet>
