ArrayList<Comet> comets = new ArrayList<Comet>();
ArrayList<Planet> planets = new ArrayList<Planet>();
float num_comets = random(20, 50);
float num_planets = random(1, 5);

void setup() {
  size(768, 768, P3D);
  background(0);
  strokeWeight(3);
  
  for(int i = 0; i < num_comets; i++) {
    comets.add(new Comet(random(((width / 2) + 100), ((width / 2) + 200)), random(((height / 2) + 100), ((height / 2) + 200))));
  }
  
  for(int i = 0; i < num_planets; i++) {
    planets.add(new Planet(random(((width / 2) + 50), ((width / 2) + 100)), random(((height / 2) + 50), ((height / 2) + 100))));
  }
}

void draw() {
  noStroke();
  fill(0, 0, 0, 25);
  rect(0, 0, width, height);
  
  translate(-75, -75);
  for(int i = 0; i < num_planets; i++) {
    Planet p = planets.get(i);
    p.display();
    p.update();
  }
  
  translate(-75, -(height /2 - 50));
  for(int i = 0; i < num_comets; i++) {
    Comet d = comets.get(i);
    d.display();
    d.update();
  }
}
