class Point {
  float x, y, r, g, b, a;
  boolean x_dir, y_dir;
  
  Point(float _x, float _y) {
    x = _x;
    y = _y;
    r = random(255);
    g = random(255);
    b = random(255);
    a = random(255);
    x_dir = true;
    y_dir = true;
  }
  
  void display () {
    fill (r, g, b, a);
  }
  
  void update() {
    if(x_dir) {
      x += random(1, 4);
    } else {
      x -= random(1, 4);
    }
    
    if(y_dir) {
      y += random(1, 4);
    } else {
      y -= random(1, 4);
    }
    
    if(x > width || x < 0) {
      x_dir = !x_dir;
    }
    
    if(y > height || y < 0) {
      y_dir = !y_dir;
    }
  }
}
