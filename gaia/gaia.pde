ArrayList<Particle> particles = new ArrayList<Particle>();
int num_particles, greenCount;
boolean greenUp;

void setup() {
  size(768, 768);
  smooth(8);
  colorMode(HSB, 1);
  background(0);

  num_particles = 2000;
  greenCount = 0;
  greenUp = true;
  
  for(int i = 0; i < num_particles; i++) {
    particles.add(new Particle());
  }
}

void draw() {
 noStroke();
 colorMode(RGB, 255);
  fill(0, greenCount,  0, 35);
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
 
 for(Particle p : particles) {
   p.drawParticle();
 } 
}
