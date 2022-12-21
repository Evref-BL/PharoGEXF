Class {
	#name : #GEXFAttributeClass,
	#superclass : #Object,
	#category : #GEXF
}

{ #category : #accessing }
GEXFAttributeClass class >> edge [
	^ GEXFAttributeEdgeClass new
]

{ #category : #accessing }
GEXFAttributeClass class >> node [
	^ GEXFAttributeNodeClass new
]
