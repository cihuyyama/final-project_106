<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:websoft="http://www.websoft.ru" version="1.0">
<!--
'*	101_clickarea#.xsl
'*	Copyright (c) Websoft Ltd. Russia.  All rights reserved.
-->
<xsl:output method="xml" encoding="utf-8" omit-xml-declaration="yes"/>
<xsl:param name="moduleImagesFolder"></xsl:param>
<xsl:param name="imagesFolder"></xsl:param>
<xsl:param name="objectID"></xsl:param>
<xsl:param name="width"></xsl:param>
<xsl:param name="height"></xsl:param>

<xsl:template match="/"><xsl:apply-templates select="params"/></xsl:template>

<xsl:template match="params">

	<xsl:variable name="bg-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="bg_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="border-color-fixed">
		<xsl:call-template name="fix-color">
			<xsl:with-param name="color" select="border_color"/>
		</xsl:call-template>
	</xsl:variable>
	<xsl:variable name="_borderwidth">
		<xsl:choose>
			<xsl:when test="borderstyle='none'">0</xsl:when>
			<xsl:otherwise><xsl:value-of select="borderwidth"/></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<style>
		.cl-container { width: <xsl:value-of select="$width"/>px; height: <xsl:value-of select="$height"/>px; }
		.cl-highlight { width: <xsl:value-of select="number($width)-2*number($_borderwidth)"/>px; height: <xsl:value-of select="number($height)-2*number($_borderwidth)"/>px; <xsl:if test="number(borderwidth)!=0">border-style: <xsl:value-of select="borderstyle"/>; border-width: <xsl:value-of select="borderwidth"/>px; border-color: <xsl:value-of select="$border-color-fixed"/>;</xsl:if> background-color: <xsl:value-of select="$bg-color-fixed"/>; opacity: <xsl:value-of select="0.01*number(opacity)"/>;<xsl:if test="number(radius)!=0">border-radius: <xsl:value-of select="radius"/>px;</xsl:if> }
	</style>
	<xsl:if test="preview='no'">
		<table border="0" cellspacing="0" cellpadding="0">
			<xsl:attribute name="style">position: absolute; top: 0px; left: 0px; box-sizing: border-box; width: <xsl:value-of select="$width"/>px; height: <xsl:value-of select="number($height) - 2"/>px;</xsl:attribute>
			<tr>
				<td>
					<xsl:attribute name="style">width: <xsl:value-of select="$width"/>px; height: <xsl:value-of select="number($height) - 2"/>px; border: #ccc 1px dotted; font-family: Tahoma, Arial, sans-serif; font-size:10px; color: #ccc; text-align:center;</xsl:attribute>
					<xsl:value-of select="hidden.label"/>
				</td>
		  </tr>
		</table>
	</xsl:if>
	<xsl:if test="preview='yes'">
		<div>
			<xsl:attribute name="class">clo-101_clickarea</xsl:attribute>
			<div>
				<xsl:attribute name="class">cl-container</xsl:attribute>
				<div>
					<xsl:attribute name="class">cl-highlight</xsl:attribute>
					<xsl:attribute name="id"><xsl:value-of select="$objectID"/>_HIGHLIGHT</xsl:attribute>
					<xsl:attribute name="style">display: block;</xsl:attribute>
					&#160;
				</div>
			</div>
		</div>
	</xsl:if>
	
</xsl:template>
<xsl:template name="fix-color">
	<xsl:param name="color"/>
	<xsl:choose>
		<xsl:when test="substring($color, 1, 1)='#'">
			<xsl:choose>
				<xsl:when test="string-length($color)=7"><xsl:value-of select="$color"/></xsl:when>
				<xsl:when test="string-length($color)=4">#<xsl:value-of select="substring($color, 2, 1)"/><xsl:value-of select="substring($color, 2, 1)"/><xsl:value-of select="substring($color, 3, 1)"/><xsl:value-of select="substring($color, 3, 1)"/><xsl:value-of select="substring($color, 4, 1)"/><xsl:value-of select="substring($color, 4, 1)"/></xsl:when>
				<xsl:otherwise>transparent</xsl:otherwise>
			</xsl:choose>
		</xsl:when>
		<xsl:otherwise>transparent</xsl:otherwise>
	</xsl:choose>
</xsl:template>
</xsl:stylesheet>
