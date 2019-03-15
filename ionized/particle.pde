class Particle {
  float x, y, r, g, b, radius, vel;
  boolean to_right;
  
  Particle(float _y, float _radius) {
    x = 0;
    y = _y;
    
    r = random(255);
    g = random(255);
    b = random(255);
    
    radius = _radius;

    vel = random(4, 8);
    
    to_right = true;
  }
  
  void display() {
    fill(r, g, b);
    ellipse(x, y, radius, radius);
  }
  
  void update() {
    if (to_right) {
      x += vel;
    } else {
      x -= vel;
    }
    
    if (x < 0 + (radius / 2) || x > width - (radius / 2)) {
      to_right = !to_right;
      vel = random(4, 8);
    }
  }
}
