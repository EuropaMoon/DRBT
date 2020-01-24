//Simple pressable button

/*
 *
 *
*/

class Button {
  PVector pos, size;                                  //Button position, Button size
  String text;                                        //Text that gets displayed
  color bColor;                                       //Button color
  
  Button(PVector pos, PVector size, String text, color bColor) {
    this.pos = pos;
    this.size = size;
    this.text = text;
    this.bColor = bColor;
  }
}
