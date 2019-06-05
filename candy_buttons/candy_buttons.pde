PVector[][] buttons;
float columns, rows;

void setup() {
  size(768, 768);
  
  columns = width / 20;
  rows = height / 20;
  
  buttons = new PVector[floor(columns)][floor(rows)];
  
  for (int x = 0; x < columns; x++) {
    for (int y = 0; y < rows; y++) {
      buttons[x][y] = new PVector(map(x, 8, columns - 8, width * 0.1, width * 0.9), map(y, 8, rows - 8, height * 0.1, height * 0.9), map(x * y, 0, columns * rows, (float) Math.PI, (float) Math.PI * 3));
    }
  }
}

void draw() {
  
  background(255);
  
  for (int x = 0; x < columns; x++) {
    for (int y = 0; y < rows; y++) {
      push();
      noStroke();
      fill(y * 20, x * 10, y * 5);
      translate(sin(buttons[x][y].z) * 50, sin(buttons[x][y].z) * 50);
      ellipse(buttons[x][y].x, buttons[x][y].y, abs(sin(buttons[x][y].z)) * rows / 2, abs(sin(buttons[x][y].z)) * rows / 2);
      buttons[x][y].z -= 0.03;
      pop();
    }
  }
}
