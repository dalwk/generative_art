class Star {
  color c;
  float x1, y1, x2, y2;
  float factorOne = 1.025;
  float factorTwo = 1.06;
  float factorThree = 1.06;
  boolean timeUp = true;
  int timeCount = 0;
  
  Star() {
    c = color(0, random(50, 150), random(150, 255), random(175, 225));
    this.x1 = random(width - width/2) * random(-1,1);
    this.y1 = random(height - height/2) * random(-1,1);
    this.x2 = x1;
    this.y2 = y1;
  }
  
  void display() {
    colorMode(RGB, 255, 255, 255);
    stroke(c);
    strokeWeight(2);
    line(this.x1, this.y1, this.x2, this.y2);
  }
  
  void accelerate() {
    this.x1 = factorOne*this.x1;
    this.y1 = factorOne*this.y1;
    this.x2 = factorTwo*this.x2;
    this.y2 = factorTwo*this.y2;
    if(timeUp) {
      if (factorTwo <= factorOne) {
        timeUp = !timeUp;
      }
      factorTwo = factorTwo - 0.00001;
    } else {
      if (factorTwo >= factorThree) {
        timeUp = !timeUp;
      }
      factorTwo = factorTwo + 0.00001;
    }
    if (abs(this.x1) > width/2 || abs(this.y1) > height/2) {
        this.x1 = (random(width - width/2)/2 * random(-10,10));
        this.y1 = (random(height - height/2)/2 * random(-10,10));
        this.x2 = this.x1;
        this.y2 = this.y1;
    } 
    
  }
}

int numStars = 500;
ArrayList<Star> stars;
int blueCount;
boolean blueUp;

void setup() {
  size(768, 768);
  background(0);
  blueCount = 0;
  blueUp = true;
  stars = new ArrayList<Star>();
  for (int i = 0; i < numStars; i++) {
    stars.add(new Star());
  }
}

void draw() {
 noStroke();
 colorMode(RGB, 255);
  fill(0, blueCount / 4, blueCount, 60);
  if(blueUp) {
    blueCount++;
    if(blueCount >= 120) {
      blueUp = !blueUp;
    }
  } else {
    blueCount--;
    if(blueCount <= 40) {
      blueUp = !blueUp;
    }
  } 
  rect(0, 0, width, height);
  
  translate(width/2, height/2);

  for (int i = 0; i < stars.size()-1; i++) {
    Star s = stars.get(i);
    s.display();
    s.accelerate();
  }
}
