Class {
	#name : #GEXF,
	#superclass : #Object,
	#instVars : [
		'graph',
		'metadata'
	],
	#category : #GEXF
}

{ #category : #accessing }
GEXF >> graph [

	^ graph
]

{ #category : #accessing }
GEXF >> graph: anObject [

	graph := anObject
]

{ #category : #initialization }
GEXF >> initialize [

	super initialize.
	graph := GEXFGraph new.
	metadata := GEXFMetadata new
]

{ #category : #accessing }
GEXF >> metadata [

	^ metadata
]

{ #category : #accessing }
GEXF >> metadata: anObject [

	metadata := anObject
]
