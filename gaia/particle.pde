class Particle {
  float x1, x2, y1, y2, angle, prev_angle, radius, radius_offset, vel;
  color c;
  boolean direction, radiusUp, offsetUp, circleUp, circleDown;
  float radiusMin = 0;
  float radiusMax = 550;
  float offsetMin = 0.5;
  float offsetMax = 1;
  float friction = 0.1;
  
  Particle() {
    vel = random(0.001, 0.002);
    angle = random(1);
    prev_angle = angle - (vel / 2);
    radius = random(radiusMin, radiusMax);
    radius_offset = random(offsetMin, offsetMax);
    x1 = (sin(2 * PI * angle) * radius) + width / 2;
    y1 = (cos(2 * PI * angle) * radius) + height / 2;
    x2 = (sin(2 * PI * prev_angle) * radius) + width / 2;
    y2 = (cos(2 * PI * prev_angle) * radius) + height / 2;
    c = color(random(0.25, 0.55), random(0.5, 0.8), 0.8);
    direction = randomBool();
    radiusUp = true;
    offsetUp = true;
    circleUp = true;
    circleDown = true;
  }
  
  void drawParticle() {
    strokeWeight(3.5);
    stroke(c);
    line(x1, y1, x2, y2);
    updateParticle();
  }
  
  void updateParticle() {
    x1 = (sin(2 * PI * angle) * radius) + width / 2;
    y1 = (cos(2 * PI * angle) * radius) + height / 2;
    x2 = (sin(2 * PI * prev_angle) * radius) + width / 2;
    y2 = (cos(2 * PI * prev_angle) * radius) + height / 2;
    prev_angle = angle;
    
    if(direction) {
        angle += vel;
    } else {
        angle -= vel;
    }
    
    if(radiusUp) {
      radius += radius_offset;
      if(radius >= radiusMax) {
        radiusUp = !radiusUp;
      }
    } else {
      radius -= radius_offset;
      if(radius <= radiusMin) {
        radiusUp = !radiusUp;
      }
    }
    
    if(offsetUp) {
      radius_offset -= friction;
      if(radius_offset <= offsetMin) {
        offsetUp = !offsetUp;
      }
    } else {
      radius_offset += friction;
      if(radius_offset >= offsetMax) {
        offsetUp = !offsetUp;
      }
    }
    
    if(circleUp) {
      radiusMax += 0.1;
      if(radiusMax >= 600) {
        circleUp = !circleUp;
      }
    } else {
      radiusMax -= 0.1;
      if(radiusMax <= 350) {
        circleUp = !circleUp;
      }
    }
    
    if(circleDown) {
      radiusMin += 0.1;
      if(radiusMin >= 150) {
        circleDown = !circleDown;
      }
    } else {
      radiusMin -= 0.1;
      if(radiusMin <= 0) {
        circleDown = !circleDown;
      }
    }
    
    //print("\n" + radiusMax + "max" + "\n" + radiusMin + "min" + "\n");
    
    
    //if(x1 > width || x1 < 0 || y1 > height || y1 < 0) {
    //  vel = random(0.001, 0.002);
    //  angle = random(1);
    //  prev_angle = angle - (vel / 2);
    //  radius = random(radiusMin, radiusMax);
    //  radius_offset = random(1, 5);
    //  x1 = (sin(2 * PI * angle) * radius) + width / 2;
    //  y1 = (cos(2 * PI * angle) * radius) + height / 2;
    //  x2 = (sin(2 * PI * prev_angle) * radius) + width / 2;
    //  y2 = (cos(2 * PI * prev_angle) * radius) + height / 2;
    //}
  }
  
  boolean randomBool() {
    return random(1) > .5;
  }
}
