Class {
	#name : #GEXFAttributeType,
	#superclass : #Object,
	#category : #GEXF
}

{ #category : #'as yet unclassified' }
GEXFAttributeType class >> anyUri [
	^ GEXFAttributeAnyUriType new
]

{ #category : #'as yet unclassified' }
GEXFAttributeType class >> boolean [
	^ GEXFAttributeBooleanType new
]

{ #category : #'as yet unclassified' }
GEXFAttributeType class >> double [
	^ GEXFAttributeDoubleType new
]

{ #category : #'as yet unclassified' }
GEXFAttributeType class >> float [
	^ GEXFAttributeFloatType new
]

{ #category : #'as yet unclassified' }
GEXFAttributeType class >> integer [
	^ GEXFAttributeIntegerType new
]

{ #category : #'as yet unclassified' }
GEXFAttributeType class >> listString [
	^ GEXFAttributeListStringType new
]

{ #category : #'as yet unclassified' }
GEXFAttributeType class >> long [

	^ GEXFAttributeLongType new
]

{ #category : #'as yet unclassified' }
GEXFAttributeType class >> string [

	^ GEXFAttributeStringType new
]
