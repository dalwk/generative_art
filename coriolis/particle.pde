class Particle {
  float pos_x, pos_y, shade, topSpeed, speed, vel_x, vel_y;
  color c;
  
  Particle() {
    float angle = random(0, 360) * PI / 180;
    float length = random(min(width, height) / 2);
    pos_x = cos(angle) * length;
    pos_y = sin(angle) * length;
    shade = random(0.5, 0.8);
    topSpeed = random(1 - 0.1, 1);
    c = color(shade, 0.7, topSpeed);
    vel_x = topSpeed * cos(random(TAU));
    vel_y = topSpeed * sin(random(TAU));
  }
}
