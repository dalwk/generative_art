ArrayList<Particle> particles = new ArrayList<Particle>();
int num_lines;
int border_factor = -100;
float zoom, velZoom;

void setup() {
  size(768, 768);
  smooth(8);
  noStroke();
  background(0);
  
  zoom = 1;
  velZoom = random(0.025)*1;
  
  num_lines = 100;
  
  for(int i = 0; i < num_lines; i++) {
    particles.add(new Particle(0, random(border_factor, height - border_factor), width, random(border_factor, height - border_factor)));
  }
}

void draw() {
  translate(width/2, height/2);
  scale(zoom);
  translate(-width/2, -height/2);
  zoom += velZoom;
  for(Particle p : particles) {
    p.drawParticle();
    p.updateParticle();
  }
  updateBackground();
}

void updateBackground() {
  noStroke();
  fill(0, 0, 0, 5);
  rect(0, 0, width, height);
}
