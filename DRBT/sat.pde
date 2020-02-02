//Implementation of the separating axis theorem
/*
 *
 *
 */
boolean sat(PVector vBO[], PVector vBT[]) {

  PVector test = new PVector(vBT[0].x - vBT[1].x, vBT[0].y - vBT[1].y);
  
  //Checking every Axis for a shadow collision
  if(checkAxis(test, vBO, vBT)) {
    test = new PVector(vBT[0].y - vBT[1].y, vBT[0].x - vBT[1].x);
    if(checkAxis(test, vBO, vBT)) {
      test = new PVector(vBO[0].x - vBO[1].x, vBO[0].y - vBO[1].y);
      if(checkAxis(test, vBO, vBT)) {
        test = new PVector(vBO[0].y - vBO[1].y, -(vBO[0].x - vBO[1].x));
        if(checkAxis(test, vBO, vBT)) {
          return true;
        }
      }
    }
  }
  return false;
}

boolean checkAxis(PVector Axis, PVector verticesBoxOne[], PVector verticesBoxTwo[]) {
  
  //Calculating the dot product for every vertice (verticesBoxOne) "creating shadows"
  int dotProductsBoxOne[] = new int[4];
  dotProductsBoxOne[0] = int(new PVector(Axis.x, Axis.y).dot(verticesBoxOne[0]));
  dotProductsBoxOne[1] = int(new PVector(Axis.x, Axis.y).dot(verticesBoxOne[1]));
  dotProductsBoxOne[2] = int(new PVector(Axis.x, Axis.y).dot(verticesBoxOne[2]));
  dotProductsBoxOne[3] = int(new PVector(Axis.x, Axis.y).dot(verticesBoxOne[3]));
  
  //Calculating the dot product for every vertice (verticesBoxTwo) "creating shadows"
  int dotProductsBoxTwo[] = new int[4];
  dotProductsBoxTwo[0] = int(new PVector(Axis.x, Axis.y).dot(verticesBoxTwo[0]));
  dotProductsBoxTwo[1] = int(new PVector(Axis.x, Axis.y).dot(verticesBoxTwo[1]));
  dotProductsBoxTwo[2] = int(new PVector(Axis.x, Axis.y).dot(verticesBoxTwo[2]));
  dotProductsBoxTwo[3] = int(new PVector(Axis.x, Axis.y).dot(verticesBoxTwo[3]));
  
  //searching the highest and lowest dot product for BoxOne and BoxTwo
  int dotProductsBO[] = new int[] { dotProductsBoxOne[0], dotProductsBoxOne[0] };        //dot products for verticesBoxOne [beginning of shadow, end of shadow]
  int dotProductsBT[] = new int[] { dotProductsBoxTwo[0], dotProductsBoxTwo[0] };        //dot products for verticesBoxTwo [beginning of shadow, end of shadow]
  
  //searching the beginning of shadow and the ending
  for(int i = 0; i != 4; ++i) {
    if(dotProductsBO[0] > dotProductsBoxOne[i]) {
      dotProductsBO[0] = dotProductsBoxOne[i];
    }
    if(dotProductsBO[1] < dotProductsBoxOne[i]) {
      dotProductsBO[1] = dotProductsBoxOne[i];
    }
      
    if(dotProductsBT[0] > dotProductsBoxTwo[i]) {
      dotProductsBT[0] = dotProductsBoxTwo[i];
    }
    if(dotProductsBT[1] < dotProductsBoxTwo[i]) {
      dotProductsBT[1] = dotProductsBoxTwo[i];
    }
  }
  
  //Checking if shadow overlap
  if(dotProductsBO[0] < dotProductsBT[1] && dotProductsBO[1] > dotProductsBT[0]) {
    return true;
  }
  return false;
}
