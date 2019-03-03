int count = 3;
float x1, y1, x2, y2, x3, y3;
float xa, ya, xb, yb, xc, yc;

void setup() {
  size(768, 768);
  background(255);
  noStroke();

  x1 = 0;
  y1 = 0;
  x2 = 20;
  y2 = 0;
  x3 = 20;
  y3 = 20;
  
  xa = width;
  ya = height;
  xb = width - 20;
  yb = height;
  xc = width - 20;
  yc = height - 20;
}

void draw() {

  fill(random(0, 255), random(0, 255), random(0, 255));
  
  triangle(x1, y1, x2, y2, x3, y3);
  
  float increment = random(-100, 100);
  float y_factor = random(1, 4);
  
  x1 += increment;
  x2 += increment * 2;
  x3 += increment;
  y3 += increment * y_factor;
  
  triangle(xa, ya, xb, yb, xc, yc);
  
  xa -= increment;
  xb -= increment * 2;
  xc -= increment;
  yc -= increment * y_factor;
  
  if(x1 > width || xa < 0 || x1 < -width || xa > width) {
    x1 = 0;
    y1 = 0;
    x2 = 20;
    y2 = 0;
    x3 = 20;
    y3 = 20;
    
    xa = width;
    ya = height;
    xb = width - 20;
    yb = height;
    xc = width - 20;
    yc = height - 20;
  }
  
  delay(50);
}
