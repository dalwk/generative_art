class Star {
  color c;
  float x1, y1, x2, y2;
  float vFactor = 1.05;
  
  Star() {
    c = color(random(0, 255), random(0, 255), random(0, 255), random(0, 255));
    this.x1 = random(width - width/2) * random(-1,1);
    this.y1 = random(height - height/2) * random(-1,1);
    this.x2 = x1;
    this.y2 = y1;
  }
  
  void display() {
    stroke(c);
    strokeWeight(4);
    line(this.x1, this.y1, this.x2, this.y2);
  }
  
  void accelerate() {
    this.x1 = vFactor*this.x1;
    this.y1 = vFactor*this.y1;
    this.x2 = vFactor*this.x2;
    this.y2 = vFactor*this.y2;
  
    if (abs(this.x1) > width/2 || abs(this.y1) > height/2) {
      this.x1 = (random(width - width/2)/2 * random(-1,1));
      this.y1 = (random(height - height/2)/2 * random(-1,1));
      this.x2 = this.x1;
      this.y2 = this.y1;
    }
  }
}

int numStars = 5000;
ArrayList<Star> stars;

void setup() {
  size(768, 768);
  smooth(8);
  
  stars = new ArrayList<Star>();
  for (int i = 0; i < numStars; i++) {
    stars.add(new Star());
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  for (int i = 0; i < stars.size()-1; i++) {
    Star s = stars.get(i);
    s.display();
    s.accelerate();
  }
}
