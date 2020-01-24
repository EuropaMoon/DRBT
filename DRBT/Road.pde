///Road creates and obtains a road
/*
 *
 *
*/

class Road {
  PVector points[] = new PVector[2];   //start and end point of line
  int size;                            //width of the road
  
  Road(PVector points[], int size) {
    this.points = points;
    this.size = size;
  }
  
  Road(PVector pointOne, PVector pointTwo, int size) {
    this.points[0] = pointOne;
    this.points[1] = pointTwo;
    this.size = size;
  }
  
  void colMouse() {
    PVector boxPO = new PVector(0, 0);
    PVector boxPT = new PVector(0, 0);
    
    //Calcullating the corner position for the bounding box       corner position 
    if(points[0].x > points[1].x) {                            //  ↘_______________
      boxPO = new PVector(points[0].x + size / 2, boxPO.y);    //  |              |  <-- bounding box
      boxPT = new PVector(points[1].x - size / 2, boxPT.y);    //  | \            |
    }else {                                                    //  |  \           |
      boxPO = new PVector(points[1].x + size / 2, boxPO.y);    //  |   \          |
      boxPT = new PVector(points[0].x - size / 2, boxPT.y);    //  |    \         |
    }                                                          //  |     \ <------|------ road
                                                               //  |      \       |
    if(points[0].y > points[1].y) {                            //  |       \      |
      boxPO = new PVector(boxPO.x, points[0].y + size / 2);    //  |        \     |
      boxPT = new PVector(boxPT.x, points[1].y - size / 2);    //  |         \    |
    }else {                                                    //  |          \   |
      boxPO = new PVector(boxPO.x, points[1].y + size / 2);    //  |           \  |
      boxPT = new PVector(boxPT.x, points[0].y - size / 2);    //  |            \ |
    }                                                          //  |______________|
                                                               //                  ↖corner position
    if((mouseX < boxPO.x && mouseX > boxPT.x &&
        mouseY < boxPO.y && mouseY > boxPT.y)) {
          
          PVector dot[] = new PVector[4];
          //dot[0] = ; 
          
          if(true) {
            game.window.setClearColor(color(255, 0, 0));
          }
    }
  }
  
  void draw() {
    strokeCap(SQUARE);
    
    stroke(0);
    strokeWeight(size);
    line(points[0].x, points[0].y, points[1].x, points[1].y);
    
    stroke(255);
    strokeWeight(size / 10);
    line(points[0].x, points[0].y, points[1].x, points[1].y);
  }
}
