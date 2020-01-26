///The Game class contains important variables and functions for the whole program

/* 
 * Contains Time variables and the window.
 *
 */

class Game {
  int frameDeltaTime = 0, passedTimeLastFrame = 0, passedTime = 0;    //Time between Frames, time the last frame started, time this frame started
  State currentState = State.MAINMENU;                                //State enum that shows the current game state
  PVector cameraPosition = new PVector(0, 0);                         //Saves the position of the upper left corner of the window
  
  Window window;                                                      //Declaring game window
  Event event;
  MainMenuState mainMenuState;                                        //A class that provides the main menu
  PlayState playState;                                                //A class that provides the play state
  
  Game() {
  }
  
  Game(PVector windowSize) {
    window = new Window(windowSize);                                  //initializing window
    mainMenuState = new MainMenuState();                              //initializing main menu
    playState = new PlayState();                                      //initializing play state
    event = new Event();
  }
  
  //Sets the camera position
  //pos = upper left corner of the window
  void setCameraPosition(PVector pos) {
    cameraPosition = pos;
  }
  
  ///Should be called at the beginning of every Frame 
  void startFrame() {
    passedTime = millis();                                    //saves current time
  }
  
  ///Should be called at the ending of every Frame 
  void endFrame() {
    frameDeltaTime = passedTime - passedTimeLastFrame;        //Calculates the passed time between Frames
    passedTimeLastFrame = passedTime;                         //saves time to calculate delta Frame Time
  }  
}
