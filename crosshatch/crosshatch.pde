ArrayList<Light> lights = new ArrayList<Light>();
int num_lights = 2000;

void setup() {
  size(768, 768);
  background(0);

  for (int i = 0; i < num_lights; i++) {
    lights.add(new Light(random(width), random(height)));
  }
}

void draw() {
  noStroke();
  fill(0, 0, 0, 10);
  rect(0, 0, width, height);
  
  for(Light l : lights) {
    l.display();
    l.update();
  }
}

class Light {
  float x, y, vel, r, g, b;
  boolean x_add, y_add;
  
  Light(float _x, float _y) {
    x = _x;
    y = _y;
    vel = 1;
    r = random(255);
    g = random(255);
    b = random(255);
    x_add = randomBool();
    y_add = randomBool();
  }
  
  boolean randomBool() {
    return random(1) > .5;
  }
  
  void display() {
    stroke(r, g, b);
    point(x, y);
  }
  
  void update() {
    if(x_add) {
      x += vel;
    } else {
      x -= vel;
    }
    
    if(y_add) {
      y += vel;
    } else {
      y -= vel;
    }
    
    if (x > width || y > height || x < 0 || y < 0) {
      x = random(width);
      y = random(height);
    }
  }
}
