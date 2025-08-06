Spaceship jet = new Spaceship();
Star[] stars = new Star[150];
ArrayList <Asteroid> rocks = new ArrayList <Asteroid>();
ArrayList <Bullet> bullets = new ArrayList <Bullet>();
boolean fired = false;
int milliseconds = 0;
int decim = 0;
int score = 0;
int []opac = new int[10];
int oIndex = 0;
boolean ended = false;
boolean depleted = false;
public void setup()
{
  frameRate(100);
  size(500, 500);
  for (int i =0; i<stars.length; i++) {
    stars[i]= new Star();
  }
  for (int i =0; i<10; i++) {
    rocks.add(new Asteroid());
    opac[i]=255;
  }
}
public void draw()
{
  background (0);
  for (int i = 0; i<stars.length; i++) {
    stars[i].show();
  }
  fill(0);
  rect(30, 400, 150, 80);
  for (int i =0; i<rocks.size(); i++) {
    for (int j=0; j<16; j++) {
      for (int k=0; k<11; k++) {
        float d= dist(jet.getX(k), jet.getY(k), rocks.get(i).getX(j), rocks.get(i).getY(j));
        if (d<=1) {
          fired = true;
          score--;
          opac[oIndex]=0;
          oIndex++;
        }
      }
      for (int l =0; l< bullets.size(); l++) {
        for (int m =0; m<360; m+=45) {
          float f= dist((float)bullets.get(l).getCenterX(m), (float)bullets.get(l).getCenterY(m), rocks.get(i).getX(j), rocks.get(i).getY(j));
          if (f<=1) {
            fired = true;
            score++;
          }
        }
      }
    }
    rocks.get(i).show();
    rocks.get(i).move();
    if (fired == true) {
      rocks.remove(i);
    }
    fired = false;
  }

  for (int i =0; i<bullets.size(); i++) {
    bullets.get(i).show();
    bullets.get(i).move();
  }
  if (jet.getOpac() >= 20) {
    jet.move();
    jet.show();
  }
  jet.slow();
  movement();
  ui();
  if (ended== false) {
    milliseconds+=10;
    decim++;
  }
  if (decim==100) {
    decim=0;
  }
  if (rocks.size()==0 || opac[9] == 0) {
    end();
  }
}
public void mouseClicked() {
  bullets.add(new Bullet(jet));
  bullets.get(bullets.size()-1).accelerate(2);
}
public void keyPressed(){
  if (key == 'e'){
    restart();
  }
}

public void movement() {
  if (key == 'd') {
    jet.turn(4);
  } else if (key == 'a') {
    jet.turn(-4);
  } else if (key == 'w') {
    jet.accelerate(0.1);
  } else if (key == 's') {
    jet.deccelerate(0.05);
  } else if (key == 'r') {
    jet.fade();
  } 
}

public void keyReleased() {
  if (key=='r') {
    jet.hyperspace();
  }
  key = 'p';
}

public void end() {
  ended = true;
  noStroke();
  fill(255, 150);
  rect(100, 150, 300, 150);
  textSize(40);
  textAlign(CENTER);
  fill(255, 10, 10);
  text("GAME OVER", 250, 230);
  textSize(20);
  text("[e] - restart", 250, 290);
}
public void restart() {
  fired = false;
  milliseconds = 0;
  decim = 0;
  score = 0;
  oIndex = 0;
  ended = false;
  depleted = false;
  for (int i =0; i<10; i++) {
    rocks.add(new Asteroid());
    opac[i]=255;
  }
}

public void ui() {
  noStroke();
  fill(255, 50);
  rect(30, 400, 150, 80);
  stroke(255);
  line(30, 480, 30, 460);
  line(30, 480, 80, 480);
  line(180, 400, 180, 420);
  line(180, 400, 130, 400);
  noStroke();
  for (int i=0; i<200; i+=20) {
    fill(55+i, opac[9-i/20]);
    quad(285+i, 20, 270+i, 40, 285+i, 40, 300+i, 20);
  }
  stroke(255);
  line(260, 45, 275, 25);
  line(490, 15, 475, 35);
  line(260, 45, 320, 45);
  line(490, 15, 430, 15);
  fill(255);
  textAlign(LEFT);
  textSize(15);
  text("score", 50, 430);
  text("elapsed", 50, 460);
  textAlign(RIGHT);
  text(score, 160, 430);
  text(milliseconds/1000+" .", 160, 460);
 // text(decim, 160, 460);
}
