class YLine {
  float x1, x2, y1, y2, x_vel, weight;
  
  YLine() {
    x1 = random(width);
    x2 = x1;
    y1 = 0;
    y2 = height;
    x_vel = random(-3, 3);
    weight = 3;
  }
  
  YLine(float _x1, float _x_vel) {
    x1 = _x1;
    x2 = x1;
    y1 = 0;
    y2 = height;
    x_vel = _x_vel;
    weight = 3;
  }
  
  void draw_line() {
    update_line();
    strokeWeight(weight);
    line(x1, y1, x2, y2);
  }
  
  void update_line() {
    if(x1 < 0 || x1 > width) {
      x_vel = x_vel * -1;
    }
    x1 += x_vel;
    x2 = x1;
  }
}
