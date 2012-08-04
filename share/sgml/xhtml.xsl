<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE xsl:stylesheet PUBLIC "-//FreeBSD//DTD FreeBSD XSLT 1.0 DTD//EN"
"http://www.FreeBSD.org/XML/www/share/sgml/xslt10-freebsd.dtd">
<!-- $FreeBSD$ -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:cvs="http://www.FreeBSD.org/XML/CVS"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  xmlns:str="http://exslt.org/strings"
  extension-element-prefixes="str">

  <xsl:variable name="svnKeyword">
    <xsl:value-of select="//cvs:keyword[1]"/>
  </xsl:variable>

  <xsl:variable name="date">
    <xsl:value-of select="str:split($svnKeyword, ' ')[4]"/>
  </xsl:variable>

  <xsl:variable name="title">
    <xsl:value-of select="/xhtml:html/xhtml:head/xhtml:title"/>
  </xsl:variable>

  <xsl:output type="xml" encoding="&xml.encoding;"
    indent="yes"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
    doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" />

  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
	<title><xsl:value-of select="$title" /></title>
	<meta http-equiv="Content-Type" content="text/html; charset=&xml.encoding;" />
	<meta name="MSSmartTagsPreventParsing" content="TRUE" />
	<xsl:copy-of select="/xhtml:html/xhtml:head/xhtml:meta"/>
	<link rel="shortcut icon" href="&enbase;/favicon.ico" type="image/x-icon" />
	<link rel="icon" href="&enbase;/favicon.ico" type="image/x-icon" />
<!--
FOR TRANSLATORS:

Do not translate the "Normal Text" and "Large Text" attributes in the
following two lines.  They are not literal texts but JavaScript
parameters.  Changing them will result in rendering errors.
-->
	<link rel="stylesheet" media="screen" href="&stylesheet;" type="text/css" title="Normal Text" />
	<link rel="alternate stylesheet" media="screen" href="&stylesheetlarge;" type="text/css" title="Large Text" />
	&header1.rsslink;
	<script type="text/javascript" src="&enbase;/layout/js/styleswitcher.js"></script>
	&header1.googlejs;
      </head>

      <body>
	<div id="CONTAINERWRAP">
	  <div id="CONTAINER">
	    &header2.skipnav;

	    <div id="HEADERCONTAINER">
	      <div id="HEADER">

		&header2.logo-red.label;

		<div id="HEADERLOGOLEFT">
		  &header2.logo-red;
		</div> <!-- HEADERLOGOLEFT -->

		<div id="HEADERLOGORIGHT">
		  &header2.searchnav.label;

		  &header2.searchnav;

		<div id="SEARCH">
		  <form action="&cgibase;/search.cgi" method="get">
		    <div>
		      <h2 class="blockhide"><label for="WORDS">&header2.word.search;</label></h2>

		      &header2.searchinputs;
		    </div>
		  </form>
		</div> <!-- SEARCH -->
	      </div> <!-- HEADERLOGORIGHT -->
	    </div> <!-- HEADER -->

	    &header2.topnav.label;

	    &header2.topnav;

	  </div> <!-- HEADERCONTAINER -->

	  <div id="CONTENT">
	      <xsl:call-template name="process.content"/>
	    </div> <!-- CONTENT -->

	    <div id="FOOTER">
	      <xsl:call-template name="process.footer"/>
	    </div> <!-- FOOTER -->
	  </div> <!-- CONTAINER -->
	</div> <!-- CONTAINERWRAP -->
      </body>
    </html>
  </xsl:template>

  <xsl:template name="process.content">
	    <div id="SIDEWRAP">
	      <xsl:choose xmlns:xhtml="http://www.w3.org/1999/xhtml">
		<xsl:when test="xhtml:html/xhtml:body/@class = 'navinclude.about'">
		  &nav.about;
		</xsl:when>

		<xsl:when test="xhtml:html/xhtml:body/@class = 'navinclude.community'">
		  &nav.community;
		</xsl:when>

		<xsl:when test="xhtml:html/xhtml:body/@class = 'navinclude.developers'">
		  &nav.developers;
		</xsl:when>

		<xsl:when test="xhtml:html/xhtml:body/@class = 'navinclude.docs'">
		  &nav.docs;
		</xsl:when>

		<xsl:when test="xhtml:html/xhtml:body/@class = 'navinclude.download'">
		  &nav.download;
		</xsl:when>

		<xsl:when test="xhtml:html/xhtml:body/@class = 'navinclude.gnome'">
		  &nav.gnome;
		</xsl:when>

		<xsl:when test="xhtml:html/xhtml:body/@class = 'navinclude.ports'">
		  &nav.ports;
		</xsl:when>

		<xsl:when test="xhtml:html/xhtml:body/@class = 'navinclude.support'">
		  &nav.support;
		</xsl:when>
	      </xsl:choose>
	    </div> <!-- SIDEWRAP -->

	    <div id="CONTENTWRAP">
      <xsl:call-template name="process.contentwrap"/>
	    </div> <!-- CONTENTWRAP -->

	    <br class="clearboth" />
  </xsl:template>

  <xsl:template name="process.contentwrap">
    <h1><xsl:value-of select="$title" /></h1>

    <xsl:copy-of xmlns:xhtml="http://www.w3.org/1999/xhtml" select="xhtml:html/xhtml:body/*" />
  </xsl:template>

  <xsl:template name="process.footer">
    &copyright;<br/>
    &lastmod; <xsl:value-of select="$date"/>
  </xsl:template>
</xsl:stylesheet>
