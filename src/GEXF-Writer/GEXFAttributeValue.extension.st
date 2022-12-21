Extension { #name : #GEXFAttributeValue }

{ #category : #'*GEXF-Writer' }
GEXFAttributeValue >> accept: aGEXFVisitor [
	^ aGEXFVisitor visitGEXFAttributeValue: self
]
