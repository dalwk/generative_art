ArrayList<PVector> points;
Camera cam;
boolean zoom = false;
Rect rect = null;

void setup() {
  size(800, 800, P2D);
  smooth(8);
  pixelDensity(1);
  generate();
  background(0);

  cam = new Camera(width/2, height/2, 1);
}

void draw() {

  background(255);

  updatePoints();

  cam.update();
  stroke(0);
  for (int i = 0; i < points.size(); i++) {
    PVector p = points.get(i);
    fill(getColor(p.z*0.1+frameCount*0.01));
    noStroke();
    rect(p.x, p.y, p.z*2, p.z*2);
  }

  if (rect != null) {
    noStroke();
    fill(255, 40);
    rect.show();
    if (rect.remove) rect = null;
  }
}

void updatePoints() {
  int n = points.size();
  float radius = width*1.75;
  float phi = (sqrt(5)+1)/2.0;
  float cx = 0;
  float cy = 0;
  float maxDis = 200;
  float minDis = 150;
  for (int i = 0; i < n; i++) {
    float r = (i > n)? 1 : (sqrt(i-1./2)/sqrt(n-1)/2.0)*radius;
    float theta = TWO_PI*(i/pow(phi, 2));
    float xx = cx+r*sin(theta);
    float yy = cy+r*cos(theta);
    float ang = atan2(cam.my-yy, cam.mx-xx);
    float ss = 5;
    float dis = dist(xx/5, yy/5, cam.mx, cam.my);


    float des = 0;
    if (dis < maxDis) {
      des = pow(map(dis, minDis, maxDis, 1, 0), 2)*160;
      ss = map(pow((1-dis/maxDis), 5), 0, 1, 5, 30);
      if (dis < minDis) {
        ss =  map(dis, 0, minDis, 160, 60);
        des = map(dis, 0, minDis, 80, 40);
      }
    }
    float nx = xx-sin(ang)*des;
    float ny = yy-cos(ang)*des;
    float ns = ss;

    float nv = 0.1;
    PVector p = points.get(i);
    p.x = p.x+(nx-p.x)*nv;
    p.y = p.y+(ny-p.y)*nv;
    p.z = p.z+(ns-p.z)*nv;
  }
}

void generate() {
  points = new ArrayList<PVector>();
  for (int i = 0; i < 180; i++) {
    points.add(new PVector(0, 0));
  }
}

int colors[] = {#108ee9, #00a2ae, #ffbf00, #f04134, #00a854, #f5317f, #f56a00, #7265e6};

int rcol() {
  return colors[int(random(colors.length))];
}

int getColor(float v) {
  v = abs(v)%(colors.length);

  int c1 = colors[int(v%colors.length)];
  int c2 = colors[int((v+1)%colors.length)];
  float m = v%1;
  
  return lerpColor(c1, c2, m);
}


class Camera {
  float x, y, s;
  float nx, ny, ns;
  float vel = 0.08;
  float mx, my;
  Camera(float x, float y, float s) {
    this.x = nx = x;
    this.y = ny = y;
    this.s = ns = s;
  }
  void update() {
    x += (nx-x)*vel;
    y += (ny-y)*vel;
    s += (ns-s)*vel;

    mx = map(mouseX-x, 0, width, 0, width/s);
    my = map(mouseY-y, 0, height, 0, height/s);

    translate(x, y);
    scale(s);
  }
  void set(float nx, float ny, float ns) {
    this.nx = nx;
    this.ny = ny;
    this.ns = ns;
  }
}

class Rect {
  boolean remove;
  color col;
  float x, y, w, h;
  float time;
  boolean open;
  Rect(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w; 
    this.h = h;
    time = 0;
    open = true;
    col = rcol();
  }
  void show() {
    rectMode(CENTER);
    if (open) {
      if (time < 1) time += 2;
      if (time > 1) time = 1;
    } else {

      if (time > 0) time -= 0.06;
      if (time < 0) time = 0;
    }
    float tt = pow(time, 0.8);
    float m1, m2;
    m1 = m2 = 0;
    if (tt < 0.2) {
      m1 = map(tt, 0, 0.2, 0, 0.1);
      m2 = map(tt, 0, 0.2, 0, 0.1);
    } else if (tt < 0.6) {
      m1 = map(tt, 0.2, 0.6, 0.1, 0.8);
      m2 = map(tt, 0.2, 0.6, 0.1, 0.2);
    } else if (tt < 1) {
      m1 = map(tt, 0.6, 1, 0.8, 1.0);
      m2 = map(tt, 0.6, 1, 0.2, 1.0);
    } else {
      m1 = m2 = 1;
    }
    float ww = w;
    float hh = h;
    if (w > h) {
      ww *= m1;
      hh *= m2;
    } else {
      hh *= m1;
      ww *= m2;
    }
    fill(col);
    rect(x, y, ww, hh, 8);
  }
}
