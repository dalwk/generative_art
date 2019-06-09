boolean greenUp;
float greenCount;
ArrayList<Particle> particles = new ArrayList<Particle>();
int num_leaves, num_fireflies;

void setup() {
  size(768, 768, P3D);
  smooth(8);
  noStroke();
  background(0);
  
  greenCount = 0;
  greenUp = true;
  
  num_leaves = 800;
  num_fireflies = 180;
  
  for(int i = 0; i < num_leaves; i++) {
    particles.add(new Particle(random(width), random(height), false));
  }
  
  for(int i = 0; i < num_fireflies; i++) {
    particles.add(new Particle(random(width), random(height), true));
  }
}

void draw() {
  for(Particle p : particles) {
    p.drawParticle();
    p.updateParticle();
  }
  updateBackground();
}

void updateBackground() {
  fill(0, greenCount / 2, greenCount / 2, 15);
  if(greenUp) {
    greenCount++;
    if(greenCount >= 120) {
      greenUp = !greenUp;
    }
  } else {
    greenCount--;
    if(greenCount <= 40) {
      greenUp = !greenUp;
    }
  }
  rect(0, 0, width, height);
}
