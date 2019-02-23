float[][] glitter = new float [100000][15];
float currentflamef,nextflamef;
int currentflame=0,nextflame;

void setup(){
  size(768,768);
  rectMode(CENTER);
  smooth();
  noStroke();
  frameRate(60);
}

void draw(){
  background(0);
  float randomCheck = random(0, 10);
  if(randomCheck > 5) {
    create_fire();
  }
  update_fire(); 
  draw_fire();
}

void update_fire(){
  for(int sparkle=0 ; sparkle<100000 ; sparkle++){
    if(glitter[sparkle][0]==1){

      if(get(int(glitter[sparkle][1]),int(glitter[sparkle][2]))>200){
        glitter[sparkle][0]=0;
      }
      glitter[sparkle][1]=glitter[sparkle][1]+glitter[sparkle][5]*cos(glitter[sparkle][3]);
      glitter[sparkle][2]=glitter[sparkle][2]+glitter[sparkle][5]*sin(glitter[sparkle][3]);
    }
    glitter[sparkle][7]+=1;
    if(glitter[sparkle][7]>glitter[sparkle][6]){
      glitter[sparkle][0]=0;
    }
  }
}

void draw_fire(){
  for(int sparkle=0 ; sparkle<currentflame ; sparkle++){
    if(glitter[sparkle][0]==1){
      fill(glitter[sparkle][9],glitter[sparkle][10],glitter[sparkle][11],glitter[sparkle][12]);
      pushMatrix();
      translate(glitter[sparkle][1],glitter[sparkle][2]);
      rotate(glitter[sparkle][8]);
      rect(0,0,glitter[sparkle][4],glitter[sparkle][4]);
      popMatrix();
    }
  }
}

void create_fire(){
  nextflame=currentflame+10;
  for(int sparkle=currentflame ; sparkle<nextflame ; sparkle++){
    glitter[sparkle][0]=1;
    glitter[sparkle][1]=random(0,width);
    glitter[sparkle][2]=random(0,height);
    glitter[sparkle][3]=random(0,PI*2);//angle
    glitter[sparkle][4]=random(5,15);//size
    glitter[sparkle][5]=random(.5,1);//speed
    glitter[sparkle][6]=random(10,100)/glitter[sparkle][5];//maxlife
    glitter[sparkle][7]=0;//currentlife
    glitter[sparkle][8]=random(0,TWO_PI);
    glitter[sparkle][9]=random(0,255);//red
    glitter[sparkle][10]=random(0,255);//green
    glitter[sparkle][11]=random(0,255);//blue
    glitter[sparkle][12]=random(0,255);//alpha
  }
  currentflame=nextflame;
}
