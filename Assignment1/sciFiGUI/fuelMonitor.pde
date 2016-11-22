static final int TRIANGLE = 5;
class Fuel {

  PVector position;
  //PFont zone;
  int a, b, c, d;
  int spacing;
  float dial;
  int sec;

  //constructor
  Fuel() {

    position = new PVector(width/2, (height/2)-50); //start in centre

    a = 405;
    b = 393;
    c = 401;
    d = 296; //triangle x 
    spacing = 18;
  }

  void display() {

    //dial
    sec = second();
    dial = 360 / 60 * sec;  
    strokeWeight(0.5);
    stroke(21, 232, 79);
    if (mousePressed)
    {
      if (mouseX > position.x-25 && mouseX < position.x + 20 && mouseY > position.y -25 && mouseY < position.y+20)
      {
        pushMatrix();
        translate(position.x, position.y);
        rotate(radians(dial));
        line(0, 0, 0, -120);
        popMatrix();
        
        textSize(15);
        fill(255);
        text("LOCATION " + dial+ " " + " AREA CLEAR", (width*0.625)+25, (height*0.69)+80);
      }
    } 
    
    //width 800, height 500
    fill(0);
    strokeWeight(2);
    stroke(4, 116, 175);
    rect((width*0.079), ((height/3)*1.98), 160, (height/3), 6); //left rectangle
    rect((width/3+20), (height*0.77), 160, 100, 6); //middle rectange

    noFill();
    rect((width*0.625), (height*0.69), 270, (height*0.29), 6); //right rectangle
    line((width*0.625), (height*0.69)+30, (width*0.625)+270, (height*0.69)+30);
    textSize(15);
    fill(255);
   // zone = loadFont("Menlo-Regular-48.vlw");
    //textFont(zone, 15);
    text(" ZONE CLEARANCE MONITOR ", (width*0.625)+20, (height*0.69)+25);
    
    for (int i = 0; i< (spacing*TRIANGLE); i+=spacing)
    {    
      fill(255);
      stroke(255);
      triangle( d, a+i, d, b+i, (d*1.034), c+i); //triangles in middle box
    }
  }
}