float dimension, count, viewRadius, thickness, timeFactor, attractionSkew, dimensionRadius, collisionDistance, blueCount;
boolean blueUp;
ArrayList<Particle> particles = new ArrayList<Particle>();

void setup() {
  size(768, 768);
  colorMode(HSB, 1);
  smooth(8);
  background(0);

  dimension = 768;
  count = 550;
  thickness = 1.5;
  timeFactor = 5;
  attractionSkew = 0.25;
  
  dimensionRadius = dimension / 2;
  viewRadius = 250000;
  collisionDistance = 4 * thickness * thickness;
  
  blueCount = 0;
  blueUp = true;
  
  for(int i = 0; i < count; i++) {
    particles.add(new Particle());
  }
}

void draw() {
  updateParticles();
  noStroke();
  colorMode(RGB, 255);
  fill(0, 0, blueCount, 15);
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
  strokeWeight(thickness);
  for(int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    stroke(p.c);
    line(p.pos_x, p.pos_y, p.pos_x- timeFactor * p.vel_x, p.pos_y - timeFactor * p.vel_y);
  }
}

void updateParticles() {
  for(int i = 1; i < particles.size(); i++) {
    Particle p = particles.get(i);
    for(int j = 0; j < i; j++) {
      Particle p2 = particles.get(j);
      float dx = (p2.pos_x - p.pos_x + 3 * dimensionRadius) % dimension - dimensionRadius;
      float dy = (p2.pos_y - p.pos_y + 3 * dimensionRadius) % dimension - dimensionRadius;
      float d2 = sq(dx) + sq(dy);
      if( d2 < collisionDistance ) {
        p.vel_x -= dx / (d2 + 10);
        p.vel_y -= dy / (d2 + 10);
        p2.vel_x += dx / (d2 + 10);
        p2.vel_y += dy / (d2 + 10);
      } else if( d2 < viewRadius ) {
        float attraction = cos((p2.shade - p.shade + attractionSkew) * TAU);
        p.vel_x += attraction * dx / (d2 + 500);
        p.vel_y += attraction * dy / (d2 + 500);
        attraction = cos((p.shade - p2.shade + attractionSkew) * TAU);
        p2.vel_x -= attraction * dx / (d2 + 500);
        p2.vel_y -= attraction * dy / (d2 + 500);
      }
    }
  }
  for(int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    float direction = atan2(p.vel_y, p.vel_x);
    float speed = sqrt(p.vel_x * p.vel_x + p.vel_y * p.vel_y);
    if( speed > p.topSpeed ) speed = p.topSpeed;
    p.vel_x = speed * cos(direction);
    p.vel_y = speed * sin(direction);
    p.pos_x = (p.pos_x + p.vel_x * timeFactor + dimension) % dimension;
    p.pos_y = (p.pos_y + p.vel_y * timeFactor + dimension) % dimension;
  }
}
