///Handles the Play state

/*
 *
 *
 */
 
class PlayState {
  Road road = new Road(new PVector(80, 40), new PVector(100, 150), 20);
  
  PlayState() {
  }
  
  void update(Game game) {
  }
  
  void draw(Game game) {
    game.window.setClearColor(color(0, 100, 0));                                   //Sets clearing color
    
    road.colMouse();
    road.draw();
  }
}
