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
