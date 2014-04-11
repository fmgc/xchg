<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="xml" indent="yes" encoding = "utf-8"/>

	<xsl:template match = "/BIF">
		<ProbModelXML formatVersion = "0.2.0">
			<Comment>
				<Conversion
					sourceformat = "XMLBIF" sourceversion = "{@VERSION}"
					sourcename = "{NETWORK/NAME}"  />
			</Comment>
			<xsl:apply-templates select="NETWORK"/>
		</ProbModelXML>
	</xsl:template>

	<xsl:template match = "NETWORK">
		<ProbNet type = "BayesianNetwork">
			<Variables>
				<xsl:apply-templates select = "VARIABLE"/>
			</Variables>
			<Links>
				<xsl:apply-templates select = "DEFINITION/GIVEN"/>
			</Links>
			<Potentials>
				<xsl:apply-templates select = "DEFINITION/TABLE"/>
			</Potentials>
		</ProbNet>
	</xsl:template>

	<xsl:template match = "VARIABLE">
		<Variable name = "{NAME}" type = "finiteStates" role = "chance" isInput = "false">
			<States>
				<xsl:apply-templates select = "OUTCOME" />
			</States>
			<xsl:apply-templates select = "./PROPERTY" />
		</Variable>
	</xsl:template>

	<xsl:template match = "OUTCOME">
		<State name = "{.}">
		</State>
	</xsl:template>

	<xsl:template match = "DEFINITION/GIVEN">
		<Link directed = "true">
			<Variable name = "{.}">
			</Variable>
			<Variable name = "{../FOR}">
			</Variable>
		</Link>
	</xsl:template>

	<xsl:template match = "DEFINITION/TABLE">
		<Potential type = "Table" role = "conditionalProbability">
			<Variables>
				<Variable name = "{../FOR}">
				</Variable>
				<xsl:for-each select = "../GIVEN">
					<xsl:sort select="position()" data-type="number" order="descending"/>
					<Variable name = "{.}">
					</Variable>
				</xsl:for-each>
			</Variables>			
			<Values>
				<xsl:value-of select = "translate(.,'&#xA;', '')" />
			</Values>
		</Potential>
	</xsl:template>

	<xsl:template match = "VARIABLE/PROPERTY">
		<Coordinates x = "{substring-before(substring-after(.,'('),',')}" y = "{substring-before(substring-after(.,','),')')}">
		</Coordinates>
	</xsl:template>

</xsl:stylesheet>
