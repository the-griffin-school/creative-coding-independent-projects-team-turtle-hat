/*
Team-turtle-hat
Cho, Giles, David
March 2017
Displays and controls the main menu of the game
*/

class MainMenu {
  //Fields
  boolean startGame;
  int selectMenu;
  float scaleFactor;

  //Constructor
  MainMenu() {
    startGame = false;
    selectMenu = 0;
    scaleFactor = 1.5;
  }

<<<<<<< HEAD
  popMatrix();

  //draw title
  fill(255);
  textAlign(CENTER);
  textFont(robotoCondensed);
  textSize(50);
  text("RIGHT TO BEAR ARMS", width/3, 150);
  stroke(255);
  strokeWeight(5);
  noFill();
  rectMode(CENTER);
  rect(width/2, 130, 500, 100);
=======
  //Methods
  void drawSky() {
    pushMatrix();
    scale(scaleFactor);
    translate(0, -30);
    image(sky, 0, 0, width, height);
    popMatrix();
  }
  void drawTrees() {
    pushMatrix();
    scale(scaleFactor);
    image(trees, 0, 400, width, trees.height/(trees.width/800));
    popMatrix();
  }
  void drawTitle() {
    fill(255);
    textAlign(CENTER);
    textFont(robotoCondensed);
    textSize(50);
    text("RIGHT TO BEAR ARMS", width/2, 150);
    stroke(255);
    strokeWeight(5);
    noFill();
    rectMode(CENTER);
    rect(width/2, 130, 500, 100);
  }
>>>>>>> 0a0453e1d503d91d30268e352e11d4d1af37826a

  void display() {
    drawSky();
    drawTrees();
    drawTitle();
    drawTitle();
    menuSelection();
  }

  void menuSelection(){
    // menu selection
    switch(selectMenu) {
      case 0:
        textSize(40);
        text("Play", width/2, 300);
        textSize(30);
        text("Stats", width/2, 350);
        text("Options", width/2, 400);
        break;
      case 1:
        textSize(40);
        text("Stats", width/2, 350);
        textSize(30);
        text("Play", width/2, 300);
        text("Options", width/2, 400);
        break;
      case 2:
        textSize(40);
        text("Options", width/2, 400);
        textSize(30);
        text("Play", width/2, 300);
        text("Stats", width/2, 350);
        break;
    }
    //if user pressed ENTER
    if(startGame) {
      gameState = "GAME START";
    }
  }
}
