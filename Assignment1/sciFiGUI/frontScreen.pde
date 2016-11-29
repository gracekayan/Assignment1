class Screen {

  PVector position;
  String a, b;  

  //constructor
  Screen() {   
    position = new PVector(width/2, height/2);
    a = "MOONAGE ENTERPRISES";
    b = "PRESS ENTER TO ACCESS";
  }

  void display() {

    if (key == ENTER || key == RETURN)
    {
      shipSound.rewind();
      shipSound.play();
    }

    fill(203, 108,29);
    textAlign(CENTER); 
    textFont(front, 50);
    text(a, position.x, position.y);
    textSize(25);
    text(b, position.x, position.y+75);

    if ( key == RETURN || key == ENTER)
    {
      gameState = gameState + 1;
    }
  }
}