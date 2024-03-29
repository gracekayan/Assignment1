class Dial {

  PVector position; //x and y co-ordinates
  PVector rect; //position of rectangles
  float dial, angle;
  int sec;
  int arcWidth, arcHeight;
  int col1, col2, col3;  //colours for scanning area
  //constructor
  Dial() {

    position = new PVector(width/2, (height/2)-50); //start in centre
    arcWidth = 140;
    arcHeight = 120;
  }//end of constructor

  //This is my middle circle for the dial
  void middleC() {

    //I've drawn these inside the function, as this will stop the rectangles
    //moving in a block off the screen
    int a = 50;
    int b = 18;
    //main middle circle
    fill(119, 204, 211);
    ellipse(position.x, position.y, 110, 100);
    //small centre
    noStroke();
    fill(255, 0, 0);
    ellipse(position.x, position.y, 35, 30);
    fill(0);
    textSize(9);
    text("PUSH", position.x, position.y+3);

    if (mousePressed)
    {
      if (mouseX > position.x-25 && mouseX < position.x + 20 && mouseY > position.y -25 && mouseY < position.y+20)
      {
        fill(0, 255, 0);
        ellipse(position.x, position.y, 25, 20);
      }//end inner if
    } //end outer if

    //details in the centre
    noStroke();
    fill(100);    
    for (int i = 0; i < 7; i++)
    {
      rect(position.x-a, position.y-3, 3, 7);
      a -= 5;
      rect(position.x+b, position.y-3, 3, 7);
      b += 5;
    }//end of for
  }//end middleC()

  void smallDial() {

    fill(255);
    textSize(15);
    text("Scanning Area", 650, 25);
    //smaller circle
    pushMatrix();
    translate(250, -100);
    fill(119, 204, 211);
    ellipse(position.x, position.y, 110, 100);

    if (key == CODED)
    {
      if (keyCode == UP)
      {
        col1 = 234; 
        col2 = 214; 
        col3 = 21;
        fill(col1, col2, col3);
        arc(position.x, position.y, 109, 110, ((3*PI)/4)+angle, ((5*PI)/4)+angle); 
        angle += 0.01;
      } else
      {
        col1 = 127; 
        col2 = 197; 
        col3 = 206;
        fill(col1, col2, col3);
        arc(position.x, position.y, 109, 110, ((3*PI)/4)+angle, ((5*PI)/4)+angle); 
        angle += 0.005;
      }
    }
    //white tear drops on small dial
    fill(255);
    arc(position.x-30, position.y, 50, 10, ((3*PI)/4), ((5*PI)/4)); //tear drop left
    translate(600, -195);
    rotate((TWO_PI)/4);
    fill(255);
    arc(position.x-30, position.y, 50, 10, (3*PI)/4, (5*PI)/4); //tear drop top
    popMatrix();

    pushMatrix();
    translate(310, -100);
    fill(255);
    arc(position.x-30, position.y, 50, 10, (7*PI)/4, (9*PI)/4); //tear drop right
    translate(545, -128);
    rotate((TWO_PI)/4);
    fill(255);
    arc(position.x-30, position.y, 50, 10, (1.5*PI)/4, (3.2*PI)/4); //tear drop bottom
    popMatrix();

    //circle around the dial
    strokeWeight(3);
    stroke(131, 175, 154);
    noFill();
    pushMatrix();
    translate(250, -100);
    arc(position.x, position.y, arcWidth, arcHeight, 0, TWO_PI); 
    popMatrix();
  }//end small dial
}//end of dial class