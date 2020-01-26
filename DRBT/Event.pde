///Buffers key inputs

/*
 *
 *
 */
 
class Event {
  int keyBuffer[] = new int[0];
  
  Event() {
  }
  
  //Adds a keyCode to the keyBuffer if it isn't already
  void addKeyToBuffer(int iKey) {
    //Check if the keyCode is already in the buffer
    for(int i = 0; i != keyBuffer.length; ++i) {
      if(iKey == keyBuffer[i]) {
        return;                                  //exits function if keyCode is already in the buffer
      }
    }
    keyBuffer = append(keyBuffer, iKey);         //adds keyCode if the keyCode isn't in the buffer
  }
  
  //Checks if a keyCode is in the keyBuffer if it is it gets removed
  void removeKeyFromBuffer(int iKey) {
    int buffer[] = new int[0];                        //saves the new keyBuffer
    
    //Check if the key code is the one that should be removed and removes it
    for(int i = 0; i != keyBuffer.length; ++i) {
      if(keyBuffer[i] != iKey) {
        buffer = append(buffer, keyBuffer[i]);
      }
    }
    keyBuffer = buffer;
  }
}
