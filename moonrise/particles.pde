class Particle {
  float x, x2, y, y2, x_vel, y_vel;
  int border_factor = 0;
  float color_r, color_g, color_b, alpha;
  
  Particle(float _x, float _y) {
    x = _x;
    y = _y;
    x2 = _x;
    y2 = _y;
    x_vel = random(-20, 20);
    y_vel = random(0, 0);
    color_r = 0;
    color_g = random(50, 150);
    color_b = 0;
    alpha = random(50, 100);
  }
  
  void updateParticle() {
    if ( y2 < 0 || y2 > 768 || x2 < 0 || x2 > 768 || alpha < 0) {
      x = width / 2 + random(-150, 150);
      y = (height / 2) + random(-125, 125);
      x2 = x;
      y2 = y;
      alpha = random(50, 100);
    }
    
    x2 += x_vel / random(20);
    y2 += y_vel;
  }
  
  void drawParticle() {
    stroke(color(color_r, color_g, color_b, alpha));
    alpha -= 1;
    strokeWeight(2);
    line(x, y, x2, y2);
  }
}
