float f = 0;

DomeStarMap map;
LEDDisplay dome;

void setup() {
  size(360,360);

  dome = new LEDDisplay(this, 40, 160, true, "localhost", 58082);
  map = new DomeStarMap();
}

void draw() {
  background(0);
  noStroke();
  fill(255,0,0);
  
  PImage image = loadImage("test.jpg");
  image(image,0,0);

  rect(0,(frameCount+160)%360,360,40);
  rect((frameCount+160)%360,0,40,360);
  
  dome.sendData(map.applyMap());
  
  if (frameCount % 10 == 0) println(frameRate); 
}