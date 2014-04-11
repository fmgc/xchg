<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" indent="yes" encoding = "utf-8"/>
	<xsl:template match = "/ProbModelXML">
		<BIF VERSION = "0.3">
			<xsl:apply-templates select = "ProbNet" />
		</BIF>
	</xsl:template>

	<xsl:template match = "ProbNet">
		<NETWORK>
			<NAME>
				<xsl:value-of select = "../Comment/Conversion/@sourcename" />
			</NAME>
			<xsl:apply-templates select = "Variables" />
			<xsl:apply-templates select = "Potentials" />
		</NETWORK>
	</xsl:template>

	<xsl:template match = "Variables">
		<xsl:apply-templates select = "Variable" />
	</xsl:template>

	<xsl:template match = "Variable">
		<VARIABLE TYPE = "nature">
			<NAME>
				<xsl:value-of select = "@name" />
			</NAME>
			<xsl:apply-templates select = "States" />
			<xsl:apply-templates select = "Coordinates" />
		</VARIABLE>
	</xsl:template>

	<xsl:template match = "States">
		<xsl:apply-templates select = "State" />
	</xsl:template>

	<xsl:template match = "State">
		<OUTCOME>
			<xsl:value-of select = "@name" />
		</OUTCOME>
	</xsl:template>

	<xsl:template match = "Coordinates">
		<PROPERTY>
			<xsl:value-of select = "concat('position = (',@x,',',@y,')')" />
		</PROPERTY>
	</xsl:template>

	<xsl:template match = "Potentials">
		<xsl:apply-templates select = "Potential" />
	</xsl:template>

	<xsl:template match = "Potential">
		<DEFINITION>
			<FOR>
				<xsl:value-of select = "./Variables/Variable[1]/@name"/>
			</FOR>
			<xsl:for-each select = "./Variables/Variable[position()>1]" >
				<xsl:sort select="position()" data-type="number" order="descending"/>
				<GIVEN>
					<xsl:value-of select = "@name" />
				</GIVEN>
			</xsl:for-each>
			<TABLE>
				<xsl:value-of select = "./Values" />
			</TABLE>
		</DEFINITION>
	</xsl:template>

</xsl:stylesheet>
