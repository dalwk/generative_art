int rad = 75;
float num_lines = 100;
ArrayList<Particle> particles = new ArrayList<Particle>();
float greenCount = 0;
boolean greenUp = true;
float h = random(0, 360);
 
void setup() {
  size(768, 768); 
  noStroke();
  ellipseMode(RADIUS);  
    
  for(int i = 0; i < num_lines; i++) {
    particles.add(new Particle(width / 2 + random(-150, 150), (height / 2) + random(-125, 125)));
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
  fill(greenCount, 0, greenCount, 15);
  if(greenUp) {
    greenCount++;
    if(greenCount >= 130) {
      greenUp = !greenUp;
    }
  } else {
    greenCount--;
    if(greenCount <= 75) {
      greenUp = !greenUp;
    }
  }
  rect(0, 0, width, height);
}

void drawCenterCircle() {
  noStroke();
  fill(255, 255, 255, 75);
  drawGradient(width / 2, height/2);
}

void drawGradient(float x, float y) {
  int radius = 75;
  for (int r = radius; r > 0; --r) {
    fill(h, h, h, 3);
    ellipse(x, y, r, r);
    h = (h + 0.01);
  }
}
