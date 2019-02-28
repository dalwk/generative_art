class Particle {
  float x, y, speed;
  PVector dir, vel, pos;
  
  Particle(float x, float y) {
    this.x = x;
    this.y = y;
    speed = 0.4;
    dir = new PVector(0, 0);
    vel = new PVector(0, 0);
    pos = new PVector(x, y);
  }
  
  void display(float r) {
    ellipse(this.pos.x, this.pos.y, r, r);
  }
  
  void move() {
    float angle = noise(this.pos.x/noiseScale, this.pos.y/noiseScale)*TWO_PI*noiseScale;
    this.dir.x = cos(angle);
    this.dir.y = sin(angle);
    this.vel = this.dir.copy();
    this.vel.mult(this.speed);
    this.pos.add(this.vel);
  }
  
  void checkEdge() {
     if(this.pos.x > width || this.pos.x < 0 || this.pos.y > height || this.pos.y < 0){
      this.pos.x = random(50, width);
      this.pos.y = random(50, height);
    }
  }
}

ArrayList<Particle> particles_a;
ArrayList<Particle> particles_b;
ArrayList<Particle> particles_c;
int nums = floor(random(300, 600));
int noiseScale = 200;
float[] p_a_color = new float[]{random(0,255), random(0,255), random(0, 255)};
float[] p_b_color = new float[]{random(0,255), random(0,255), random(0, 255)};
float[] p_c_color = new float[]{random(0,255), random(0,255), random(0, 255)};

void setup() {
  size(768, 768);
  background(random(0,255), random(0,255), random(0, 255));
  noStroke();
  smooth(8);
  
  particles_a = new ArrayList<Particle>();
  particles_b = new ArrayList<Particle>();
  particles_c = new ArrayList<Particle>();

  for(int i = 0; i < nums; i++){
    particles_a.add(new Particle(random(0, width),random(0,height)));
    particles_b.add(new Particle(random(0, width),random(0,height)));
    particles_c.add(new Particle(random(0, width),random(0,height)));
  }
}

void draw() {
  for(int i = 0; i < nums; i++) {    
    fill(p_a_color[0], p_a_color[1], p_a_color[2]);
    Particle p_a = particles_a.get(i);
    p_a.move();
    p_a.display(random(0, 1));
    p_a.checkEdge();
    
    fill(p_b_color[0], p_b_color[1], p_b_color[2]);
    Particle p_b = particles_b.get(i);
    p_b.move();
    p_b.display(random(0, 2));
    p_b.checkEdge();
    
    //fill(p_c_color[0], p_c_color[1], p_c_color[2]);
    //Particle p_c = particles_c.get(i);
    //p_c.move();
    //p_c.display(random(0, 5));
    //p_c.checkEdge();
  }
}
