Game game;

enum State { MAINMENU, PLAY };

void setup() {
  size(600, 600);
  game = new Game(new PVector(width, height));
  game.window.setRectMode(CENTER);
}

void draw() {
  game.startFrame();
  
  game.window.clear();                               //clears the window
  
  //State switching
  if(game.currentState == State.MAINMENU) {          //if true: Updates and draws the main menu
    game.mainMenuState.update(game);
    game.mainMenuState.draw(game);
  }else if(game.currentState == State.PLAY) {        //if true: Updates and draws the play state
    game.playState.update(game);
    game.playState.draw(game);
  }
  
  game.endFrame();
}
