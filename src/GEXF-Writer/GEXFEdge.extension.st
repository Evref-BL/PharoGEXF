Extension { #name : #GEXFEdge }

{ #category : #'*GEXF-Writer' }
GEXFEdge >> accept: aGEXFVisitor [
	^ aGEXFVisitor visitGEXFEdge: self
]
