ArrayList<XLine> xlines = new ArrayList<XLine>();
ArrayList<YLine> ylines = new ArrayList<YLine>();
int num_lines = 5;
color[] colors = new color[num_lines * num_lines];
color white = color(255, 255, 255);
color black = color(0, 0, 0);
color red = color(255, 0, 0);
color blue = color(0, 0, 255);
color yellow = color(255, 255, 0);
color[] color_options = {white, white, white, black, red, blue, yellow};
int color_count;

void setup() {
  size(768, 768);
  smooth(8);
  stroke(0);
  
  xlines.add(new XLine(0, 0));
  xlines.add(new XLine(height - 1, 0));
  ylines.add(new YLine(0, 0));
  ylines.add(new YLine(width - 1, 0));

  for(int i = 0; i < num_lines; i++) {
    xlines.add(new XLine());
    ylines.add(new YLine());
  }
  
  color_count = 0;
  
  for(int j = 0; j < num_lines * num_lines; j++) {
    int r = floor(random(7));
    colors[j] = color_options[r];
  }
}

void draw() {
  background(255);
  for(int i = 0; i < num_lines; i++) {
    XLine x = xlines.get(i);
    YLine y = ylines.get(i);
    x.draw_line();
    y.draw_line();
  }
  checkAndFill();
  delay(20);
}

void checkAndFill() {
  for(int i = 0; i < num_lines - 1; i++) {
    XLine x = xlines.get(i);    
    XLine x_next = xlines.get(i + 1);
    for(int j = 0; j < num_lines - 1; j++) {
      YLine y = ylines.get(j);
      YLine y_next = ylines.get(j + 1);
      fill(colors[color_count]);
      rect(y.x1, x.y1, y_next.x1 - y.x1, x_next.y1 - x.y1);
      color_count++;
    }
  }
  color_count = 0;
}
