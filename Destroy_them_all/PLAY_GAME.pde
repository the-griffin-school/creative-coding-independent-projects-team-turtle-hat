/*
Team-turtle-hat
David, Cho, Giles
March 2017
Controls the actual gameplay of the game
*/

boolean playerJump = false;
float randomSprite;
ArrayList<Sprites> sprites = new ArrayList<Sprites>();
ArrayList<Float> grassList = new ArrayList<Float>();
float treesX = 0;
float trees2X = 800;
//stores time;
int time = 0;
int grassPosX = 0;


class PlayGame {
  //Fields
  boolean playerJump;
  float randomSprite;
  ArrayList<Sprites> sprites = new ArrayList<Sprites>();
  //ArrayList<float> grass = new ArrayList<float>();
  float treesX;
  float trees2X;
  int time;
  int score;
  float gameSpeed;
  int grassWidth = 50;

  //Constructor
  PlayGame() {
    playerJump = false;
    treesX = 0;
    trees2X = 800;
    time = 0;
    score = 0;
    gameSpeed = 5;
  }

  //Methods

  //Function to randomely determine when a tree is going to be placed
  void generateSprites() {
    randomSprite = random(35, 50);
    //is going to determine if a sprite should be added. Then it will decide either building or trap.
    if(randomSprite < 45 && randomSprite > 40 && millis() - time > 500) {
      if(randomSprite > 42.5) {
        //add buliding to arraylist
        sprites.add(new Buildings(width, int(random(7))));
        time = millis();
      } else if (randomSprite < 41) {
        //adds trap to arraylist
        sprites.add(new Traps(width, 1));
        time = millis();
      }
    }
  }

  void addGrass() {
    for (int i = 0; i <= width; i += grassWidth) {
      grassList.add(new Float(i));
    }
  }

  void drawGrass() {
    for(int i = 0; i < grassList.size(); i++) {
      grassList.set(i, grassList.get(i) - 10);
      shape(grass, grassList.get(i), 570, grassWidth, (grass.height * grassWidth)/grass.width);
      if(grassList.get(i) < 2 - grassWidth) {
        grassList.set(i, float(width));
      }
    }
  }


  //setting game speed from outside the class
  void setGameSpeed(float newSpeed) {
    gameSpeed = newSpeed;
  }

  //returns gameSpeed
  float getGameSpeed() {
    return gameSpeed;
  }

  void addScore() {
    score += 10;
  }

  void displayScore() {
    text("Score:" + " " + score, 60, 30);
  }

  void checkAlive() {
    if(player.dead()) {
      //gameState = "GAME OVER";
    }
  }

  //removes object from ArrayList if it off the screen.
  void clearSprite(int i) {
    if(sprites.get(i).getX() < -500 || sprites.get(i).destroyed()) {
      addScore();
      sprites.remove(i);
    }
  }

  void process() {
    //loops through all objects in ArrayList
    for(int i = 0; i < sprites.size(); i++) {
      //moves sprite from right to left
      sprites.get(i).move(getGameSpeed());
      //displays sprite
      sprites.get(i).display();
      sprites.get(i).detection();
      sprites.get(i).subtractHealth();
      checkAlive();
      clearSprite(i);
    }
    //displays player
    player.display();
    if(playerJump) {
      player.jump();
    }
  }

  // ##LAGS TOO MUCH GRADIENT ATTEMPT FAILED
  // sky gradient from (0, 228, 255) to (255, 255, 255)
  // void drawSky() {
  //   color skyColor = color(0, 228, 255);
  //   strokeWeight(1);
  //
  //   for (int i = 0; i < height; i++){
  //     stroke(lerpColor(skyColor, color(255), map(i, 0, height, 0, 1)));
  //     line(0, i-1, width, i+1);
  //   }
  // }

  // draw Sky
  void drawSky() {
    image(sky, 0, 0);
  }

  // void drawGrass() {
  //   int grassWidth = 50;
  //   for(int i = 0; i < width; i += grassWidth) {
  //     shape(grass, grassPosX + i, 570, grassWidth, (grass.height * grassWidth)/grass.width);
  //   }
  //   grassPosX--;
  // }

  void display() {
    //draw sky
    drawSky();
    //generate sprites
    generateSprites();
    //moves and displays
    process();
    //draws grass
    drawGrass();
    //displays score;
    displayScore();
  }
}
