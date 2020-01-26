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
    //Collision mouse Road
    if((mouseX < boxPO.x && mouseX > boxPT.x &&
        mouseY < boxPO.y && mouseY > boxPT.y)) {
          
          //Calcullating the translation for the corner positions of the Road
          PVector translation = new PVector(0, 0);
          translation.y = size / 2 * sin((atan((points[1].x - points[0].x) / (points[1].y - points[0].y))));
          translation.x = sqrt(pow(size / 2, 2) - pow(translation.y, 2));
          
          //Calcullates the Road vertices
          PVector vertices[] = new PVector[4];
          vertices[0] = new PVector(points[0].x + translation.x, points[0].y - translation.y);
          vertices[1] = new PVector(points[0].x - translation.x, points[0].y + translation.y);
          vertices[2] = new PVector(points[1].x + translation.x, points[1].y - translation.y);
          vertices[3] = new PVector(points[1].x - translation.x, points[1].y + translation.y);
          
          if(sat(vertices, new PVector[] { new PVector(mouseX - 1, mouseY - 1), 
                                           new PVector(mouseX + 1, mouseY - 1), 
                                           new PVector(mouseX - 1, mouseY + 1), 
                                           new PVector(mouseX + 1, mouseY + 1)})) {
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
