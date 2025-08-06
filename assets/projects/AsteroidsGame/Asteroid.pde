class Asteroid extends Floater{
  private int rotSpeed;
  public Asteroid(){
      rotSpeed = (int)(Math.random()*3)-1;
      myColor = color(130);
      myColor2 = 255;
      myCenterX = Math.random()*500;
      myCenterY = Math.random()*500;
      myXspeed = Math.random()-0.5;
      myYspeed = Math.random()-0.5;
      corners = 16;
      myPointDirection = (int)(Math.random()*360);
      opac = 255;
      xCorners = new int[corners];
      yCorners = new int[corners];
      for (int i =0; i<720; i+=45){
        double rads = i*(Math.PI/360);
        xCorners[i/45] = (int)(Math.cos(rads)*18)+(int)(Math.random()*7);
        yCorners[i/45] = (int)(Math.sin(rads)*18)+(int)(Math.random()*7);
      }

  }
  
  public void move(){
    turn (rotSpeed);
    super.move();
  }
}
