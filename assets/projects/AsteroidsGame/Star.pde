class Star //note that this class does NOT extend Floater
{
  private double myX, myY,mySize;
  private int myColor,myOpac;
  public Star() {
    myX=(Math.random()*500);
    myY=(Math.random()*500);
    myOpac = (int)(Math.random()*200)+40;
    mySize=(int)(Math.random()*5+2);
    myColor = 255;
  } 

  public void show() {
    noStroke();
    fill(myColor,myOpac);
    ellipse((float)myX, (float)myY,(float)mySize,(float)mySize);
  }
}



