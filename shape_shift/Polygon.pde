class Polygon {
  float x, y, radius, r, g, b, a;
  int npoints;
  boolean color_up;
  
  Polygon(float _x, float _y, float _radius, int _npoints, float _r, float _g, float _b, float _a) {
    x = _x;
    y = _y;
    radius = _radius;
    npoints = _npoints;
    r = _r;
    g = _g;
    b = _b;
    a = _a;
  }
  
  void display() {
    fill(r, g, b, a);
    float angle = TWO_PI / npoints;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
  
  void update() {
    float n = random(100);
    if (n > 98) {
      npoints = floor(random(3, 8));
    }
    
    if (r >= 255 || g >= 255 || b >= 255 || a >= 255) {
      color_up = false;
    }
    if (r <= 0 || g <= 0 || b <= 0 || a <= 0) {
      color_up = true;
    }
 
    if (color_up) {
      r += random(15);
      g += random(15);
      b += random(15);
      a += random(15);
    } else {
      r -= random(15);
      g -= random(15);
      b -= random(15);
      a -= random(15);
    }
  }
}
