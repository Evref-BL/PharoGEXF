Extension { #name : #GEXFAttributeType }

{ #category : #'*GEXF-Writer' }
GEXFAttributeType >> valueOf: anAttributeValue using: writter [

	^ writter valueAsAttributeOf: anAttributeValue
]

{ #category : #'*GEXF-Writer' }
GEXFAttributeType >> xmlValue [

	^ self subclassResponsibility
]
