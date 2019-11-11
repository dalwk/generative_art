int rad = 50;
float num_lines = 600;
ArrayList<Particle> particles = new ArrayList<Particle>();
float greenCount = 0;
boolean greenUp = true;
 
void setup() {
  size(768, 768); 
  noStroke();
  ellipseMode(RADIUS);  
    
  for(int i = 0; i < num_lines; i++) {
    particles.add(new Particle(width / 2, height));
  }
}
 
void draw() {
  for(Particle p : particles) {
    p.drawParticle();
    p.updateParticle();
  }
  
  drawCenterCircle();
  updateBackground();
}

void updateBackground() {
  fill(greenCount, greenCount / 2, 0, 15);
  if(greenUp) {
    greenCount++;
    if(greenCount >= 200) {
      greenUp = !greenUp;
    }
  } else {
    greenCount--;
    if(greenCount <= 80) {
      greenUp = !greenUp;
    }
  }
  rect(0, 0, width, height);
}

void drawCenterCircle() {
  noStroke();
  fill(255, 255, 255);
  ellipse(width / 2, height, rad, rad);
}
