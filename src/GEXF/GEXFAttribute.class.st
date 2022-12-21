Class {
	#name : #GEXFAttribute,
	#superclass : #Object,
	#instVars : [
		'id',
		'defaultValue',
		'type',
		'title'
	],
	#category : #GEXF
}

{ #category : #'as yet unclassified' }
GEXFAttribute class >> title: attributeTitle type: attributeType [

	^ self new
		  title: attributeTitle;
		  type: attributeType;
		  yourself
]

{ #category : #accessing }
GEXFAttribute >> defaultValue [

	^ defaultValue
]

{ #category : #accessing }
GEXFAttribute >> defaultValue: anObject [

	defaultValue := anObject
]

{ #category : #accessing }
GEXFAttribute >> id [

	^ id
]

{ #category : #accessing }
GEXFAttribute >> id: anObject [

	id := anObject
]

{ #category : #initialization }
GEXFAttribute >> initialize [

	super initialize.
	self id: UUIDGenerator next asString36.
	self type: GEXFAttributeType string.
	self defaultValue: ''
]

{ #category : #accessing }
GEXFAttribute >> title [

	^ title
]

{ #category : #accessing }
GEXFAttribute >> title: anObject [

	title := anObject
]

{ #category : #accessing }
GEXFAttribute >> type [

	^ type
]

{ #category : #accessing }
GEXFAttribute >> type: anObject [

	type := anObject
]
