class Bullet extends Floater{
  public Bullet(Spaceship jet){
    myCenterX = jet.getCenterX();
    myCenterY = jet.getCenterY();
    myXspeed = jet.getXspeed();
    myYspeed = jet.getYspeed();
    myPointDirection = jet.getPointDirection();
    myColor = 0;
    myColor2 = color(255,0,0);
    opac = 255;
  }
  public void show(){
    fill(myColor,opac);   
    stroke(myColor2,opac);
    strokeWeight(2);
    ellipse((float)myCenterX, (float)myCenterY, 10, 10);
  }
  
  public void move() {          
    myCenterX += myXspeed*2;    
    myCenterY += myYspeed*2; 
  }
  public double getCenterX(int m){
    double rads = m*(Math.PI/180);
    return myCenterX + Math.cos(rads)*5;
  }
  public double getCenterY(int m){
    double rads = m*(Math.PI/180);
    return myCenterY + Math.sin(rads)*5;
  }}
