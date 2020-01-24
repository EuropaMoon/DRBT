///The Game class contains important variables and functions for the whole program

/* 
 * Contains Time variables and the window.
 *
 */

class Game {
  int frameDeltaTime = 0, passedTimeLastFrame = 0, passedTime = 0;    //Time between Frames, time the last frame started, time this frame started
  Window window;
  
  Game(PVector windowSize) {
    window = new Window(windowSize);
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
