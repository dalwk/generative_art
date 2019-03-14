class Comet {
  float x, y, z, r, g, b, a , rotation;
  
  Comet(float _x, float _y) {
    x = _x;
    y = _y;
    z = 0;
    r = random(255);
    g = random(255);
    b = random(255);
    a = random(255);
    
    rotation = 0;
  }
  
  void display() {
    stroke(r, g, b, a);
    point(x, y, z);
  }
  
  void update() {
    x += cos(radians(rotation))*(width/2+100) / 100;
    y += sin(radians(rotation))*(width/2+100) / 100;
    rotation++;    
  }
}
