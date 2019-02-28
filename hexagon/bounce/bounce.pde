float increment = 0;
float distance = 1;
float angle = 0;
PVector first, second;
boolean trailEffect = true;

void setup() {
  size(768, 768);
  background(0);
  first = new PVector(width/2, height/2);
}

void draw() {
 
  stroke(random(0,255), random(0,255), random(0,255));
  strokeWeight(4);
  strokeJoin(MITER);
  
  if (trailEffect) {
    fill(0, 10);
    rect(-2, -2, width + 2, height + 2);
  }
  
  second = first;
  
  if (increment >= 0 && increment < 300) {
    first = new PVector(first.x + cos(radians(angle)) * distance, first.y + sin(radians(angle)) * (distance += 1));
    increment++;
    if (increment == 300) {
      increment = -300;
    }
  } else {
    first = new PVector(first.x + cos(radians(angle)) * distance, first.y + sin(radians(angle)) * (distance -= 1));
    increment++;
  }
  
  angle += 360/6 + 360;
  line(first.x, first.y, second.x, second.y);  
}
