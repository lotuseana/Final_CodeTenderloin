class Spaceship extends Floater  
{   
    public Spaceship(){
      myColor = color(255,0,0);
      myColor2 = 255;
      myCenterX=250;
      myCenterY=250;
      myXspeed=0.0;
      myYspeed=0.0;
      corners = 11;
      myPointDirection=0.0;
      opac =255;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = 16;
      yCorners[0] = 0;
      xCorners[1] = 2;
      yCorners[1] = 4;
      xCorners[10] = 2;
      yCorners[10] = -4;
      xCorners[2] = -3;
      yCorners[2] = 16;
      xCorners[9] = -3;
      yCorners[9] = -16;
      xCorners[3] = -6;
      yCorners[3] = 17;
      xCorners[8] = -6;
      yCorners[8] = -17;
      xCorners[4] = -6;
      yCorners[4] = 9;
      xCorners[7] = -6;
      yCorners[7] = -9;
      xCorners[5] = -11;
      yCorners[5] = 3;
      xCorners[6] = -11;
      yCorners[6] = -3;
    }
  public int getOpac(){
    return opac;
  }
public double getPointDirection(){
return myPointDirection;
}

  public void fade(){
    opac-=10;
  }
  public void hyperspace() {
    opac = 255;
    myXspeed = 0;
    myYspeed = 0;
    myCenterX = (Math.random()*500);
    myCenterY = (Math.random()*500);
    myPointDirection = (Math.random()*360);
  }
  public void deccelerate (double dAmount)   
  { 
    double dRadians =myPointDirection*(Math.PI/180);        
    myXspeed -= ((dAmount) * Math.cos(dRadians));    
    myYspeed -= ((dAmount) * Math.sin(dRadians)); 
  }  
  public void slow ()   
  {       
    myXspeed = myXspeed/1.04;    
    myYspeed = myYspeed/1.04;
  }  
  public double getCenterX(){
    return myCenterX;
  }
  public double getCenterY(){
    return myCenterY;
  }
  public double getXspeed(){
    return myXspeed;
  }
  public double getYspeed(){
    return myYspeed;
  }
  
}
