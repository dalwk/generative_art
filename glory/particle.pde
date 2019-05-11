class Particle {
  float pos_x, pos_y, shade, topSpeed, vel_x, vel_y;
  color c;
  
  Particle() {
    pos_x = width / 2;
    pos_y = -20;
    shade = random(0.1, 0.25);
    topSpeed = random(0.9, 1);
    c = color(shade, 0.7, topSpeed);
    vel_x = topSpeed * random(-PI, PI);
    vel_y = topSpeed * random(-PI, PI);
  }
}
