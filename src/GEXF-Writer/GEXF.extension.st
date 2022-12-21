Extension { #name : #GEXF }

{ #category : #'*GEXF-Writer' }
GEXF >> accept: aGEXFVisitor [
	^ aGEXFVisitor visitGEXF: self
]
