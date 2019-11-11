class Particle {
  float x, x2, y, y2, x_vel, y_vel;
  color c;
  int border_factor = 0;
  
  Particle(float _x, float _y) {
    x = _x;
    y = _y;
    x2 = _x;
    y2 = _y;
    x_vel = random(-20, 20);
    y_vel = random(-20, 0);
    c = color(random(200, 255), random(200, 255), 0, random(50, 100));
  }
  
  void updateParticle() {
    if ( y2 < 0 || y2 > 768 || x2 < 0 || x2 > 768) {
      //x = width / 2;
      //y = height / 2;
      x2 = x;
      y2 = y;
    }
    
    x2 += x_vel / random(4);
    y2 += y_vel;
  }
  
  void drawParticle() {
    stroke(c);
    strokeWeight(2);
    line(x, y, x2, y2);
  }
}
