ArrayList<Particle> particles = new ArrayList<Particle>();
int num_lines;
int border_factor = 100;

void setup() {
  size(768, 768);
  smooth(8);
  noStroke();
  background(0);
  
  num_lines = 40;
  
  for(int i = 0; i < num_lines; i++) {
    particles.add(new Particle(100, random(border_factor, height - border_factor), width - 100, random(border_factor, height - border_factor)));
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
  noStroke();
  fill(255, 255, 255, 5);
  rect(0, 0, width, height);
  stroke(0);
  strokeWeight(2);
  line(border_factor, border_factor, width - border_factor, border_factor);
  line(border_factor, height - border_factor, width - border_factor, height - border_factor);
  line(border_factor, border_factor, border_factor, height - border_factor);
  line(width - border_factor, height - border_factor, width - border_factor, border_factor);
}
