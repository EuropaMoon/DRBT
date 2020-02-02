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
    boxPO = boxPO.add(game.cameraPosition);
    boxPT = boxPT.add(game.cameraPosition);
    
    //Collision mouse Road
    if((mouseX < boxPO.x && mouseX > boxPT.x &&
        mouseY < boxPO.y && mouseY > boxPT.y)) {
          
          //Calcullating the translation for the corner positions of the Road
          PVector translation = new PVector(0, 0);
          translation.y = size / 2 * sin((atan((points[1].x - points[0].x) / (points[1].y - points[0].y))));
          translation.x = sqrt(pow(size / 2, 2) - pow(abs(translation.y), 2));
          
          //Calcullating the translation for the bounding box(top and bottom) of the Road (50 = size of bounding box)
          PVector translationFIR = new PVector(0, 0);
          translationFIR.x = 50 * sin((atan(abs(points[1].x - points[0].x) / abs(points[1].y - points[0].y))));
          translationFIR.y = sqrt(pow(50, 2) - pow(abs(translationFIR.x), 2));
          
          //Calcullates the Road(bounding box) vertices
          PVector vertices[] = new PVector[8];
          //Outer bounding box vertices
          vertices[4] = new PVector(points[0].x + translation.x, points[0].y - translation.y).add(game.cameraPosition);
          vertices[5] = new PVector(points[0].x - translation.x, points[0].y + translation.y).add(game.cameraPosition);
          vertices[6] = new PVector(points[1].x + translation.x, points[1].y - translation.y).add(game.cameraPosition);
          vertices[7] = new PVector(points[1].x - translation.x, points[1].y + translation.y).add(game.cameraPosition);
          
          //Inner bounding box vertices
          vertices[0] = new PVector(0, 0);
          vertices[1] = new PVector(0, 0);
          vertices[2] = new PVector(0, 0);
          vertices[3] = new PVector(0, 0);
          
          //Calcullating inner bounding box vertices
          if (points[0].x - points[1].x < 0) {                      //Testing if delta x is positive
            vertices[0].x = vertices[4].x + translationFIR.x;
            vertices[1].x = vertices[5].x + translationFIR.x;
            
            vertices[2].x = vertices[6].x - translationFIR.x;
            vertices[3].x = vertices[7].x - translationFIR.x;
          }else {
            vertices[0].x = vertices[4].x - translationFIR.x;
            vertices[1].x = vertices[5].x - translationFIR.x;
            
            vertices[2].x = vertices[6].x + translationFIR.x;
            vertices[3].x = vertices[7].x + translationFIR.x;
          }
          
          if (points[0].y - points[1].y < 0) {                      //Testing if delta y is positive
            vertices[0].y = vertices[4].y + translationFIR.y;
            vertices[1].y = vertices[5].y + translationFIR.y;
            
            vertices[2].y = vertices[6].y - translationFIR.y;
            vertices[3].y = vertices[7].y - translationFIR.y;
          }else {
            vertices[0].y = vertices[4].y - translationFIR.y;
            vertices[1].y = vertices[5].y - translationFIR.y;
            
            vertices[2].y = vertices[6].y + translationFIR.y;
            vertices[3].y = vertices[7].y + translationFIR.y;
          }
          
          //Checks for a mouse collision with inner bounding box
          if(sat(new PVector[] { vertices[0], vertices[1],
                                 vertices[2], vertices[3] },
                 new PVector[] { new PVector(mouseX - 1, mouseY - 1), 
                                 new PVector(mouseX + 1, mouseY - 1), 
                                 new PVector(mouseX - 1, mouseY + 1), 
                                 new PVector(mouseX + 1, mouseY + 1)})) {
                                   println(mouseX);
            cursor( MOVE );
            
          //Checks for a mouse collision with outer bounding box
          }else if(sat(new PVector[] { vertices[4], vertices[5],
                                       vertices[0], vertices[1] },
                       new PVector[] { new PVector(mouseX - 1, mouseY - 1), 
                                       new PVector(mouseX + 1, mouseY - 1), 
                                       new PVector(mouseX - 1, mouseY + 1), 
                                       new PVector(mouseX + 1, mouseY + 1)})) {
            cursor( HAND );
            
          //Checks for a mouse collision with outer bounding box
          }else if(sat(new PVector[] { vertices[6], vertices[7],
                                       vertices[2], vertices[3] },
                       new PVector[] { new PVector(mouseX - 1, mouseY - 1), 
                                       new PVector(mouseX + 1, mouseY - 1), 
                                       new PVector(mouseX - 1, mouseY + 1), 
                                       new PVector(mouseX + 1, mouseY + 1)})) {
            cursor( HAND );
          }else {
            cursor( ARROW );
          }
    }
  }
  
  void draw(Game game) {
    strokeCap(SQUARE);
    
    stroke(0);
    strokeWeight(size);
    line(game.cameraPosition.x + points[0].x, game.cameraPosition.y + points[0].y, game.cameraPosition.x + points[1].x, game.cameraPosition.y + points[1].y);
    
    stroke(255);
    strokeWeight(size / 10);
    line(game.cameraPosition.x + points[0].x, game.cameraPosition.y + points[0].y, game.cameraPosition.x + points[1].x, game.cameraPosition.y + points[1].y);
  }
}
