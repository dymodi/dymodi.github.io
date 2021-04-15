---
layout: post
title: Python Plot on Map
date: Nov. 6, 2020
author: Yi DING
---

[HTML Color Codes](https://htmlcolorcodes.com/)

## Plotly

### [Quick start with Express](https://plotly.com/python/scattermapbox/)

``` python
import plotly.express as px
px.set_mapbox_access_token(open(".mapbox_token").read())
df = px.data.carshare()
fig = px.scatter_mapbox(df, lat="centroid_lat", lon="centroid_lon",  color="peak_hour", size="car_hours",
                  color_continuous_scale=px.colors.cyclical.IceFire, size_max=15, zoom=10)
fig.show()
```

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
    mode = "lines",  # or "markers"
    fill = "toself",
    lon = huangpu_lon_ls, 
    lat = huangpu_lat_ls,
   	text = text_ls,
    marker = { 'size': 10, 'color': color_huangpu }))

## Add trace / scatter
fig.add_trace(go.Scattermapbox(
    mode = "lines", # or "markers"
    fill = "toself",
    lon = xuhui_lon_ls, 
    lat = xuhui_lat_ls,
  	text = text_ls,
    marker = { 'size': 10, 'color': color_xuhui }))

## Customize layout
fig.update_layout(mapbox_style="open-street-map", mapbox_zoom=10,
                          mapbox_center_lat = 31.22,
                          mapbox_center_lon = 121.44,
                          margin={"r":0,"t":0,"l":0,"b":0},)

fig.update_layout(mapbox_style="light", mapbox_accesstoken=mapbox_access_token,showlegend=False,)

# Save figure
figure_name = "shanghai_map.html"
plotly.offline.plot(fig, filename=os.path.join(figure_path,figure_name))
```



