class Point {
  float x, y, z, r, g, b, a;
  boolean x_dir, y_dir, z_dir;
  
  Point(float _x, float _y, float _z) {
    x = _x;
    y = _y;
    z = _z;
    r = random(255);
    g = random(255);
    b = random(255);
    a = random(255);
    x_dir = true;
    y_dir = true;
    z_dir = true;
  }
  
  void display () {
    stroke(r, g, b, a);
  }
  
  void update() {
    if(x_dir) {
      x += random(0.1, 2);
    } else {
      x -= random(0.1, 2);
    }
    
    if(y_dir) {
      y += random(0.1, 2);
    } else {
      y -= random(0.1, 2);
    }
    
    if(z_dir) {
      z += random(0.1, 2);
    } else {
      z -= random(0.1, 2);
    }
    
    if(x > width || x < 0) {
      x_dir = !x_dir;
    }
    
    if(y > height || y < 0) {
      y_dir = !y_dir;
    }
    
    if(z > height || z < -height) {
      z_dir = !z_dir;
    }
  }
}
