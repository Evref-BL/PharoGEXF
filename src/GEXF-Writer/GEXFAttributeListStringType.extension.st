Extension { #name : #GEXFAttributeListStringType }

{ #category : #'*GEXF-Writer' }
GEXFAttributeListStringType >> valueOf: anAttributeValue using: writter [

	^ writter valueAsAttributeListStringOf: anAttributeValue
]

{ #category : #'*GEXF-Writer' }
GEXFAttributeListStringType >> xmlValue [

	^ #liststring
]
