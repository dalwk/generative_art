void setup() {
  size(768, 768);
  smooth(8);
}

void draw() {
  background(0);
  
  for(float x = 0; x <= width; x++) {
    drawLine(x);
  }
  delay(50);
}

void drawLine(float xVal) {
  stroke(random(0,255), random(0,255), random(0,255)); 
  line(xVal, 0, xVal, height);
}
