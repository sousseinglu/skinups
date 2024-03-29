<?xml version="1.0" encoding="UTF-8"?>
<!--
   Copyright 2010 Anyware Services

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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
							xmlns:i18n="http://apache.org/cocoon/i18n/2.1" 
							xmlns:xalan="http://xml.apache.org/xalan"
							xmlns:sitemap="http://www.ametys.org/inputdata/sitemap/3.0"
							exclude-result-prefixes="sitemap">
							
	<xsl:variable name="sitemap-goto-page">
		<xsl:choose>
			<xsl:when test="$lang = 'en'">Go to page</xsl:when>
			<xsl:otherwise>Aller à la page</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>							
</xsl:stylesheet>