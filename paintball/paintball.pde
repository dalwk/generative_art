void setup() {
  size(768, 768);
  background(0);
  noFill();
  strokeWeight(5);
}

void draw() 
{
  delay(250);
  fill(0, 0, 0, 0);
  noStroke();
  rect(0,0,width,height); 
  for(int i = 0; i < 50; i++) {
    translate(random(width), random(height));
    Ring ring_obj = new Ring();
    ring_obj.display();
  }
}

class Ring {
  
  float ang, rad, x, y, n, minRad, maxRad;
  
  Ring() {
    n = random(20, 100);
    minRad = random(5, 50);
    maxRad = random(350, 700);
  }
  
  void display() {
    beginShape();
    for (int j = 0; j < n; j++) {
      fill(random(0,255), random(0, 255), random(0, 255));
      float ang = map(j, 0, n, 0, TWO_PI);
      float rad = map(noise(j * random(-10, 10)), 0.1, 1, minRad, maxRad);
      float x = rad * sin(ang);
      float y = rad * cos(ang);
      curveVertex(x, y);
    }
    endShape(CLOSE);
  }
}
