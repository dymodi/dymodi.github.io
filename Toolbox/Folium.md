---
layout: post
title: Folium Customization
date: July 26, 2019
author: Yi DING
---



## Customiz Axis

```js
color_map.x = d3.scale.linear()
  .domain([0.0, 9061.4]) 	// This is what is written on the Axis: from 0 to 100
  .range([0, 600]);				// This is where the axis is placed: from 100 px to 800px

color_map.legend = L.control({position: 'topright'});
color_map.legend.onAdd = function (map) {var div = L.DomUtil.create('div', 'legend'); return div};
color_map.legend.addTo(map_4905bfed941949a2a900a63566a21f85);

color_map.xAxis = d3.svg.axis()
  .scale(color_map.x)
  .orient("top")
  .tickSize(1)
  .tickValues([0.03, 1510.26, 3020.5, 4530.73, 6040.96, 7551.20, 9061.43]);

color_map.svg = d3.select(".legend.leaflet-control").append("svg")
  .attr("id", 'legend')
  .attr("width", 700)			// legend width
  .attr("height", 200);		// legend height

color_map.g = color_map.svg.append("g")
  .style("font", "30px sans-serif")				// legend font size
  .attr("class", "key")
  .attr("transform", "translate(24,26)");	// legend position

color_map.g.selectAll("rect").data(color_map.color.range().map(function(d, i) {
  return {
    x0: i ? color_map.x(color_map.color.domain()[i - 1]) : color_map.x.range()[0],
    x1: i < color_map.color.domain().length ? color_map.x(color_map.color.domain()[i]) :
    color_map.x.range()[1],
    z: d
  };
}))
  .enter().append("rect")
  .attr("height", 10)
  .attr("x", function(d) { return d.x0; })
  .attr("width", function(d) { return d.x1 - d.x0; })
  .style("fill", function(d) { return d.z; });

color_map.g.call(color_map.xAxis).append("text")
  .attr("class", "caption")
  .attr("y", 42)												// legend position
  .attr("font-weight", "bold")					// legend font size
  .text('This is legends');
```

