void serialEvent(Serial myPort) {
      interval = millis();   
      String myString = myPort.readStringUntil(linefeed);
      if (myString != null) {
        //myString = trim(myString);
        // println(myString);
        msg = (split(myString, ','));
        for (i=0; i< 3; i++ ) {
          value[i]=float (msg[i]);    
 //         print(value[i] + " - ");      
        }
 //       println();
      }
}