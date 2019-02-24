Meteor[] fs = new Meteor[floor(random(250))];
boolean once;

void setup(){
  size(768,768);
  smooth();
  for (int i = 0; i < fs.length; i++){
    fs[i] = new Meteor();
  }
}

void draw(){
  noStroke();
  background(0);
  for (int i = 0; i < fs.length; i++){
    fs[i].draw();
  }
  
  once = false;
  for (int i = 0; i < fs.length; i++){
    if((fs[i].hidden)&&(!once)){
      fs[i].launch();
      once = true;
    }
  }
}

class Meteor{
  
  float x, y, oldX,oldY, ySpeed, targetX, targetY, explodeTimer, flareWeight, flareAngle;
  int flareAmount, duration;
  boolean launched,exploded,hidden;
  color flare;
  
  Meteor(){
    launched = false;
    exploded = false;
    hidden = true;
  }
  
  void draw(){
    if((launched)&&(!exploded)&&(!hidden)){
      launchMaths();
    }
    if((!launched)&&(exploded)&&(!hidden)){
      explodeMaths();
      strokeWeight(flareWeight);
      stroke(flare);
      for(int i = 0; i < flareAmount + 1; i++){
          pushMatrix();
          translate(x,y);
          point(radians(i*flareAngle)*explodeTimer, radians(i*flareAngle)*explodeTimer);
          popMatrix();
       }
    }
  }
  
  void launch(){
    x = oldX = random(0, width) + ((random(5)*10) - 25);
    y = oldY = height;
    targetX = random(0, width);
    targetY = random(0, height);
    ySpeed = random(3) + 2;
    flare = color(random(0,255), random(0,255), random(0,255));
    flareAmount = 100;
    flareWeight = ceil(random(10));
    duration = ceil(random(2))*20 + 30;
    flareAngle = 10;
    launched = true;
    exploded = false;
    hidden = false;
  }
  
  void launchMaths(){
    oldX = x;
    oldY = y;
    if(dist(x,y,targetX,targetY) > 6){
      x += (targetX - x)/2;
      y += -ySpeed;
    }else{
      explode();
    }
  }
  
  void explode(){
    explodeTimer = 0;
    launched = false;
    exploded = true;
    hidden = false;
  }
  
  void explodeMaths(){
    if(explodeTimer < duration){
      explodeTimer+= 0.4;
    }else{
      hide();
    }
  }
  
  void hide(){
    launched = false;
    exploded = false;
    hidden = true;
  }
}
                                                                
