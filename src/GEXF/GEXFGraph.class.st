Class {
	#name : #GEXFGraph,
	#superclass : #Object,
	#instVars : [
		'nodes',
		'edgeType',
		'mode',
		'attributeLists'
	],
	#category : #GEXF
}

{ #category : #accessing }
GEXFGraph >> allEdges [

	^ self nodes flatCollect: [ :node | node edges ]
]

{ #category : #accessing }
GEXFGraph >> attributeLists [

	^ attributeLists
]

{ #category : #accessing }
GEXFGraph >> attributeLists: anObject [

	attributeLists := anObject
]

{ #category : #api }
GEXFGraph >> createAttributeList [

	^ self attributeLists add: GEXFAttributeList new
]

{ #category : #api }
GEXFGraph >> createAttributeListFor: aAttributeClass [

	^ self attributeLists add: (GEXFAttributeList for: aAttributeClass)
]

{ #category : #api }
GEXFGraph >> createNode [

	^ self createNodeWithId: UUIDGenerator next asString36
]

{ #category : #api }
GEXFGraph >> createNodeWithId: aUniqueId [

	^ self nodes add: (GEXFNode new
			   id: aUniqueId;
			   yourself)
]

{ #category : #accessing }
GEXFGraph >> edgeType [

	^ edgeType
]

{ #category : #accessing }
GEXFGraph >> edgeType: anObject [

	edgeType := anObject
]

{ #category : #initialization }
GEXFGraph >> initialize [

	super initialize.
	self mode: GEXFMode static.
	self edgeType: GEXFEdgeType undirected.
	self nodes: OrderedCollection new.
	self attributeLists: OrderedCollection new
]

{ #category : #accessing }
GEXFGraph >> mode [

	^ mode
]

{ #category : #accessing }
GEXFGraph >> mode: anObject [

	mode := anObject
]

{ #category : #api }
GEXFGraph >> nodeWithId: aUniqueId [

	^ self nodeWithId: aUniqueId ifAbsent: [ nil ]
]

{ #category : #api }
GEXFGraph >> nodeWithId: aUniqueId ifAbsent: aBlock [

	^ self nodes detect: [ :node | node id = aUniqueId ] ifNone: [ aBlock value ]
]

{ #category : #accessing }
GEXFGraph >> nodes [

	^ nodes
]

{ #category : #accessing }
GEXFGraph >> nodes: anObject [

	nodes := anObject
]
