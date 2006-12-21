<?xml version='1.0' encoding='utf-8'?>

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml"
  version="1.0">

  <xsl:param name="use.id.as.filename" select="1"/>

  <!--xsl:param name="paper.type" select="'USLetter'"/-->
  <xsl:param name="paper.type" select="'A4'"/>

  <!-- make valid HTML (with DTD and stuff) -->
  <xsl:param name="make.valid.html"    select="1"/>

  <!-- location of CSS stylesheet for HTML files -->
  <xsl:param name="html.stylesheet"    select="'../../styles.css'"/>
  
  <!-- use navigation graphics? -->
  <xsl:param name="navig.graphics"     select="0"/>

  <!-- automatically enumerate and label chapters/sections? -->
  <xsl:param name="chapter.autolabel"  select="1"/>
  <xsl:param name="section.autolabel"  select="1"/>

  <!-- -->
  <xsl:param name="section.label.includes.component.label" select="1"/>

  <!-- generate text in English -->
  <xsl:param name="l10n.gentext.language" select="'en'"/>

  <!-- -->
  <xsl:param name="qanda.inherit.numeration" select="1"/>

  <!-- obfuscate mail address -->
  <xsl:param name="obfuscate-email-address" select="true()"/>

  <!-- HTML page header -->
  <xsl:template name="user.header.navigation">
    <xsl:param name="node"/>
    <!-- ==================================================================
         the following <p></p> element was taken from the PHP code of the 
         gphoto2 web site (bottom of include.php)
         ================================================================== -->
    <p align="center" class="menu">
      <a href="/">Home</a> :: 
      <a href="/news">News</a> :: 
      <a href="/proj/">Projects</a> :: 
      <a href="/doc/">Documentation</a> :: 
      <a href="http://www.sf.net/projects/gphoto/">Developers</a> :: 
      <a href="/mailinglists/">Mailing lists</a> :: 
      <a href="/download/">Download</a> :: 
      <a href="/feedback/">Feedback</a> :: 
      <a href="/manufacturers/">About Manufacturers</a> :: 
      <a href="/links/">Links</a>
      <br />
      <a href="/doc/manual/">User's manual</a> ::
      <a href="/doc/api/">API</a> ::
      <a href="/doc/ptpip.php">PTP/IP</a> ::
      <a href="/doc/faq/">FAQ</a> ::
      <a href="/doc/remote/">Remote control</a>
    </p>
  </xsl:template>

</xsl:stylesheet>
