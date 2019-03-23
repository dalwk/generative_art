float x, y, wide, count;
ArrayList<Bar> bar_list = new ArrayList<Bar>();

void setup() {
  size(768, 768);
  background(255);
  smooth(8);
  
  x = 0;
  y = 0;
  wide = 20;
  count = width / wide + 1;
    
  for(int i = 0; i < count; i++) {
    bar_list.add(new Bar(x , y, wide));
    x += wide;
  }
}

void draw() {
  for(int i = 0; i < bar_list.size(); i++) {
    Bar bar = bar_list.get(i);
    bar.display();
    bar.update();
  }
  delay(40);
}

class Bar {
  float x, y, y2, wide, r, g, b, a, yOff;
  
  Bar(float _x, float _y, float _wide) {
    x = _x;
    y = _y;
    wide = _wide;
    r = random(255);
    g = random(255);
    b = random(255);
    a = random(255);
    y2 = _y + (height / 2);
    yOff = height;
  }
  
  void display() {
    fill(r, g, b);
    noStroke();
    rect(x, y - wide, wide, height + wide * 2, wide);
    fill(0, 0, 0, a);
    stroke(255);
    rect(x, y2 - wide, wide, height + wide * 2 / 4, wide);
  }
  
  void update() {
    y2 = random(-yOff, yOff);
  }

}
