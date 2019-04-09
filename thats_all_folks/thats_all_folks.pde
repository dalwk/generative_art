float wide, high, vel;
color c1, c2, c3;
int ring_count, offset;

void setup() {
  size(768, 768);
  smooth(8);
  strokeWeight(3);
  
  c1 = color(random(255), random(255), random(255));
  c2 = color(random(255), random(255), random(255));
  c3 = color(random(255), random(255), random(255));
  
  background(random(255), random(255), random(255));
  
  wide = 0;
  high = 0;
  vel = 1;
  
  ring_count = floor(random(2, 8));
  offset = ring_count * 50;
}

void draw() {
   
  fill(c3);

  for(int i = 0; i < ring_count; i++) {
    ellipse(width / 2, height / 2, wide + offset, high + offset);
    offset -= 50;
  }
  
  offset = ring_count * 50;

  fill(c2);
  ellipse(width / 2, height / 2, wide, high);
  
  updateEllipse();
}

void updateEllipse() {
  wide += vel;
  high += vel;
  
  vel = vel * random(1.00, 1.1);
  
  if(wide > width + 150 || high > height + 150) {
    vel = 1;
    wide = 0;
    high = 0;
    
    background(c2);
    c1 = c2;
    c2 = color(random(255), random(255), random(255));
    c3 = color(random(255), random(255), random(255));
    
    ring_count = floor(random(2, 8));
    offset = ring_count * 50;
  }
}
