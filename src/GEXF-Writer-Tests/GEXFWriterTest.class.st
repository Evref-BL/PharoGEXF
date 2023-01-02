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

{ #category : #tests }
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
