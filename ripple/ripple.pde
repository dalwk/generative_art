float x_freq = 0.02;
float y_freq = 0.1;
float spread = 14;
float amplitude = 100;
boolean blueUp;
int blueCount;
color[] colors;
int colorCount;

void setup() {
  size(1080, 768);
  smooth(8);
  noiseDetail(3);
  background(0);
  blueCount = 0;
  blueUp = true;
  colors = new color[floor(height + amplitude / spread)];
  for (int c = 0; c < colors.length; c++) {
    colors[c] = color(0, random(100, 200), random(80, 255));
  }
  colorCount = 0;
}

void draw() {
  drawBackground();
  drawWaves();
}

void drawWaves() {
  noFill();
  strokeWeight(2);
  
  float zOff = frameCount * 0.01;
  float yOff = 0;
  for(float y = -amplitude; y < height + amplitude; y += spread){
    float xOff = 0;
    stroke(colors[colorCount]);
    beginShape();
    for (float x = -amplitude; x < width + amplitude; x += spread) {
      float n = noise(xOff, yOff, zOff);
      float value = map(n, 0, 1, -amplitude, amplitude);
      curveVertex(x, y + value);
      xOff += x_freq;
    }
    endShape();
    yOff += y_freq;
    colorCount++;
  }
  colorCount = 0;
}

void drawBackground() {
  noStroke();  
  fill(0, 0, blueCount, 15);
  if(blueUp) {
    blueCount++;
    if(blueCount >= 90) {
      blueUp = !blueUp;
    }
  } else {
    blueCount--;
    if(blueCount <= 40) {
      blueUp = !blueUp;
    }
  }
  rect(0, 0, width, height);
}
