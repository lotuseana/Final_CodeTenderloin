int numof = 200;
int stx, sty, stx1, sty1;
float sizeT;
int t=0;
int t2 = 0;
boolean fired = false;
int fOpac = 255;
part[]obs = new part[numof];
void setup() {
  frameRate (100);
  size (600, 600);
  reset();
}
void draw() {
  if (fired == false) {
    fill(0, 20);
    rect(0, 0, 800, 800);
  } else {
    background(0);
  }
  tail();
  for (int i =0; i<numof; i++) {
    if (fired==true) {
        obs[i].showH();
        obs[i].showT();
        obs[i].move();
    }
  }
  if (fired == true) {
    t++;
  }
}
class part {
  double myx, myy, mya, mys, myo, myx1, myy1, mys1, myo1, myc, size1;
  float r1, g1, b1, r2, g2, b2;
  part() {
    myo = 255;
    myo1= 255;
    myx = stx;
    myy = sty;
    mys = (Math.random()*8);
    mys1=mys;
    mya = Math.random()*2*Math.PI;
    myc = 255;
    size1=8;
    r1 = 255;
    g1 = 0;
    b1 = 0;
    r2 = 255;
    g2 = 225;
    b2 = 219;
  }
  void move() {
    myx+= Math.cos(mya)*mys;
    myy+= Math.sin(mya)*mys;
  }
  void showH(){
    fill (r2, g2, b2, (float)myo);
    ellipse((float)myx, (float)myy, 6, 6);
    myo-=4;
    g2-=5;
    b2-=5;
  }
  void showT() {
    myy1 = myy;
    myx1 = myx;
    for (int i =0; i<11; i++) {
      size1-=0.005;
      myo1-=0.4;
      mys1-=0.002;
      myx1-= Math.cos(mya)*mys1;
      myy1-= Math.sin(mya)*mys1;
      fill(r1, g1, b1, (float)myo1);
      ellipse ((float)myx1, (float)myy1, (float)size1, (float)size1);
    }
      r1-=0.015;
      g1+=0.01;
      b1+=0.01;
  }
}
class odd extends part {
  float size2;
  odd() {
    myo1= 255;
    myx = stx;
    myy = sty;
    myx1 = stx;
    myy1 = sty;
    mys = (Math.random()*3);
    mys1=mys;
    mya = Math.random()*2*Math.PI;
    myc = 255;
    size1=10;
    r1 = 255;
    g1 = 89;
    b1 = 0;
    size2 = (float)(Math.random()*6)+2;
  }
  void move() {
    myx+= (Math.cos(mya)*mys)/2;
    myy+= (Math.sin(mya)*mys)/2;
  }
  void showT() {
    for (int i =0; i<11; i++) {
      size1-=0.5;
      myo1-=0.4;
      mys1-=0.002;
      myx1-= Math.cos(mya)*mys1;
      myy1-= Math.sin(mya)*mys1;
      fill(r1, g1, b1, (float)myo1);
      ellipse ((float)myx1, (float)myy1, size2, size2);
    }
    g1+=2;
    b1+=3;
  }
  
}
void mouseClicked() {
  stx = mouseX;
  stx1= mouseX;
  sty = mouseY;
  reset();
}
void reset() {
  sizeT=6;
  fOpac=255;
  sty1 = 800;
  t=0;
  background (0);
  noStroke();
  fired = false;
  for (int i =0; i<numof; i++) {
    obs[i] = new part();
  }
  for (int i=0; i<numof/4; i++) {
    obs[i] =  new odd();
  }
}
void tail() {
  for (int i =0; i <5; i++){
  fill(255, fOpac);
  sty1-=1.5;
  sizeT-=0.01;
  ellipse ((float)stx1, sty1, sizeT, sizeT);
  if (sty1<sty+3 && sty1>sty-3) {
    fOpac=0;
    fired = true;
  }
}
}