float dimension, count, thickness, timeFactor, blackCount;
boolean blackUp;
ArrayList<Particle> particles = new ArrayList<Particle>();

void setup() {
  size(768, 768);
  colorMode(HSB, 1);
  smooth(8);
  background(0);

  dimension = 768;
  count = 2000;
  thickness = 1.2;
  timeFactor = 2;
    
  blackCount = 0;
  blackUp = true;
  
  for(int i = 0; i < count; i++) {
    particles.add(new Particle());
  }
}

void draw() {
  updateParticles();
  noStroke();
  colorMode(RGB, 255);
  fill(blackCount, blackCount, blackCount, 15);
  if(blackUp) {
    blackCount++;
    if(blackCount >= 30) {
      blackUp = !blackUp;
    }
  } else {
    blackCount--;
    if(blackCount <= 0) {
      blackUp = !blackUp;
    }
  }
  rect(0, 0, width, height);
  strokeWeight(thickness);
  for(int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    stroke(p.c);
    line(p.pos_x, p.pos_y, p.pos_x- timeFactor * p.vel_x, p.pos_y - timeFactor * p.vel_y);
  }
}

void updateParticles() {
  for(int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.pos_x = p.pos_x + p.vel_x * timeFactor;
    p.pos_y = p.pos_y + p.vel_y * timeFactor;
    if (p.pos_x > width || p.pos_x < 0 || p.pos_y > height || p.pos_y < -20) {
      p.pos_x = width / 2;
      p.pos_y = -20;
      p.vel_x = p.topSpeed * random(-PI, PI);
      p.vel_y = p.topSpeed * random(-PI, PI);
    }
  }
}
