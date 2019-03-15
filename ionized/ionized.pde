ArrayList<Particle> particles = new ArrayList<Particle>();
float num_particles, radius, y;

void setup() {
  size(768, 768);
  noStroke();
  smooth(8);
  background(0);
  
  radius = random(5, 10);
  num_particles = (height / radius) + 1;
  y = 0;
  
  for(int i = 0; i < num_particles; i++) {
    particles.add(new Particle(y, radius));
    y += radius;
  }
}

void draw() {
  fill(0, 0, 0, 50);
  rect(0, 0, width, height);
  
  for(int i = 0; i < num_particles; i++) {
    Particle b = particles.get(i);
    b.display();
    b.update();
  }
}
