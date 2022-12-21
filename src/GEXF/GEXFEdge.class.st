Class {
	#name : #GEXFEdge,
	#superclass : #Object,
	#instVars : [
		'source',
		'target',
		'id'
	],
	#category : #GEXF
}

{ #category : #accessing }
GEXFEdge >> id [

	^ id
]

{ #category : #accessing }
GEXFEdge >> id: anObject [

	id := anObject
]

{ #category : #accessing }
GEXFEdge >> source [

	^ source
]

{ #category : #accessing }
GEXFEdge >> source: anObject [

	source := anObject
]

{ #category : #accessing }
GEXFEdge >> target [

	^ target
]

{ #category : #accessing }
GEXFEdge >> target: anObject [

	target := anObject
]
