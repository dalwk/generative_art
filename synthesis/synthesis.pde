float[] hexagonX = new float[width];
float[] hexagonY = new float[height];
float scaleFactor;
float r, g, b;
boolean increment_r, increment_g, increment_b;
 
void setup() {
 size(768, 768);
 strokeWeight(3);
 strokeCap(SQUARE);
 smooth(8);
 scaleFactor = .85;
 r = random(100, 255);
 g = random(100, 255);
 b = random(100, 255);
 increment_r = true;
 increment_g = true;
 increment_b = true;

}
 
void draw() {
  background(255);
  for(int i = 0; i < hexagonX.length; i++){   
    for(int j = 0; j < hexagonY.length; j++){
      if(j % 2 == 0) {
        hexagonX[i] = scaleFactor * (i * 102);
      } else if(j % 2 != 0) {
        hexagonX[i] = scaleFactor * (51 + i * 102); 
      }
     hexagonY[j] = scaleFactor * (j * 28);
     hexagon(int(hexagonX[i]), int(hexagonY[j]));
    }    
  }
  delay(100);
}
 
void hexagon(int x, int y){
  pushMatrix();
  translate(x, y);
  scale(scaleFactor);
  getStroke();
  line(-17, -28, 17, -28);
  getStroke();
  line(-34, 0, -17, -28);
  getStroke();
  line(-34, 0, -17, 28);
  getStroke();
  line(-17, 28, 17, 28);
  getStroke();
  line(17, 28, 34, 0);
  getStroke();
  line(34, 0, 17, -28);
  popMatrix();
}

void getStroke() {
  float r = random(-1, 1);
  if(r > .5) {
    stroke(r, g, b);
    incrementColors();
  } else {
    stroke(255);
  }
}

void incrementColors() {
    if (increment_r) {
      r += 1;
    } else {
      r -= 1;
    }
    
    if (increment_g) {
      g += 1;
    } else {
      g -= 1;
    }
    
    if (increment_b) {
      b += 1;
    } else {
      b -= 1;
    }
    
    if (r >= 255 || r <= 100) {
      increment_r = !increment_r;
    }
    if (g >= 255 || g <= 100) {
      increment_g = !increment_g;
    }
    if (b >= 255 || b <= 100) {
      increment_b = !increment_b;
    }
}
