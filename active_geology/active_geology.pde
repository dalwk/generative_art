float yoff = 0.0;        

float color1_1 = random(0,255);
float color1_2 = random(0,255);
float color1_3 = random(0,255);

float color2_1 = random(0,255);
float color2_2 = random(0,255);
float color2_3 = random(0,255);

float color3_1 = random(0,255);
float color3_2 = random(0,255);
float color3_3 = random(0,255);

float color4_1 = random(0,255);
float color4_2 = random(0,255);
float color4_3 = random(0,255);

float color5_1 = random(0,255);
float color5_2 = random(0,255);
float color5_3 = random(0,255);

float color6_1 = random(0,255);
float color6_2 = random(0,255);
float color6_3 = random(0,255);

float color7_1 = random(0,255);
float color7_2 = random(0,255);
float color7_3 = random(0,255);

float color8_1 = random(0,255);
float color8_2 = random(0,255);
float color8_3 = random(0,255);




void setup() {
  size(768, 768);
  smooth(8);
}

void draw() {
  
  background(0);
  drawWave(-400, 300, color1_1, color1_2, color1_3);
  drawWave(-200, 300, color2_1, color2_2, color2_3);
  drawWave(0, 300, color3_1, color3_2, color3_3);
  drawWave(200, 300, color4_1, color4_2, color4_3);
  drawWave(400, 300, color5_1, color5_2, color5_3);
  drawWave(600, 300, color6_1, color6_2, color6_3);
  drawWave(800, 300, color7_1, color7_2, color7_3);
  drawWave(1000, 300, color8_1, color8_2, color8_3);

}

void drawWave(float xVal, float yVal, float red, float green, float blue) {
  beginShape(); 
  
  float xoff = 0; 
  
  for (float x = 0; x <= width; x++) {
    float y = map(noise(xoff, yoff), 0, 1, xVal, yVal);    
    vertex(x, y); 
    xoff += 0.008;
  }
  yoff += 0.008;
  
  vertex(width, height);
  vertex(0, height);
  
  fill(red, green, blue);
  endShape(CLOSE);
}
