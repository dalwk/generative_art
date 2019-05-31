class Particle {
  float x1, x2, y1, y2, angle, vel, y_offset;
  float radius = 300;
  color c;
  
  Particle(float _x, float _y, float _a) {
    vel = 0.004;
    x1 = _x;
    y1 = _y;
    y_offset = y1;
    angle = _a;
    c = color(random(40, 255), random(30), random(30, 80));
  }

  void drawParticle() {
    updateParticle();
    stroke(c);
    strokeWeight(3.5);
  }
  
  void updateParticle() {
    if (x1 > width) {
      x1 = 0;
      y1 = random(-radius, height + radius);
    
      x2 = x1;
      y2 = y1;
      y_offset = y1;
      
      x1 += 0.5;
      y1 = (sin(2 * PI * angle) * radius) + y_offset;
    }
    
    x2 = x1;
    y2 = y1;
    
    x1 += 0.5;
    y1 = (sin(2 * PI * angle) * radius) + y_offset;
   
    angle += vel;
    
    line(x1, y1, x2, y2);  
  }
  
  void initialDrawParticle() {
    x2 = x1;
    y2 = y1;
    
    x1 += 0.5;
    y1 = (sin(2 * PI * angle) * radius) + y_offset;
   
    angle += vel;
  }
}
