Class {
	#name : #GEXFNode,
	#superclass : #Object,
	#instVars : [
		'id',
		'label',
		'edges',
		'attributesValue'
	],
	#category : #GEXF
}

{ #category : #api }
GEXFNode >> addAttribute: aGEXFAttribute withValue: aValue [

	^ self attributesValue add:
		(GEXFAttributeValue for: aGEXFAttribute value: aValue)
]

{ #category : #accessing }
GEXFNode >> attributesValue [

	^ attributesValue
]

{ #category : #accessing }
GEXFNode >> attributesValue: anObject [

	attributesValue := anObject
]

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
	self edges: OrderedCollection new.
	self attributesValue: OrderedCollection new
]

{ #category : #accessing }
GEXFNode >> label [

	^ label
]

{ #category : #accessing }
GEXFNode >> label: anObject [

	label := anObject
]
