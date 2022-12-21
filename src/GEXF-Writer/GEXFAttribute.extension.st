Extension { #name : #GEXFAttribute }

{ #category : #'*GEXF-Writer' }
GEXFAttribute >> accept: aGEXFVisitor [

	^ aGEXFVisitor visitGEXFAttribute: self
]
