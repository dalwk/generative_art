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

int nums = floor(random(300, 600));
int nums_outer = floor(random(10, 20));
int noiseScale = 200;

ArrayList<ArrayList<Particle>> outer;
float[][] outer_color = new float[nums_outer][3];

void setup() {
  size(768, 768);
  background(random(0,255), random(0,255), random(0, 255));
  noStroke();
  smooth(8);
  
  outer = new ArrayList();
  
  for(int i = 0; i < nums_outer; i++) {
    ArrayList<Particle> inner = new ArrayList<Particle>();
    for(int j = 0; j < 2; j++) {
      outer_color[i][j] = random(0, 255);
    }
    for(int k = 0; k < nums; k++){
      inner.add(new Particle(random(0, width),random(0,height)));
    }
    outer.add(inner);
  }
}

void draw() {
  
  for(int i = 0; i < nums_outer; i++) {
    ArrayList<Particle> inner_list = outer.get(i);
    fill(outer_color[i][0], outer_color[i][1], outer_color[i][2]);
    for(int j = 0; j < nums; j++){
      Particle p = inner_list.get(j);
      p.move();
      p.display(random(0, 1));
      p.checkEdge();
    }
  }
}
