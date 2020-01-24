///Handles the Main Menu state

/*
 *
 *
 */
 
class MainMenuState {
  
  Button playButton = new Button(new PVector(width / 2, height / 2 - 60), new PVector(100, 50), "Play", 100, color(255, 255, 255));    //Button to enter the playState
  Button exitButton = new Button(new PVector(width / 2, height / 2 + 60), new PVector(100, 50), "Exit", 100, color(255, 255, 255));    //Button to end the process
  
  MainMenuState() {
  }
  
  //Handles Events
  void update(Game game) {
    
    //Exit Button Collision detection and reaction
    if(exitButton.isSelected() && mousePressed && mouseButton == LEFT)
      game.window.close();                                                        //End process
    //Play Button Collision detection and reaction
    else if(playButton.isSelected() && mousePressed && mouseButton == LEFT)
      game.currentState = State.PLAY;                                             //Switches state to play state
  }
  
  //Draws the Main Menu
  void draw(Game game) {
    game.window.setClearColor(color(0, 0, 100));                                   //Sets clearing color
    
    //Draws Buttons
    playButton.draw();
    exitButton.draw();
  }
}
