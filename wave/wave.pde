ArrayList<Particle> particles = new ArrayList<Particle>();
float num_particles = 4000;
//float num_particles = 10;
float angle = random(1);
boolean redUp;
int redCount;

void setup() {
  size(1000, 768);
  background(0);
  redCount = 0;
  redUp = true;
  
  for(int i = 0; i < num_particles; i++) {
    particles.add(new Particle(random(width), random(-300, height + 300), angle));
  }
  
  for(Particle p : particles) {
    p.initialDrawParticle();
  }
}

void draw() {
  noStroke();
  fill(redCount, redCount / 4, 0, 15);
  if(redUp) {
    redCount++;
    if(redCount >= 100) {
      redUp = !redUp;
    }
  } else {
    redCount--;
    if(redCount <= 30) {
      redUp = !redUp;
    }
  } 
  rect(0, 0, width, height);
  
  for(Particle p : particles) {
    p.drawParticle();
  }
}
