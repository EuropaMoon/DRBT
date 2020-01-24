Game game;

void setup() {
  size(600, 600);
  game = new Game(new PVector(width, height));
  game.window.setRectMode(CENTER);
}

void draw() {
  game.startFrame();
  
  println(game.frameDeltaTime);
  
  game.endFrame();
}
