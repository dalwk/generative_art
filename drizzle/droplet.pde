class Droplet {
  float x1, x2, y1, y2, vel, y_offset, accel;
  float radius = 300;
  color c;
  
  Droplet(float _x, float _y) {
    vel = 4;
    x1 = _x;
    y1 = _y;
    y_offset = y1;
    accel = random(0.01, 0.04);
    c = color(random(140, 200), random(140, 200), 255);
  }

  void drawParticle() {
    updateParticle();
    stroke(c);
    strokeWeight(3.5);
  }
  
  void updateParticle() {
    if (y1 > height) {
      vel = 4;
      x1 = random(width);
      y1 = random(0 - height, 0);
    
      x2 = x1;
      y2 = y1;
      y_offset = y1;
      accel = random(0.001, 0.004);
      
      y1 = vel + y_offset; 
    }
    
    vel += random(1 + accel, 4 + accel);
    accel += accel * random(0.01, 0.04);

    x2 = x1;
    y2 = y1;
    
    y1 = vel + y_offset;
        
    line(x1, y1, x2, y2);  
  }
}
