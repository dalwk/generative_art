class Particle {
  float x, y, z, x_vel, y_vel, radius;
  color c;
  boolean firefly;
  
  Particle(float _x, float _y, boolean _firefly) {
    x = _x;
    y = _y;
    x_vel = random(-0.5, 0.5);
    y_vel = random(-0.5, 0.5);
    firefly = _firefly;
    if(firefly) {
      c = color(random(200, 255), random(100, 240), 0, random(50, 100));
      radius = random(8, 25);
    } else {
      c = color(random(50), random(100, 255), random(50, 100), random(10));
      radius = random(10, 80);
    }
  }
  
  void updateParticle() {
    if (x < 0 || x > width || y < 0 || y > height) {
      x = random(width);
      y = random(height);
      x_vel = random(-0.5, 0.5);
      y_vel = random(-0.5, 0.5);
      if(firefly) {
        c = color(random(200, 255), random(100, 240), 0, random(50, 100));
        radius = random(8, 25);
      } else {
        c = color(random(50), random(100, 255), random(50, 100), random(10));
        radius = random(10, 80);
      }
    }
    x += x_vel;
    y += y_vel;
  }
  
  void drawParticle() {
    fill(c);
    ellipse(x, y, radius, radius);
  }
}
