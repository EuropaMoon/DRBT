///Obtains a Window

/*
 * Saves the window size and handles basic window functions.
 *
 */

class Window {
  PVector size;                      //Window size
  
  ///Expects the window size
  Window(PVector size) {
    this.size = size;
  }
  
  //Modifies the location from which rectangles are drawn
  void setRectMode(int rectMode) {
    rectMode(rectMode);
  }
  
  ///Draws the whole window black
  void clear() {
    background(0);                  //0 = black, 255 = white
  }
  
  ///Closes the window
  void close() {
    close();                        //Closes window
  }
}
