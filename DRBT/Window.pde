///Obtains a Window

/*
 * Saves the window size and handles basic window functions.
 *
 */

class Window {
  PVector size;                      //Window size
  color clearColor;                  //Color that the clear function uses to clear the window
  
  ///Expects the window size
  Window(PVector size) {
    this.size = size;
    clearColor = color(0, 0, 0);
  }
  
  //Modifies the location from which rectangles are drawn
  void setRectMode(int rectMode) {
    rectMode(rectMode);
    ellipseMode(CENTER);
  }
  
  //Modifies the clear color
  void setClearColor(color clearColor) {
    this.clearColor = clearColor;
  }
  
  ///Draws the whole window black
  void clear() {
    background(clearColor);        //0 = black, 255 = white
  }
  
  ///Closes the window
  void close() {
    exit();                        //Closes window
  }
}
