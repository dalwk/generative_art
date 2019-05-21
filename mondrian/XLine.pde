class XLine {
  float x1, x2, y1, y2, y_vel, weight;
  
  XLine() {
    x1 = 0;
    x2 = width;
    y1 = random(height);
    y2 = y1;
    y_vel = random(-3, 3);
    weight = 3;
  }
  
  XLine(float _y1, float _y_vel) {
    x1 = 0;
    x2 = width;
    y1 = _y1;
    y2 = y1;
    y_vel = _y_vel;
    weight = 3;
  }
  
  void draw_line() {
    update_line();
    strokeWeight(weight);
    line(x1, y1, x2, y2);
  }
  
  void update_line() {
    if(y1 < 0 || y1 > height) {
      y_vel = y_vel * -1;
    }
    y1 += y_vel;
    y2 = y1;
  }
}
