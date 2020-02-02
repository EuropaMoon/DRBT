///Handles the Play state

/*
 *
 *
 */
 
class PlayState {
  Road road = new Road(new PVector[] { new PVector(400, 400), new PVector(450, 300) }, 120);
  float movementSpeed = 0.25;
  
  PlayState() {
  }
  
  void update(Game game) {
    
    //Handles key evens
    for(int i = 0; i != game.event.keyBuffer.length; ++i) {
      //Movements
      if(game.event.keyBuffer[i] == VK_D)
        game.setCameraPosition(new PVector(game.cameraPosition.x - movementSpeed * game.frameDeltaTime, game.cameraPosition.y));
      else if(game.event.keyBuffer[i] == VK_A)
        game.setCameraPosition(new PVector(game.cameraPosition.x + movementSpeed * game.frameDeltaTime, game.cameraPosition.y));
      else if(game.event.keyBuffer[i] == VK_S)
        game.setCameraPosition(new PVector(game.cameraPosition.x, game.cameraPosition.y - movementSpeed * game.frameDeltaTime));
      else if(game.event.keyBuffer[i] == VK_W)
        game.setCameraPosition(new PVector(game.cameraPosition.x, game.cameraPosition.y + movementSpeed * game.frameDeltaTime));
    }
  }
  
  void draw(Game game) {
    game.window.setClearColor(color(0, 100, 0));                                   //Sets clearing color
    
    road.colMouse();
    road.draw(game);
  }
}
