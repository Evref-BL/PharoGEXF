Class {
	#name : #GEXFNode,
	#superclass : #Object,
	#instVars : [
		'id',
		'label',
		'edges'
	],
	#category : #GEXF
}

{ #category : #api }
GEXFNode >> connectTo: aNode [

	self edges add: (GEXFEdge new
			 source: self id;
			 target: aNode id;
			 yourself)
]

{ #category : #api }
GEXFNode >> connectTo: aNode withId: aUniqueId [

	self edges add: (GEXFEdge new
			 id: aUniqueId;
			 source: self id;
			 target: aNode id;
			 yourself)
]

{ #category : #accessing }
GEXFNode >> edges [

	^ edges
]

{ #category : #accessing }
GEXFNode >> edges: anObject [

	edges := anObject
]

{ #category : #accessing }
GEXFNode >> id [

	^ id
]

{ #category : #accessing }
GEXFNode >> id: anObject [

	id := anObject
]

{ #category : #initialization }
GEXFNode >> initialize [

	super initialize.
	self edges: OrderedCollection new
]

{ #category : #accessing }
GEXFNode >> label [

	^ label
]

{ #category : #accessing }
GEXFNode >> label: anObject [

	label := anObject
]
