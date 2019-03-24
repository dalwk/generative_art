ArrayList<Bike> bikes = new ArrayList<Bike>();
int num_bikes;
float radius, x, y;

void setup() {
  size(768, 768);
  smooth(8);
  background(0);
  noStroke();
  
  num_bikes = 8;
  radius = 10;
  x = radius;
  y = radius;
  
  for(int i = 0; i < num_bikes; i++) {
    bikes.add(new Bike(x, y, radius));
    x += radius;
    y += radius;
  }
}

void draw() {
  fill(0, 0, 0, 10);
  rect(0, 0, width, height);
  
  for(int i = 0; i < bikes.size(); i++) {
    Bike b = bikes.get(i);
    b.display();
    b.update();
  }
}
