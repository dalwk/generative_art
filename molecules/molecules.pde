class Molecule {

  color c;
  int radius;
  PVector position;
  PVector velocity;
  PVector acceleration;

  Molecule() {
    c = color(random(80, 255), random(80, 255), random(80, 255), random(175, 225));
    radius = int(random(5, 7));
    position = new PVector(random(20, width-20), random(20, height-20));
    velocity = new PVector(random(-2, 2), random(-2, 2));
    acceleration = new PVector(0, 0);
  }

  void display() {
    noStroke();
    fill(c);
    ellipse(position.x, position.y, 2*radius, 2*radius);
  }

  void move() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void checkEdges() {
    if ((position.x < radius) || (position.x > width - radius)) {
      velocity.x *= -1;
    }
    if ((position.y < radius) || (position.y > height - radius)) {
      velocity.y *= -1;
    }
  }
}

int numMol = 5000;
ArrayList<Molecule> molecules;

void setup() {
  size(768, 768);

  molecules = new ArrayList<Molecule>();
  for (int i = 0; i < numMol; i++) {
    molecules.add(new Molecule());
  }
}

void draw() {
  background(255);

  for (int i = 0; i < molecules.size()-1; i++) {
    Molecule m = molecules.get(i);
    m.move();
    m.display();
    m.checkEdges();
  }
}
