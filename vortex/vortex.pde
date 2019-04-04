float PHI = 1.618;
float r, g, b;

void setup(){
  size(768, 768);
  background(0);
  r = random(255);
  g = random(255);
  b = random(255);
}

void draw(){
  float x, y;
  for(int i = 0; i < 2625; i++){
    
    fill(r, g, b);
    
    r += 1;
    g += 1;
    b += 1;
    
    if (r >= 255) {
      r = 0;
    }
    if (g >= 255) {
      g = 0;
    }
    if (b >= 255) {
      b = 0;
    }
    
    x = cos(PHI * i) * (i / 5) + width / 2;
    y = sin(PHI * i) * (i / 5) + height / 2;
    ellipse(x, y, i / 50.0 + 3, i / 50.0 + 3);
  }
}
