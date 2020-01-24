///Handles the Main Menu state

/*
 *
 *
 */
 
class MainMenuState {
  
  Button playButton = new Button(new PVector(width / 2, height / 2 - 60), new PVector(100, 50), "Play", 100, color(25, 25, 25));    //Button to enter the playState
  Button exitButton = new Button(new PVector(width / 2, height / 2 + 60), new PVector(100, 50), "Exit", 100, color(25, 25, 25));    //Button to end the process
  
  MainMenuState() {
  }
  
  void update(Game game) {
    
    //Exit Button Collision detection and reaction
    if(exitButton.isSelected() && mousePressed && mouseButton == LEFT)
      game.window.close();                                                        //End process
    //Play Button Collision detection and reaction
    else if(playButton.isSelected() && mousePressed && mouseButton == LEFT)
      println("oki");
  }
  
  void draw(Game game) {
    playButton.draw();
    exitButton.draw();
  }
}
