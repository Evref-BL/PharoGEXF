Class {
	#name : #GEXFGraph,
	#superclass : #Object,
	#instVars : [
		'nodes',
		'edgeType',
		'mode'
	],
	#category : #GEXF
}

{ #category : #accessing }
GEXFGraph >> allEdges [

	^ self nodes flatCollect: [ :node | node edges ]
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
	self nodes: OrderedCollection new
]

{ #category : #accessing }
GEXFGraph >> mode [

	^ mode
]

{ #category : #accessing }
GEXFGraph >> mode: anObject [

	mode := anObject
]

{ #category : #accessing }
GEXFGraph >> nodes [

	^ nodes
]

{ #category : #accessing }
GEXFGraph >> nodes: anObject [

	nodes := anObject
]
