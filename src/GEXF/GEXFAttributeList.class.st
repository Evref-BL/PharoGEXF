Class {
	#name : #GEXFAttributeList,
	#superclass : #OrderedCollection,
	#instVars : [
		'attributes',
		'attributesClass'
	],
	#category : #GEXF
}

{ #category : #'instance creation' }
GEXFAttributeList class >> for: aGEXFAttributeClass [

	^ self new
		  attributesClass: aGEXFAttributeClass;
		  yourself
]

{ #category : #'instance creation' }
GEXFAttributeList class >> new [

	^ super new initialize
]

{ #category : #accessing }
GEXFAttributeList >> attributesClass [

	^ attributesClass
]

{ #category : #accessing }
GEXFAttributeList >> attributesClass: anObject [

	attributesClass := anObject
]

{ #category : #initialization }
GEXFAttributeList >> initialize [

	super initialize.
	self attributesClass: GEXFAttributeClass node
]
