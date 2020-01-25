///Handles the Play state

/*
 *
 *
 */
 
class PlayState {
  Road road = new Road(new PVector(100, 80), new PVector(190, 190), 120);
  
  PlayState() {
  }
  
  void update(Game game) {
  }
  
  void draw(Game game) {
    game.window.setClearColor(color(0, 100, 0));                                   //Sets clearing color
    
    road = new Road(new PVector(100, 80), new PVector(mouseX, mouseY), 120);
    
    road.colMouse();
    road.draw();
  }
}
