//Simple pressable button

/*
 * A Button class that provides a drawable button and a collision detection.
 *
 */

class Button {
  PVector pos, size;                                  //Button position, Button size
  String text;                                        //Text that gets displayed
  int textSize;                                       //Font size
  color bColor, tColor;                               //Button color, Text Color
  boolean buttonBackground;                           //True: Button gets a background colored with bColor | False: no background
  
  //Constructor to create a button without background 
  Button(PVector pos, PVector size, String text, int textSize, color tColor) {
    this.pos = pos;
    this.size = size;
    this.text = text;
    this.textSize = textSize;
    this.bColor = 0;
    this.tColor = tColor;
    this.buttonBackground = false;
  }
  
  //Constructor to create a button with background
  Button(PVector pos, PVector size, String text, int textSize, color tColor, color bColor) {
    this.pos = pos;
    this.size = size;
    this.text = text;
    this.textSize = textSize;
    this.bColor = bColor;
    this.tColor = tColor;
    this.buttonBackground = true;
  }
  
  //Collision detection for Button
  boolean isSelected() {
    if(mouseX < pos.x + size.x / 2 && mouseX > pos.x - size.x / 2 &&
       mouseY < pos.y + size.y / 2 && mouseY > pos.y - size.y / 2) {
         return true;
    }  
    return false;
  }
  
  void draw() {
    //Checks if a Button background should be drawn //<>// //<>//
    if(buttonBackground) {
      fill(bColor);                              //sets Color for Button background
      rect(pos.x, pos.y, size.x, size.y);        //draws Button background
    }
    
    //Draws Button Text
    fill(tColor);                                                  //sets Color for Button Text
    textSize(textSize);                                            //sets Font size
    text(text, pos.x - textWidth(text) / 2, pos.y + textSize / 3); //draws Button Text
  }
}
