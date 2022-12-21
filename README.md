# PharoGEXF

Manipulate GEXF file format with Pharo.

## Installation 

```st
Metacello new
  githubUser: 'badetitou' project: 'PharoGEXF' commitish: 'main' path: 'src';
  baseline: 'PharoGEXF';
  load
```

## Usage

1. Create a gexf element
    ```st
    gexf := GEXF new.
    ```
2. Set metadata
    ```st
    gexf metadata creator: 'Gephi.org'.
    gexf metadata description: 'A Web network'.
    ```
 3. Add nodes
    ```st
    node1 := graph createNodeWithId: '0'.
	  node1 label: 'Hello'.
	  node2 := graph createNodeWithId: '2'.
	  node2 label: 'World'.
    ```
4. Connect nodes
    ```st
    node1 connectTo: node2.
    ```
5. Export file
    ```st
    String streamContents: [:stream |
	    (GEXFWriter on: stream)
		    prettyPrinting;
	 	    export: gexf ]
    ```
