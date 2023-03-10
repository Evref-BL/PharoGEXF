"
A GEXFWriterTest is a test class for testing the behavior of GEXFWriter
"
Class {
	#name : #GEXFWriterTest,
	#superclass : #TestCase,
	#instVars : [
		'writer'
	],
	#category : #'GEXF-Writer-Tests'
}

{ #category : #running }
GEXFWriterTest >> setUp [

	super setUp.
	writer := GEXFWriter new
]

{ #category : #tests }
GEXFWriterTest >> testEmptyGEXFDocument [

	| gexf resultString |
	gexf := GEXF new.
	resultString := String streamContents: [ :stream |
		writer on: stream.
		writer prettyPrinting.
		gexf accept: writer.
		 ].
	self assert: resultString equals: '<?xml version="1.0"?>
<gexf xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://gexf.net/1.3" version="1.3" xsi:schemaLocation="http://gexf.net/1.3 http://gexf.net/1.3/gexf.xsd"/>'
]

{ #category : #'tests - examples' }
GEXFWriterTest >> testExampleBasicGraph [

	| resultString |
	resultString := String streamContents: [ :stream | 
		                writer on: stream.
		                writer prettyPrinting.
		                GEXFExample new basicGraph accept: writer ].
	self
		assert: resultString
		equals: '<?xml version="1.0"?>
<gexf xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://gexf.net/1.3" version="1.3" xsi:schemaLocation="http://gexf.net/1.3 http://gexf.net/1.3/gexf.xsd">
    <graph mode="static" defaultedgetype="directed">
        <nodes>
            <node id="0" label="Hello"/>
            <node id="1" label="World"/>
        </nodes>
        <edges>
            <edge source="0" target="1"/>
        </edges>
    </graph>
</gexf>'
]

{ #category : #'tests - examples' }
GEXFWriterTest >> testExampleData [
	"test based on [https://gexf.net/data.html](https://gexf.net/data.html)"
	| resultString |
	resultString := String streamContents: [ :stream | 
		                writer on: stream.
		                writer prettyPrinting.
		                GEXFExample new data accept: writer ].
	self
		assert: resultString
		equals: '<?xml version="1.0"?>
<gexf xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://gexf.net/1.3" version="1.3" xsi:schemaLocation="http://gexf.net/1.3 http://gexf.net/1.3/gexf.xsd">
    <meta>
        <creator>Gephi.org</creator>
        <description>A Web network</description>
    </meta>
    <graph mode="static" defaultedgetype="directed">
        <attributes class="node">
            <attribute id="0" title="url" type="string"/>
            <attribute id="1" title="indegree" type="float"/>
            <attribute id="2" title="frog" type="boolean">
                <default>true</default>
            </attribute>
        </attributes>
        <nodes>
            <node id="0" label="Gephi">
                <attvalues>
                    <attvalue for="0" value="http://gephi.org"/>
                    <attvalue for="1" value="1"/>
                </attvalues>
            </node>
            <node id="1" label="Webatlas">
                <attvalues>
                    <attvalue for="0" value="http://webatlas.fr"/>
                    <attvalue for="1" value="2"/>
                </attvalues>
            </node>
            <node id="2" label="RTGI">
                <attvalues>
                    <attvalue for="0" value="http://rtgi.fr"/>
                    <attvalue for="1" value="1"/>
                </attvalues>
            </node>
            <node id="3" label="BarabasiLab">
                <attvalues>
                    <attvalue for="0" value="http://barabasilab.com"/>
                    <attvalue for="1" value="1"/>
                    <attvalue for="2" value="false"/>
                </attvalues>
            </node>
        </nodes>
        <edges>
            <edge source="0" target="1"/>
            <edge source="0" target="2"/>
            <edge source="0" target="3"/>
            <edge source="1" target="0"/>
            <edge source="2" target="1"/>
        </edges>
    </graph>
</gexf>'
]

{ #category : #tests }
GEXFWriterTest >> testPrintListStringAttribute [

	| gexf attList listOfStringAtt node resultString |
	gexf := GEXF new.
	attList := gexf graph createAttributeList.
	listOfStringAtt := attList add: ((GEXFAttribute
			                     title: 'list of string'
			                     type: GEXFAttributeType listString)
			                    id: '0';
			                    yourself).
	node := gexf graph createNodeWithId: '2'.
	node label: 'aLabel'.
	node addAttribute: listOfStringAtt withValue: 'hello|world'.
	resultString := String streamContents: [ :stream |
		writer on: stream.
		writer prettyPrinting.
		node accept: writer.
		 ].
	self assert: resultString equals: '<node id="2" label="aLabel">
    <attvalues>
        <attvalue for="0" value="hello|world"/>
    </attvalues>
</node>'
]

{ #category : #tests }
GEXFWriterTest >> testPrintNativeListStringAttribute [

	| gexf attList listOfStringAtt node resultString |
	gexf := GEXF new.
	attList := gexf graph createAttributeList.
	listOfStringAtt := attList add: ((GEXFAttribute
			                     title: 'list of string'
			                     type: GEXFAttributeType listString)
			                    id: '0';
			                    yourself).
	node := gexf graph createNodeWithId: '2'.
	node label: 'aLabel'.
	node addAttribute: listOfStringAtt withValue: { 'hello'. 'world' }.
	resultString := String streamContents: [ :stream | 
		                writer on: stream.
		                writer prettyPrinting.
		                node accept: writer ].
	self assert: resultString equals: '<node id="2" label="aLabel">
    <attvalues>
        <attvalue for="0" value="hello|world"/>
    </attvalues>
</node>'
]
