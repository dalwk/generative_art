float red = 80;
float green = 80;
float blue = 80;
boolean redCount = true;
boolean greenCount = true;
boolean blueCount = true;


void setup() {
  size(768, 768);
  smooth(8);
}

void draw() {
  background(0);
  
  for(float x = 0; x <= width; x++) {
    drawLine(x);
    incrementColors();
  }
  delay(10);
}

void drawLine(float xVal) {
  stroke(red, green, blue); 
  line(xVal, 0, xVal, height);
}

void incrementColors() {
  if (redCount) {
    red += random(0, 1);
  } else {
    red -= random(0, 1);
  }
  
  if (greenCount) {
    green += random(0, 1);
  } else {
    green -= random(0, 1);
  }
  
  if (blueCount) {
    blue += random(0, 1);
  } else {
    blue -= random(0, 1);
  }
  
  if (red >= 255) {
    redCount = false;
  } else if (red <= 80) {
    redCount = true;
  }
  
  if (green >= 255) {
    greenCount = false;
  } else if (green <= 80) {
    greenCount = true;
  }
  
    if (blue >= 255) {
    blueCount = false;
  } else if (blue <= 80) {
    blueCount = true;
  }
  
}
