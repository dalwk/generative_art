class Planet {
  float x, y, radius, r, g, b, a, rotation;
  
  Planet(float _x, float _y) {
    x = _x;
    y = _y;
    radius = random(10, 20);
    r = random(255);
    g = random(255);
    b = random(255);
    a = random(255);
    
    rotation = 0;
  }
  
  void display() {
    fill(r, g, b, a);
    ellipse(x, y, radius, radius);
  }
  
  void update() {
    x += cos(radians(rotation))*(width/2+10) / 400;
    y += sin(radians(rotation))*(width/2+10) / 400;
    rotation++;    
  }
  
}
