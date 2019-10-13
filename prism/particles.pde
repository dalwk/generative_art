class Particle {
  float x, x2, y, y2, x_vel, y_vel, y2_vel;
  color c;
  int border_factor = 100;
  
  Particle(float _x, float _y, float _x2, float _y2) {
    x = _x;
    y = _y;
    x2 = _x2;
    y2 = _y2;
    x_vel = 0;
    y_vel = random(-0.5, 0.5);
    y2_vel = y_vel;
    c = color(random(255), random(255), random(255), random(50, 100));
  }
  
  void updateParticle() {
    if ( y < border_factor || y > (768 - border_factor)) {
      y_vel = -y_vel;
    }
    
    if ( y2 < border_factor || y2 > (768 - border_factor)) {
      y2_vel = -y2_vel;
    }
    
    y += y_vel;
    y2 += y2_vel;
  }
  
  void drawParticle() {
    stroke(c);
    strokeWeight(1);
    line(x, y, x2, y2);
  }
}
