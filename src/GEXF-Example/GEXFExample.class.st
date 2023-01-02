"
I present the script to reproduce the example provided [here](https://gexf.net)
"
Class {
	#name : #GEXFExample,
	#superclass : #Object,
	#category : #'GEXF-Example'
}

{ #category : #examples }
GEXFExample >> basicGraph [

	| gexf graph node1 node2 |
	gexf := GEXF new.
	graph := gexf graph.
	graph edgeType: GEXFEdgeType directed.
	node1 := graph createNodeWithId: '0'.
	node1 label: 'Hello'.
	node2 := graph createNodeWithId: '1'.
	node2 label: 'World'.
	node1 connectTo: node2.
	^ gexf
]

{ #category : #examples }
GEXFExample >> data [

	| gexf graph attList urlAtt indegreeAtt frogAtt nodeGephi nodeWebatlas nodeRTGI nodeBarabasiLab |
	gexf := GEXF new.
	graph := gexf graph.
	graph edgeType: GEXFEdgeType directed.

	gexf metadata creator: 'Gephi.org'.
	gexf metadata description: 'A Web network'.

	attList := graph createAttributeList.
	urlAtt := attList add:
		          ((GEXFAttribute
			            title: 'url'
			            type: GEXFAttributeType string)
			           id: '0';
			           yourself).
	indegreeAtt := attList add:
		               ((GEXFAttribute
			                 title: 'indegree'
			                 type: GEXFAttributeType float)
			                id: '1';
			                yourself).
	frogAtt := attList add:
		           ((GEXFAttribute
			             title: 'frog'
			             type: GEXFAttributeType boolean)
			            id: '2';
			            yourself).
	frogAtt defaultValue: 'true'.


	nodeGephi := graph createNodeWithId: '0'.
	nodeGephi label: 'Gephi'.
	nodeGephi addAttribute: urlAtt withValue: 'http://gephi.org'.
	nodeGephi addAttribute: indegreeAtt withValue: '1'.

	nodeWebatlas := graph createNodeWithId: '1'.
	nodeWebatlas label: 'Webatlas'.
	nodeWebatlas addAttribute: urlAtt withValue: 'http://webatlas.fr'.
	nodeWebatlas addAttribute: indegreeAtt withValue: '2'.

	nodeRTGI := graph createNodeWithId: '2'.
	nodeRTGI label: 'RTGI'.
	nodeRTGI addAttribute: urlAtt withValue: 'http://rtgi.fr'.
	nodeRTGI addAttribute: indegreeAtt withValue: '1'.

	nodeBarabasiLab := graph createNodeWithId: '3'.
	nodeBarabasiLab label: 'BarabasiLab'.
	nodeBarabasiLab addAttribute: urlAtt withValue: 'http://barabasilab.com'.
	nodeBarabasiLab addAttribute: indegreeAtt withValue: '1'.
	nodeBarabasiLab addAttribute: frogAtt withValue: 'false'.

	nodeGephi connectTo: nodeWebatlas.
	nodeGephi connectTo: nodeRTGI.
	nodeWebatlas connectTo: nodeGephi.
	nodeRTGI connectTo: nodeWebatlas.
	nodeGephi connectTo: nodeBarabasiLab.
	^ gexf
]
