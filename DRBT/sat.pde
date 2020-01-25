//Implementation of the separating axis theorem
/*
 *
 *
 */
boolean sat(PVector verticesBoxOne[], PVector verticesBoxTwo[]) {
  
  //searching the highest and lowest position for BoxOne
  PVector lowestPointBO = new PVector(width, height);
  PVector highestPointBO = new PVector(0, 0);
  for(int i = 0; i != verticesBoxOne.length; ++i) {
    if(lowestPointBO.x > verticesBoxOne[i].x)
      lowestPointBO.x = verticesBoxOne[i].x;
    if(highestPointBO.x < verticesBoxOne[i].x)
      highestPointBO.x = verticesBoxOne[i].x;
      
    if(lowestPointBO.y > verticesBoxOne[i].y)
      lowestPointBO.y = verticesBoxOne[i].y;
    if(highestPointBO.y < verticesBoxOne[i].y)
      highestPointBO.y = verticesBoxOne[i].y;
  }
  //searching the highest and lowest position for BoxTwo
  PVector lowestPointBT = new PVector(width, height);
  PVector highestPointBT = new PVector(0, 0);
  for(int i = 0; i != verticesBoxOne.length; ++i) {
    if(lowestPointBT.x > verticesBoxTwo[i].x)
      lowestPointBT.x = verticesBoxTwo[i].x;
    if(highestPointBT.x < verticesBoxTwo[i].x)
      highestPointBT.x = verticesBoxTwo[i].x;
      
    if(lowestPointBT.y > verticesBoxTwo[i].y)
      lowestPointBT.y = verticesBoxTwo[i].y;
    if(highestPointBT.y < verticesBoxTwo[i].y)
      highestPointBT.y = verticesBoxTwo[i].y;
  }
  
  rectMode(CORNER);
  //Top lines
  fill(255);
  rect(new PVector(1, 0).dot(lowestPointBO), 0, new PVector(1, 0).dot(highestPointBO) - new PVector(1, 0).dot(lowestPointBO), 20);
  rect(0, new PVector(0, 1).dot(lowestPointBO), 20, new PVector(0, 1).dot(highestPointBO) - new PVector(0, 1).dot(lowestPointBO));
  //Side lines
  fill(color(255, 0, 0));
  rect(new PVector(1, 0).dot(lowestPointBT), 0, new PVector(1, 0).dot(highestPointBT) - new PVector(1, 0).dot(lowestPointBT), 40);
  rect(0, new PVector(0, 1).dot(lowestPointBT), 40, new PVector(0, 1).dot(highestPointBT) - new PVector(0, 1).dot(lowestPointBT));
  rectMode(CENTER);
          
  println(new PVector(1, 0).dot(verticesBoxOne[3]));
  
  if(true) {
  }
  
  return true;
}
