Class {
	#name : #GEXFMode,
	#superclass : #Object,
	#category : #GEXF
}

{ #category : #'as yet unclassified' }
GEXFMode class >> dynamic [
	^ GEXFModeDynamic new
]

{ #category : #'as yet unclassified' }
GEXFMode class >> static [
	^ GEXFModeStatic new
]
