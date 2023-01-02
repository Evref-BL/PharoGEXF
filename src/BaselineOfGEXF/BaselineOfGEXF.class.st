Class {
	#name : #BaselineOfGEXF,
	#superclass : #BaselineOf,
	#category : #BaselineOfGEXF
}

{ #category : #baselines }
BaselineOfGEXF >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfGEXF >> defineDependencies: spec [
]

{ #category : #baselines }
BaselineOfGEXF >> defineGroups: spec [
]

{ #category : #baselines }
BaselineOfGEXF >> definePackages: spec [

	spec
		package: 'GEXF';
		package: 'GEXF-Writer' with: [ spec requires: #( 'GEXF' ) ];
		package: 'GEXF-Example' with: [ spec requires: #( 'GEXF' ) ];
		package: 'GEXF-Writer-Tests'
		with: [ spec requires: #( 'GEXF-Writer' ) ]
]
