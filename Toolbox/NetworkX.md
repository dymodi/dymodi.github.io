---
layout: post
title: NetworkX
date: Oct. 12, 2018
author: Yi DING
---

NetworkX is a Python package for the creation, manipulation, and study of the structure, dynamics, and functions of complex networks.



## Basic Operation

```python
import networkx as nx
# Create empty garph
G = nx.Graph()
G = nx.DiGraph(n_res=1)
# Add node
G.add_nodes_from([1,2,3])
# Add edge
G.add_edge(1,2)
# Remove
G.remove_node(2)
G.remove_edge(1, 3)
# Assign weight
G[1][3]['color'] = "blue"
# Draw graph
nx.draw(G)
# Check graph
G.number_of_nodes()
G.number_of_edges()
list(G.nodes)
list(G.edges)
list(G.adj[1])
G.degree[1] 
```

