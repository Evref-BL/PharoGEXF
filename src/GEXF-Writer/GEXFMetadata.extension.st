Extension { #name : #GEXFMetadata }

{ #category : #'*GEXF-Writer' }
GEXFMetadata >> accept: aGEXFVisitor [
	^ aGEXFVisitor visitGEXFMetadata: self
]
