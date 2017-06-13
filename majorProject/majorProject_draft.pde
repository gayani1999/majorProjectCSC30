Level currentLevel;
int gameState;
Button start;

void setup() {
  size(600, 600);  
  gameState = 0;
  start= new Button (width/2, height/2, width/3, height/12, "START", color(255));
  createMenuButtons();
}

void draw() {

  goToCorrectPlace();
}

void mousePressed() {
  println(mouseX, mouseY);
  //println((mouseX/currentLevel.cellSize), mouseY/currentLevel.cellSize);
  if (gameState == 0) {
    if (start.isMouseHovering()) {
      gameState = 1;
    }
  } else if (gameState == 1) {
    chooseLevelToPlay();
  } else if (gameState == 2) {
    currentLevel.changeSwitchColour();
    gameState = 3;
  } else if (gameState == 3) {
    if (currentLevel.levelState == 0) {
      currentLevel.movesLeft--;
      currentLevel.changeColour();
      gameState = 2;
    }
  } else if (gameState == 2 || gameState == 3) {
    if (currentLevel.menu.isMouseHovering()) {
      gameState = 1;
    }
  }
}
void keyPressed() {

  currentLevel.changeSwitchToColour(key);
}
void goToCorrectPlace() {
  if (gameState == 0) {
    displayStartScreen();
  } else if (gameState == 1) {
    displayGameMenu();
  } else if (gameState == 2) {
    currentLevel.goToCorrectPlace();
  }
}

void displayStartScreen() {
  background(255);
  start.display();
}