class Particle {
  float x1, x2, y1, y2, angle, prev_angle, radius, radius_offset, vel;
  color c;
  
  Particle() {
    vel = random(0.001, 0.002);
    angle = random(1);
    prev_angle = angle - (vel / 2);
    radius = random(200);
    radius_offset = random(1, 5);
    x1 = (sin(2 * PI * angle) * radius) + width / 2;
    y1 = (cos(2 * PI * angle) * radius) + height / 2;
    x2 = (sin(2 * PI * prev_angle) * radius) + width / 2;
    y2 = (cos(2 * PI * prev_angle) * radius) + height / 2;
    c = color(random(0.7, 1), 0.7, random(0.9, 1));
  }
  
  void drawParticle() {
    strokeWeight(3.5);
    stroke(c);
    line(x1, y1, x2, y2);
    updateParticle();
  }
  
  void updateParticle() {
    x1 = (sin(2 * PI * angle) * radius) + width / 2;
    y1 = (cos(2 * PI * angle) * radius) + height / 2;
    x2 = (sin(2 * PI * prev_angle) * radius) + width / 2;
    y2 = (cos(2 * PI * prev_angle) * radius) + height / 2;
    prev_angle = angle;
    angle += vel;
    radius += radius_offset;
    
    if(x1 > width || x1 < 0 || y1 > height || y1 < 0) {
      vel = random(0.001, 0.002);
      angle = random(1);
      prev_angle = angle - (vel / 2);
      radius = random(200);
      radius_offset = random(1, 5);
      x1 = (sin(2 * PI * angle) * radius) + width / 2;
      y1 = (cos(2 * PI * angle) * radius) + height / 2;
      x2 = (sin(2 * PI * prev_angle) * radius) + width / 2;
      y2 = (cos(2 * PI * prev_angle) * radius) + height / 2;
    }
  }
}
