int num_x, num_y, dimension, x, y;
float check;
Rectangle[][] r_arr;

void setup() {
  size(768, 768);
  noStroke();
  fill(random(255), random(255), random(255));
  
  dimension = 8;
  num_x = (width / dimension) + 1;
  num_y = (height / dimension) + 1;
  r_arr = new Rectangle[num_x][num_y];
  x = 0;
  y = 0;
  
  for(int i = 0; i < num_x; i++) {
    for(int j = 0; j < num_y; j++) {
      r_arr[i][j] = new Rectangle(x, y, dimension);
      y += dimension;
    }
    x += dimension;
    y = 0;
  }
}

void draw() {
  for(int i = 0; i < num_x; i++) {
    for(int j = 0; j < num_y; j++) {
      r_arr[i][j].display();
      check = random(10);
      if (check > 8) {
        r_arr[i][j].update();
      }
    }
  }
  delay(200);
}

class Rectangle {
  
  int x, y, d;
  
  Rectangle(int _x, int _y, int _d) {
    d = _d;
    x = _x;
    y = _y;
  }
  
  void display() {
    rect(x, y, d, d);
  }
  
  void update() {
    fill(random(255), random(255), random(255));
  }
}
