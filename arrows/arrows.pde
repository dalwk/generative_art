class Shape {
  
  float x, y, z, r, g, b, a;
  boolean direction;
  
  Shape() {
    x = random(width);
    y = random(height);
    z = random(width / 2 + height / 2);
    r = random(255);
    g = random(255);
    b = random(255);
    a = random(255);
    
    direction = true;
  }
  
  void display() {
    fill(r, g, b, a);
    beginShape();
    vertex(x, y);
    vertex(x, z);
    vertex(y, z);
    vertex(y, x);
    vertex(z, x);
    vertex(z, y);
    endShape(CLOSE);
  }
  
  void update() {
    if( x > width || x > height || y > width || y > height || z > width || z > height || x < 0 || x < 0 || y < 0 || y < 0 || z < 0 || z < 0) {
      direction = !direction;
    }
    
    if (direction) {
      x += 1;
      y += 1;
      z += 1;
    } else {
      x -= 1;
      y -= 1;
      z -= 1;
    }
  }
}

ArrayList<Shape> shapes = new ArrayList<Shape>();
float num_shapes;
float r, g, b;

void setup() {
  size(768, 768);
  r = random(255);
  g = random(255);
  b = random(255);
  stroke(255);
  smooth(8);
  
  num_shapes = random(5, 10);
  for(int i = 0; i < num_shapes; i++) {
    shapes.add(new Shape());
  }
}

void draw() {
  background(r, g, b);
  for(int i = 0; i < num_shapes; i++) {
    Shape s = shapes.get(i);
    s.display();
    s.update();
  }
}
