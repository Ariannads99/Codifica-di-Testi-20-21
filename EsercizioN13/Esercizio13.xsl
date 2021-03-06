<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    
    <xsl:template match="/">
        <html>
            <head>
                
                <title>
                    <xsl:value-of select="TEI/teiHeader/fileDesc/titleStmt/title" />
                </title>
                <link rel="stylesheet" type="text/css" href="./mycss.css" />
                
                <!--Uso di una variabile per lo stile di h1-->
                <xsl:variable name="style">
                    <xsl:value-of select="color:blue"></xsl:value-of>
                </xsl:variable>
            </head>
            <body>
                <div class="index">
                    <h1>INDEX
                        <xsl:attribute name="style">
                            <xsl:value-of select="$style"></xsl:value-of>
                        </xsl:attribute>
                    </h1>
                    <ul>
                        <!--Call templates-->
                        <xsl:call-templates name="esempio">
                            <with-param name="$mode"></with-param>
                        </xsl:call-templates>/>
                    </ul>
                </div>
                <div>
                    <xsl:apply-templates select="child::node()" />
                </div>
            </body>
        </html>
    </xsl:template>

    <!--Uso di parametro-->
    <xsl:template name="esempio">
        <xsl:param name="mode">mode="index"</xsl:param>
        <xsl:value-of select="//div[@type='chapter']"></xsl:value-of>
    </xsl:template>

    
    <xsl:template match="div" mode="index">
        <ul>
            <xsl:for-each select=".">
                <li>
                    <xsl:value-of select="head" />
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    <xsl:template match="titleStmt/title">
        <h2>
            <xsl:value-of select="." />
        </h2>
    </xsl:template>
    <xsl:template match="div/head">
        <h3>
            <xsl:value-of select="." />
        </h3>
    </xsl:template>

<xsl:template match="teiHeader">
    <span>[identificativo del documento: <xsl:value-of select="@xml:id" />]</span>
</xsl:template>

</xsl:stylesheet>