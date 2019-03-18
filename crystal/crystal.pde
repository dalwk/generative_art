ArrayList<Point> points = new ArrayList<Point>();
int num_points = 10;

void setup() {
  size(768, 768, P3D);
  stroke(255);
  strokeWeight(2);
  smooth(8);
  
  for (int i = 0; i < num_points; i++) {
    points.add(new Point(random(width), random(height), random(-height, height)));
  }
}

void draw() {  
  background(0);
  
  for (int i = 0; i < points.size(); i++) {
    Point p1 = points.get(i);
    p1.update();
    p1.display();

    for (int j = 0; j < points.size(); j++) {
      Point p2 = points.get(j);
      line(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z);
    }    
  }
}
