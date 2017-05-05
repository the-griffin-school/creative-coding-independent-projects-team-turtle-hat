class HowTo{

  HowTo() {

  }

  void drawSky() {
    image(sky, 0, 0);
  }

  void drawTitle() {
    fill(255);
    textAlign(CENTER);
    textFont(robotoCondensed);
    textSize(50);
    text("HOW TO PLAY", width/2, 150);
    stroke(255);
    strokeWeight(5);
    noFill();
    rectMode(CENTER);
    rect(width/2, 130, 500, 100);
  }

  void backToMenu() {
    textSize(40);
    text("Press Enter to Return to Main Menu", width/2, height - 70);
  }

  void howTo() {
    textSize(30);
    text("Use arrow keys to navigate menus and enter to select the desired option", width/2, 300);
    text("Press space while playing to jump over traps and shift to destroy buildings", width/2, 350);
    text("Press p while playing to pause the game", width/2, 400);
  }

  void display() {
    drawSky();
    drawTitle();
    backToMenu();
    howTo();
  }
}
