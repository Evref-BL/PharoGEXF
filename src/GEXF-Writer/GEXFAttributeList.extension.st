Extension { #name : #GEXFAttributeList }

{ #category : #'*GEXF-Writer' }
GEXFAttributeList >> accept: aGEXFVisitor [
	^ aGEXFVisitor visitGEXFAttributeList: self
]
