Class {
	#name : #GEXFMetadata,
	#superclass : #Object,
	#instVars : [
		'creator',
		'description',
		'keywords',
		'lastModified'
	],
	#category : #GEXF
}

{ #category : #accessing }
GEXFMetadata >> creator [

	^ creator
]

{ #category : #accessing }
GEXFMetadata >> creator: anObject [

	creator := anObject
]

{ #category : #accessing }
GEXFMetadata >> description [

	^ description
]

{ #category : #accessing }
GEXFMetadata >> description: anObject [

	description := anObject
]

{ #category : #initialization }
GEXFMetadata >> initialize [

	super initialize.
	keywords := OrderedCollection new
]

{ #category : #accessing }
GEXFMetadata >> keywords [

	^ keywords
]

{ #category : #accessing }
GEXFMetadata >> keywords: anObject [

	keywords := anObject
]

{ #category : #accessing }
GEXFMetadata >> lastModified [

	^ lastModified
]

{ #category : #accessing }
GEXFMetadata >> lastModified: anObject [

	lastModified := anObject
]
