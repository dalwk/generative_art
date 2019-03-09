ArrayList <Point> points = new ArrayList <Point> ();
int num = 7;
float b_c_r = random(0,255);
float b_c_g = random(0, 255);
float b_c_b = random(0, 255);

void setup () {
  size(768, 768);
  for (int i=0; i<num; i++) {
    points.add(new Point());
  }
  noStroke();
}

void draw () {
  background (b_c_r, b_c_g, b_c_b);

  for (int i = 0; i < num; i++) {
    Point p1 = points.get(i);
    p1.update();
    p1.display();

    for (int j = i + 1; j < points.size(); j++) {
      Point p2 = points.get(j);
      if (dist (p1.x1, p1.y1, p2.x1, p2.y1) < 500) {
        beginShape();
        vertex(p1.x1, p2.y1);
        vertex(p1.x2, p2.y2);
        vertex(p1.x3, p2.y3);
        vertex(p2.x1, p1.y3);
        vertex(p2.x3, p1.y3);
        vertex(p2.x3, p1.y3);
        endShape();
      }
    }
  }
}

class Point {
  float vel;
  float xdir, ydir;
  float p_r, p_g, p_b, p_a;
  float x1, x2, x3, y1, y2, y3;
  
  Point() {
    x1= random(width);
    x2= random(width);
    x3= random(width);
    y1= random(height);
    y2= random(height);
    y3= random(height);
    
    vel = random(0.5, 2);
    xdir = int(random(2))*2 -1;
    ydir = int(random(2))*2 -1;
    
    p_r = random(0, 255);
    p_g = random(0, 255);
    p_b = random(0, 255);
    p_a = random(70, 100);
  }
  
  void display () {
    fill (p_r, p_g, p_b, p_a);
  }
  
  void update () {
    x1 += vel * xdir;
    y1 += vel * ydir;
    x2 += vel * xdir;
    y2 += vel * ydir;
    x3 += vel * xdir;
    y3 += vel * ydir;
    
    if (x1 > width || x1 < 0) {
      xdir *= (-1);
    }
    
    if (y1 > height || y1 < 0) {
      ydir *= (-1);
    }
  }
}
