# DomeStarMapDemo

The DomeStarMap class generates a 360x360 map of pixels 
to DomeStar x,y coordinates and distance (0.0-1.0).

The map is applied by lerping the color values by
the distance for the strip to the left of the pixel
and the inverse of that distance for the strip to
the right of the pixel.

