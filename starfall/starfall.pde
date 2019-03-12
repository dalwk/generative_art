class Dot {
  float x, y, z, vel, r, g, b, a;
  
  Dot(float _x, float _y, float _z) {
    x = _x;
    y = _y;
    z = _z;
    vel = 0;
    r = random(255);
    g = random(255);
    b = random(255);
    a = random(255);
  }
  
  void display() {
    stroke(r, g, b);
    point(x, y, z);
  }
  
  void update() {
    y += vel;
    vel += random(0.001, 0.01);
    
    if(y >= height) {
      x = random(width);
      y = random(height);
      vel = 0;
    }
  }
}

ArrayList<Dot> dots = new ArrayList<Dot>();
int num_dots = 10000;

void setup() {
  size(768, 768, P3D);
  strokeWeight(2);
  smooth(8);
  
  for(int i = 0; i < num_dots; i++) {
    dots.add(new Dot(random(width), random(height), random(width * 2)));
  }
}

void draw() {
  background(0);

  for(int i = 0; i < dots.size(); i++) {
    Dot d = dots.get(i);
    d.display();
    d.update();
  }
}
