Class {
	#name : #GEXFAttributeValue,
	#superclass : #Object,
	#instVars : [
		'attribute',
		'attributeValue'
	],
	#category : #GEXF
}

{ #category : #'as yet unclassified' }
GEXFAttributeValue class >> for: aGEXAttribute value: aValue [

	^ self new
		  attribute: aGEXAttribute;
		  attributeValue: aValue
]

{ #category : #accessing }
GEXFAttributeValue >> attribute [

	^ attribute
]

{ #category : #accessing }
GEXFAttributeValue >> attribute: anObject [

	attribute := anObject
]

{ #category : #accessing }
GEXFAttributeValue >> attributeValue [

	^ attributeValue
]

{ #category : #accessing }
GEXFAttributeValue >> attributeValue: anObject [

	attributeValue := anObject
]

{ #category : #initialization }
GEXFAttributeValue >> initialize [

	super initialize.
	self attributeValue: ''
]
