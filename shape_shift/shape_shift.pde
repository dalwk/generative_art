ArrayList<Polygon> polygons = new ArrayList<Polygon>();
float x, y, radius, r, g, b, a;
int npoints;

void setup() {  
  size(768, 768);
  smooth(8);  
  noStroke();
  
  npoints = 6;
  radius = 24;
  x = radius;
  y = radius;
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  
  for (int i = 0; i < (width / (radius * 2)); i++) {
    for (int j = 0; j < (height / (radius * 2)); j++) {
      polygons.add(new Polygon(x, y, radius, npoints, r, g, b, a));
      y += radius * 2;
    }
    x += radius * 2;
    y = radius;
  }
  
}

void draw() {
  background(255);

  for (Polygon p : polygons) {
    p.display();
    p.update();
  }
}
