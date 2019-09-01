boolean blueUp;
float blueCount;
ArrayList<Particle> particles = new ArrayList<Particle>();
int num_leaves, num_jellyfish;

void setup() {
  size(768, 768, P3D);
  smooth(8);
  noStroke();
  background(0);
  
  blueCount = 0;
  blueUp = true;
  
  num_leaves = 800;
  num_jellyfish = 180;
  
  for(int i = 0; i < num_leaves; i++) {
    particles.add(new Particle(random(width), random(height), false));
  }
  
  for(int i = 0; i < num_jellyfish; i++) {
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
  fill(0, blueCount / 4, blueCount / 2, 25);
  if(blueUp) {
    blueCount++;
    if(blueCount >= 120) {
      blueUp = !blueUp;
    }
  } else {
    blueCount--;
    if(blueCount <= 40) {
      blueUp = !blueUp;
    }
  }
  rect(0, 0, width, height);
}
