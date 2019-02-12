ArrayList<Ball> balls;

void setup() {
  size(768, 768);
  balls = new ArrayList<Ball>();
  balls.add(new Ball(width/2, height/2, 100000));
}

void draw() {
  background(255);
  noStroke();

  for (int i = 0; i < balls.size (); i++) {
    Ball b = balls.get(i);
    update(b);
    
    if (b.remove) balls.remove(i--);
    
    if (b.divide) {
      float a = random(TWO_PI);
      balls.add(new Ball(b.x-cos(a)*b.r/2, b.y-sin(a)*b.r/2, b.m/2));
      balls.add(new Ball(b.x+cos(a)*b.r/2, b.y+sin(a)*b.r/2, b.m/2));
      balls.remove(i--);
    }
  }
}

void mouseClicked() {
  balls.add(new Ball(mouseX, mouseY, 100000));
}

class Ball {
  boolean remove, divide;
  float x, y, m, r, d;
  float a, v, t;
  float red, green, blue;
  
  Ball(float x, float y, float m) {
    this.x = x; 
    this.y = y;
    this.m = m;
    r = sqrt((m/PI));
    d = r*2;
    a = random(TWO_PI);
    v = random(0.001, 0.01);
    t = 30;
    red = random(0,255);
    green = random(0,255);
    blue = random(0,255);
  }
}

void update(Ball b) {
  b.x += cos(b.a)*b.d*b.v;
  b.y += sin(b.a)*b.d*b.v;
   
  b.divide = false;
  
  if (b.t > 0) b.t--;
  
  if (dist(mouseX, mouseY, b.x, b.y) < b.r && b.t == 0) {
    b.divide = true;
  }

  show(b.x, b.y, b.d, b.red, b.green, b.blue);
}

void show(float x, float y, float d, float red, float green, float blue) {
  fill(red, green, blue); 
  ellipse(x, y, d, d);
}
