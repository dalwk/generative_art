Cube[] cube = new Cube[64];
float x, y;

void setup() {
  size(768, 768, P3D);
  smooth(8);
  stroke(255);
  strokeWeight(1);
  x = 68;
  y = 68;
  
  for (int i = 1; i <= cube.length; i++) {
    cube[i - 1] = new Cube(x, y, random(0.01, 0.03), random(0.01, 0.03), random(0.01, 0.03));
    if(i % 8 == 0) {
      x = 68;
      y += 90;
    } else {
      x += 90;
    }
  }
}

void draw() {
  background(255);
  for (int i = 0; i < cube.length; i++) {
    cube[i].update();
    cube[i].display();     
  }
}

class Cube {
  float x, y, z, size, xAngle, yAngle, zAngle, xSpeed, ySpeed, zSpeed;
  color c;

  Cube(float _x, float _y, float _xSpeed, float _ySpeed, float _zSpeed) {
    x = _x;
    y = _y;
    z = 0;
    size = 50;
    c = color(random(255), random(255), random(255), 100);
    xSpeed = _xSpeed;
    ySpeed = _ySpeed;
    zSpeed = _zSpeed;
    xAngle = 0;
    yAngle = 0;
    zAngle = 0;
  }

  void update() {
    xAngle += xSpeed;
    yAngle += ySpeed;
    zAngle += zSpeed;
  }

  void display() {
    pushMatrix();
    translate(x, y, z);
    rotateX(xAngle);
    rotateY(yAngle);
    rotateZ(zAngle);
    fill(c);
    box(size);
    popMatrix();
  }
}
