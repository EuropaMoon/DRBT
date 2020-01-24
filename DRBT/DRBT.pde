Game game;

void setup() {
  size(600, 600);
  game = new Game(new PVector(width, height));
  game.window.setRectMode(CENTER);
  
  game.playState = new PlayState();
}

void draw() {
  game.startFrame();
  
  game.mainMenuState.update(game);
  game.mainMenuState.draw(game);
  
  game.endFrame();
}
