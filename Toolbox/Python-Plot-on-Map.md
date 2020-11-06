---
layout: post
title: Python Plot on Map
date: Nov. 6, 2020
author: Yi DING
---



[HTML Color Codes](https://htmlcolorcodes.com/)

## Plotly

### GeoJson Data Prepare

``` python
## GeoJson to list
huangpu_list = list(geojson.utils.coords(geoJSON_huangpu))
huangpu_lat = []
huangpu_lon = []
for lat_lon in huangpu_list:
    huangpu_lon.append(lat_lon[0])
    huangpu_lat.append(lat_lon[1])
```



### [Scatter plot](https://plotly.com/python/scattermapbox/) + Mapbox

``` python
import plotly
import plotly.express as px
import plotly.graph_objects as go

## mapbox_token can be obtained free on mapbox website
mapbox_access_token = open(".mapbox_token").read()

color_huangpu = 'rgba(0, 191, 255, 0.6)'

fig = go.Figure(go.Scattermapbox())

## Plot trace / scatter
fig = go.Figure(go.Scattermapbox(
    mode = "lines",
    fill = "toself",
    lon = huangpu_lon, lat = huangpu_lat,
    marker = { 'size': 10, 'color': color_huangpu }))

## Add trace / scatter
fig.add_trace(go.Scattermapbox(
    mode = "lines",
    fill = "toself",
    lon = xuhui_lon, lat = xuhui_lat,
    marker = { 'size': 10, 'color': color_xuhui }))

## Customize layout
fig.update_layout(mapbox_style="light", mapbox_accesstoken=mapbox_access_token,showlegend=False, 
                  mapbox=dict(zoom=10, center=dict(lat=31.23,lon=121.47), style='light'))

# Save figure
figure_name = "shanghai_map.html"
plotly.offline.plot(fig, filename=os.path.join(figure_path,figure_name))
```



