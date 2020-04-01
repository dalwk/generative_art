ArrayList<Droplet> droplets = new ArrayList<Droplet>();
float num_droplets = 4000;
int blueCount;
boolean blueUp;

void setup() {
  size(1536, 768);
  smooth(8);
  background(0);
  blueCount = 0;
  blueUp = true;
  
  for(int i = 0; i < num_droplets; i++) {
    droplets.add(new Droplet(random(width), random(0 - height, 0)));
  }
}

void draw() {
  noStroke();
  fill(0, blueCount / 4, blueCount, 15);
  if(blueUp) {
    blueCount++;
    if(blueCount >= 120) {
      blueUp = !blueUp;
    }
  } else {
    blueCount--;
    if(blueCount <= 80) {
      blueUp = !blueUp;
    }
  } 
  rect(0, 0, width, height);
  
  for(Droplet d : droplets) {
    d.drawParticle();
  }
}
