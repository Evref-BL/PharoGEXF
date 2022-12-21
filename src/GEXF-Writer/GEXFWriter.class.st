"
I am a writter that takes as input a gexf model and generate the corresponding graph
"
Class {
	#name : #GEXFWriter,
	#superclass : #Object,
	#instVars : [
		'writer'
	],
	#category : #'GEXF-Writer'
}

{ #category : #'instance creation' }
GEXFWriter class >> on: aStream [

	^ self new
		  on: aStream;
		  yourself
]

{ #category : #api }
GEXFWriter >> export: aGEXF [

	aGEXF accept: self
]

{ #category : #'instance creation' }
GEXFWriter >> on: aStream [

	writer := XMLWriter on: aStream
]

{ #category : #'instance creation' }
GEXFWriter >> prettyPrinting [

	writer enablePrettyPrinting
]

{ #category : #visiting }
GEXFWriter >> visitGEXF: aGEXF [

	writer xml.
	writer tag
		name: 'gexf';
		xmlnsAt: 'xsi' put: 'http://www.w3.org/2001/XMLSchema-instance';
		attributeAt: 'xmlns' put: 'http://gexf.net/1.3';
		attributeAt: 'version' put: '1.3';
		attributeAt: 'xsi:schemaLocation'
		put: 'http://gexf.net/1.3 http://gexf.net/1.3/gexf.xsd';
		with: [ 
			aGEXF metadata accept: self.
			aGEXF graph accept: self ]
]

{ #category : #visiting }
GEXFWriter >> visitGEXFAttribute: aGEXFAttribute [

	writer tag
		name: 'attribute';
		attributeAt: 'id' put: aGEXFAttribute id;
		attributeAt: 'title' put: aGEXFAttribute title;
		attributeAt: 'type' put: aGEXFAttribute type xmlValue;
		with: [ 
			aGEXFAttribute defaultValue ifNotEmpty: [ :defaultValue | 
					writer tag
						name: 'default';
						with: [ writer string: defaultValue ] ] ]
]

{ #category : #visiting }
GEXFWriter >> visitGEXFAttributeList: aGEXFAttributeList [

	writer tag
		name: 'attributes';
		attributeAt: 'class' put: aGEXFAttributeList attributesClass xmlValue;
		with: [ 
			aGEXFAttributeList do: [ :attribute | attribute accept: self ] ]
]

{ #category : #visiting }
GEXFWriter >> visitGEXFAttributeValue: aGEXFAttributeValue [

	writer tag
		name: 'attvalue';
		attributeAt: 'for' put: aGEXFAttributeValue attribute id;
		attributeAt: 'value' put: aGEXFAttributeValue attributeValue
]

{ #category : #visiting }
GEXFWriter >> visitGEXFEdge: aGEXFEdge [

	writer tag
		name: 'edge';
		attributeAt: 'source' put: aGEXFEdge source;
		attributeAt: 'target' put: aGEXFEdge target
]

{ #category : #visiting }
GEXFWriter >> visitGEXFGraph: aGEXFGraph [

	| tagWriter |
	tagWriter := writer tag.
	tagWriter name: 'graph'.
	tagWriter
		attributeAt: 'defaultedgetype'
		put: aGEXFGraph edgeType xmlValue.
	tagWriter with: [ 
		aGEXFGraph attributeLists do: [ :attributeList | 
			attributeList accept: self ].
		aGEXFGraph nodes ifNotEmpty: [ :nodes | 
			writer tag
				name: 'nodes';
				with: [ nodes do: [ :node | node accept: self ] ].
			aGEXFGraph allEdges ifNotEmpty: [ :edges | 
				writer tag
					name: 'edges';
					with: [ edges do: [ :edge | edge accept: self ] ] ] ] ]
]

{ #category : #visiting }
GEXFWriter >> visitGEXFMetadata: aGEXFMetadata [

	writer tag
		name: 'meta';
		with: [ 
			aGEXFMetadata creator ifNotEmpty: [ :creator | 
					writer tag
						name: 'creator';
						with: [ writer string: creator ] ].
			aGEXFMetadata description ifNotEmpty: [ :description | 
				writer tag
					name: 'description';
					with: [ writer string: description ] ] ]
]

{ #category : #visiting }
GEXFWriter >> visitGEXFNode: aGEXFNode [

	writer tag
		name: 'node';
		attributeAt: 'id' put: aGEXFNode id;
		attributeAt: 'label' put: aGEXFNode label;
		with: [ 
			aGEXFNode attributesValue ifNotEmpty: [ :attributesValue | 
					writer tag
						name: 'attvalues';
						with: [ 
							attributesValue do: [ :attributeValue | 
									attributeValue accept: self ] ] ] ]
]
