ArrayList <Point> points = new ArrayList <Point> ();
int num = floor(random(25, 50));
float b_c_r = random(0,255);
float b_c_g = random(0, 255);
float b_c_b = random(0, 255);

void setup () {
  size(768, 768);
  for (int i=0; i<num; i++) {
    points.add(new Point(random(width), random(height), random(0, 255), random(0, 255), random(0, 255), random(10, 100)));
  }
}

void draw () {
  background (b_c_r, b_c_g, b_c_b);

  for (int i = 0; i < num; i++) {
    Point p1 = points.get(i);
    p1.update();
    p1.display();

    for (int j = i + 1; j < points.size(); j++) {
      Point p2 = points.get(j);
      if (dist (p1.x, p1.y, p2.x, p2.y) < 200) {
        beginShape();
        vertex(p1.x, p1.y);
        vertex(p2.x, p2.y);
        vertex(width / 2, height / 2);
        endShape();
      }
    }
  }
}

class Point {
  float x, y;
  float vel;
  float xdir, ydir;
  float p_r, p_g, p_b, p_a;
  
  Point(float _x, float _y, float _p_r, float _p_g, float _p_b, float _p_a) {
    x= _x;
    y= _y;
    
    vel = random(0.5, 2);
    xdir = int(random(2))*2 -1;
    ydir = int(random(2))*2 -1;
    
    p_r = _p_r;
    p_g = _p_g;
    p_b = _p_b;
    p_a = _p_a;
  }
  
  void display () {
    fill (p_r, p_g, p_b, p_a);
  }
  
  void update () {
    x += vel * xdir;
    y += vel * ydir;
    
    if (x > width || x < 0) {
      xdir *= (-1);
    }
    
    if (y > height || y < 0) {
      ydir *= (-1);
    }
  }
}
