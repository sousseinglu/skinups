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
		xmlns:ametys="org.ametys.web.transformation.xslt.AmetysXSLTHelper">
	
	<xsl:import href="plugin:newsletter://pages/services/list/list_1.4.xsl"/>		
    
    <!-- Used in common.xsl -->
    <xsl:template name="common-service-head-css">
        <link rel="stylesheet" type="text/css" href="{ametys:skinURL('css/services/newsletter.css')}" media="screen, print, handheld"/>    
    </xsl:template> 
		
    <!-- Template for the rss link -->
    <xsl:template name="rss">
        <xsl:if test="/Newsletters/rss/@url">
            <div class="rss">
                <a href="{$uri-prefix}/{/Newsletters/rss/@url}">
                    <img title="NEWSLETTERS_SERVICE_LIST_RSS_FEED_TITLE" alt="NEWSLETTERS_SERVICE_LIST_RSS_FEED_ALT" i18n:attr="title alt" src="{ametys:skinURL('img/rssicon.png')}"/>
                </a>
            </div>
        </xsl:if>           
    </xsl:template>   
</xsl:stylesheet>		
