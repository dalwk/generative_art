class Bike {
  float x, y, radius, r, g, b, x_max, y_max, x_min, y_min;
  int stage;
  
  Bike(float _x, float _y, float _radius) {
    x = _x;
    y = _y;
    radius = _radius;
    r = random(255);    
    g = random(255);
    b = random(255);
    x_max = width - _x;
    y_max = height - _y;
    x_min = _radius + _x;
    y_min = _radius + _y;
    stage = 0;
  }
  
  void display() {
    fill(r, g, b);
    rect(x, y, radius, radius);
  }
  
  void update() {
    
    if (stage == 0) {
      x += random(3, 8);
      if (x >= x_max - (radius * 2)) {
        stage = 1;
      }
    } else if (stage == 1) {
      y += random(3, 8);
      if (y >= y_max - (radius * 2)) {
        stage = 2;
      }
    } else if (stage == 2) {
      x -= random(3, 8);
      if (x <= x_min + (radius * 2)) {
        stage = 3;
      }
    } else {
      y -= random(3, 8);
      if (y <= y_min + (radius * 2)) {
        stage = 0;
        y_min += radius * 2;
        x_min += radius * 2;
        y_max -= radius * 2;
        x_max -= radius * 2;
      }
    }
  }
}
