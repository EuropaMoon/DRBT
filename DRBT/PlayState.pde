///Handles the Play state

/*
 *
 *
 */
 
class PlayState {
  Road road = new Road(new PVector[] { new PVector(100, 100), new PVector(300, 300) }, 120);
  float movementSpeed = 0.5;
  
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
    
    //Update 
    road.points = new PVector[] { new PVector(game.cameraPosition.x + 100, game.cameraPosition.y + 100), new PVector(game.cameraPosition.x + 300, game.cameraPosition.y + 300) };
  }
  
  void draw(Game game) {
    game.window.setClearColor(color(0, 100, 0));                                   //Sets clearing color
    
    //road = new Road(new Coordinates(100, 80), game.posRelativeToWindow(new Coordinates(mouseX, mouseY)), 120);
    
    road.colMouse();
    road.draw();
  }
}
