ArrayList<Point> points = new ArrayList<Point>();
int num_points = 20;

void setup() {
  size(768, 768);
  stroke(255);
  strokeWeight(0.25);
  smooth(8);
  
  for (int i = 0; i < num_points; i++) {
    points.add(new Point(random(width), random(height)));
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
      if (dist (p1.x, p1.y, p2.x, p2.y) < 150) {
        beginShape();
        vertex(p1.x, p2.y);
        vertex(p2.x, p1.y);
        vertex(width /2, height /2);
        endShape(CLOSE);
      }
    }    
  }
}
