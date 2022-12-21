Extension { #name : #GEXFNode }

{ #category : #'*GEXF-Writer' }
GEXFNode >> accept: aGEXFVisitor [
	^ aGEXFVisitor visitGEXFNode: self
]
