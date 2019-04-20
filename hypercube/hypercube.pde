ArrayList<Cube> cubes = new ArrayList<Cube>();
int num_cubes;

void setup() {
  size(768, 768, P3D);
  smooth(8);
  num_cubes = 5;
  stroke(255);
  strokeWeight(2);
  for(int i = 0; i < num_cubes; i++) {
    cubes.add(new Cube());
  }
}

void draw() {
  background(255);
  translate(width / 2, height / 2);
  
  for(Cube c : cubes) {
    c.display();
    c.update();
  }
}

class Cube {
  float size, x_pos, y_pos, rotate_x, rotate_y;
  color c;
  
  Cube() {
    size = 300;
    rotate_x = random(0.01);
    rotate_y = random(0.01);
    c = color(random(255), random(255), random(255), 50);
  }
  
  void display() {
    fill(c);
    rotateX(rotate_x);
    rotateY(rotate_y);
    box(size);
  }
  
  void update() {
    rotate_x += random(0.01);
    rotate_y += random(0.01);
  }
}
