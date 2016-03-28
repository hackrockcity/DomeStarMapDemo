class DomeStarMap {
  class MapEntry {
    int x;
    int y;
    float d;
  }
  
  MapEntry[] lookup;
  color[] buffer;
  
  public DomeStarMap() {
    lookup = new MapEntry[360*360];
    buffer = new color[160*40];
    this.buildMap();
  }
  
  public void buildMap() {
    float f;
    float dist;
    int x,y,dx,dy;
    int i,j,idx;

    for (i=0; i<lookup.length; i++) {
      lookup[i] = new MapEntry();
    }

    for (i=0; i<3200; i++) {
      f = TWO_PI/3200*i;
      dx = i/80;
      dist = (1-(i%80/80.0));    

      for (j=20; j<180; j++) {
        x = int(180+sin(f)*j);
        y = int(180+cos(f)*j);
        dy = j-20;
        idx = (y*360+x);
        
        lookup[idx].x = dx;
        lookup[idx].y = dy;
        lookup[idx].d = dist;
      }
    }
  }
  
  public color[] applyMap() {
    PImage image = get(0,0,360,360);
    image.loadPixels();
    MapEntry m;
    int idx,x,y,z;
    
    color c;
    for (int i=0; i<image.pixels.length; i++) {
      m = lookup[i];
      x = m.x;
      c = image.pixels[i];
   
      buffer[m.y*40+x] = lerpColor(buffer[m.y*40+x],c,m.d);
      
      x++;
      if (x>39) x = 0;
      
      buffer[m.y*40+x] = lerpColor(buffer[m.y*40+x],c,1.0-m.d);
    }
    
    return buffer;
  }
}