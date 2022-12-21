Class {
	#name : #GEXFEdgeType,
	#superclass : #Object,
	#category : #GEXF
}

{ #category : #'as yet unclassified' }
GEXFEdgeType class >> directed [

	^ GEXFEdgeDirected new
]

{ #category : #'as yet unclassified' }
GEXFEdgeType class >> mutual [

	^ GEXFEdgeMutual new
]

{ #category : #'as yet unclassified' }
GEXFEdgeType class >> undirected [

	^ GEXFEdgeUndirected new
]
