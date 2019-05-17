ArrayList<Particle> particles = new ArrayList<Particle>();
int num_particles, blueCount;
boolean blueUp;

void setup() {
  size(768, 768);
  smooth(8);
  colorMode(HSB, 1);
  background(0);
  
  num_particles = 6000;
  blueCount = 0;
  blueUp = true;
  
  for(int i = 0; i < num_particles; i++) {
    particles.add(new Particle());
  }
}

void draw() {
 noStroke();
 colorMode(RGB, 255);
  fill(blueCount, 0, blueCount, 40);
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
 
 for(Particle p : particles) {
   p.drawParticle();
 }
}
