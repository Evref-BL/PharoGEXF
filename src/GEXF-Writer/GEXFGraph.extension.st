Extension { #name : #GEXFGraph }

{ #category : #'*GEXF-Writer' }
GEXFGraph >> accept: aGEXFVisitor [
	^ aGEXFVisitor visitGEXFGraph: self
]
