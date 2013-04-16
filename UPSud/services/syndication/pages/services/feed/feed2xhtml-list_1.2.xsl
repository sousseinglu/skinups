<?xml version="1.0" encoding="UTF-8"?>
<!--
   Copyright 2012 Anyware Services

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
   -->
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
        xmlns:resolver="org.ametys.cms.transformation.xslt.ResolveURIComponent"
		xmlns:ametys="org.ametys.web.transformation.xslt.AmetysXSLTHelper"
        extension-element-prefixes="resolver">
	
    <xsl:import href="service:web://pages/services/common.xsl"/>
    
	<xsl:param name="header" select="ametys:serviceParameter('header')"/>

    <!-- Used in common.xsl -->
    <xsl:variable name="common-service-css-class-name">syndication</xsl:variable>
    <xsl:variable name="is-empty" select="not(/feed)"/>
    <xsl:variable name="common-service-name">service-syndication list</xsl:variable>    


    <xsl:variable name="raw-is-title-visible">        
    	<xsl:call-template name="common-service-head-title-content">
            <xsl:with-param name="title" select="$header"/>                    
        </xsl:call-template>
    </xsl:variable>    
    <xsl:variable name="is-title-visible" select="string-length($raw-is-title-visible) &gt; 0"/>
  

    <!-- +
         | HEAD
         + -->

    <!-- Used in common.xsl -->
    <xsl:template name="common-service-head-title">
        <xsl:call-template name="common-service-head-title-content">
            <xsl:with-param name="title" select="$header"/>                    
        </xsl:call-template>
    </xsl:template> 
    
    <!-- Used in common.xsl -->
    <xsl:template name="common-service-head-css">
        <link rel="stylesheet" type="text/css" href="{ametys:skinURL('css/services/feed-list.css')}" media="screen, print, handheld"/>    
    </xsl:template>      

<!-- +
         | BODY
         + -->    

    <!-- Used in common.xsl --> 
    <xsl:template name="common-service-body-nonempty-content-title">
        <xsl:call-template name="common-service-body-nonempty-content-title-content">
            <xsl:with-param name="title" select="$header"/>
        </xsl:call-template>
    </xsl:template>
    
    <!-- Used in common.xsl -->
    <xsl:template name="common-service-body-nonempty-content-content">
		<xsl:apply-templates select="image"/>
		
        <xsl:call-template name="syndication-title"/>
        
        <xsl:call-template name="syndication-description"/>
        
        <xsl:call-template name="syndication-list"/>
    </xsl:template>
    
    <!-- Template for the general title -->    
    <xsl:template name="syndication-title">
   		<xsl:choose>
   			<xsl:when test="$is-title-visible">
   				<p class="rss-title"><xsl:value-of select="/feed/@title"/></p>
   			</xsl:when>
   			<xsl:otherwise>
   				<h1 class="rss-title"><xsl:value-of select="/feed/@title"/></h1>
   			</xsl:otherwise>
   		</xsl:choose>
    </xsl:template>        

    <!-- Template for the description -->
    <xsl:template name="syndication-description">
        <p class="description"><xsl:value-of select="/feed/@description"/></p>    
    </xsl:template>
    
    <!-- Template for the list -->
    <xsl:template name="syndication-list">
        <ul>
            <xsl:apply-templates select="/feed/entry"/>
        </ul>    
    </xsl:template>    
            
    <!-- Template for each item -->    
    <xsl:template match="entry"> 
        <li>
            <xsl:attribute name="class"><xsl:call-template name="common-utils-class"/></xsl:attribute>
            
            <!-- Image -->
            <xsl:choose>
                <xsl:when test="@url">
                    <img src="{@url}" alt="{@title}" class="feed-image" width="90px" height="60px"/>
                </xsl:when>
                <xsl:when test="enclosure">
                    <xsl:for-each select="enclosure[@url]">
                        <xsl:if test="@url and starts-with(@type, 'image')">
                            <img src="{@url}" alt="{@name}" class="feed-image" width="90px" height="60px"/>
                        </xsl:if>
                    </xsl:for-each>                
                </xsl:when>
            </xsl:choose>

            <xsl:call-template name="item-title"/>

            <xsl:call-template name="item-date"/>
            
            <xsl:call-template name="item-description"/>
        </li>
    </xsl:template>      
    

    <!-- Template for the title -->
    <xsl:template name="item-title">
    	<h2>
            <xsl:choose>
                <xsl:when test="@link">
                    <a href="{@link}"><xsl:value-of select="@title"/></a>
                </xsl:when>
                <xsl:otherwise>
                	<xsl:value-of select="@title"/></xsl:otherwise>
            </xsl:choose>
        </h2>
    </xsl:template>
    
    <!-- Template for the date -->
    <xsl:template name="item-date">    
        <xsl:if test="@date">
            <p class="date">
                <i18n:date src-pattern="yyyy-MM-dd'T'HH:mm" pattern="medium"><xsl:value-of select="@date"/></i18n:date>
                <xsl:text> </xsl:text>
                <i18n:time src-pattern="yyyy-MM-dd'T'HH:mm" pattern="short"><xsl:value-of select="@date"/></i18n:time>
            </p>
        </xsl:if>
    </xsl:template>


    <!-- Template for the description -->
    <xsl:template name="item-description">  
        <xsl:if test="description">
            <p class="description">
                <xsl:choose>
                    <xsl:when test="'text/html'">
                        <xsl:value-of select="description" disable-output-escaping="yes"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="description"/>
                    </xsl:otherwise>
                </xsl:choose>
            </p>
        </xsl:if>    
    </xsl:template>      
           
</xsl:stylesheet>		
