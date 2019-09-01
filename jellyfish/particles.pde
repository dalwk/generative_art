class Particle {
  float x, y, z, x_vel, y_vel, radius;
  color c;
  boolean jellyfish;
  
  Particle(float _x, float _y, boolean _jellyfish) {
    x = _x;
    y = _y;
    x_vel = random(-0.5, 0.5);
    y_vel = random(-0.5, 0.5);
    jellyfish = _jellyfish;
    if(jellyfish) {
      c = color(random(200, 255), random(50, 100), random(120, 240), random(50, 100));
      radius = random(10, 30);
    } else {
      c = color(0, random(50, 150), random(200, 255), random(6));
      radius = random(40, 120);
    }
  }
  
  void updateParticle() {
    if (x < 0 || x > width || y < 0 || y > height) {
      x = random(width);
      y = random(height);
      x_vel = random(-0.5, 0.5);
      y_vel = random(-0.5, 0.5);
      if(jellyfish) {
        c = color(random(200, 255), random(50, 100), random(120, 240), random(50, 100));
        radius = random(10, 30);
      } else {
        c = color(0, random(50, 150), random(200, 255), random(6));
        radius = random(40, 120);
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
