float spirals = 6; //The number of spirals to generate

float distance = 1; //The length of the current line
float distanceIncrement = 1; //How much to increase the distance of the lines each frame.

float angle = 0; //The angle of the current line
float angleOffset = 360; //How much to add to the calculated angle each frame. Play around with it, see what you get! :)
PVector first, second; //The holders of the coordinates for the current line to draw

//Recommended with distanceIncrement set to 1
boolean trailEffect = true;

float increment = 0;

void setup() {
  size(768, 768);
  background(0);
  first = new PVector(width/2, height/2);
}

void draw() {
 
  stroke(random(0,255), random(0,255), random(0,255));
  
  if (trailEffect) {
    fill(0, 10);
    rect(-1, -1, width + 1, height + 1);
  }
  
  second = first;
  
  if (increment < 300) {
    first = new PVector(first.x + cos(radians(angle)) * distance, first.y + sin(radians(angle)) * (distance += distanceIncrement));
    increment++;
  } else {
    first = new PVector(width/2, height/2);
    distance = 1;
    second = first;
    first = new PVector(first.x + cos(radians(angle)) * distance, first.y + sin(radians(angle)) * (distance += distanceIncrement));
    angle = 0;
    increment = 0;
  }
  
  angle += 360/spirals + angleOffset;
  line(first.x, first.y, second.x, second.y);  
}
