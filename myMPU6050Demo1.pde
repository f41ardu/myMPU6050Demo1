
import processing.serial.*;
import processing.opengl.*;
import toxi.geom.*;
import toxi.processing.*;

ToxiclibsSupport gfx;
    
    Serial myPort;
    float[] value=new float[4];
//    float[] q=new float[4];
    int i=0;
    int k=100;
    int interval;
    int linefeed = 10;   // Linefeed in ASCII
    String[] msg=new String[5];
    PImage img,img2;

    
    void setup()
    {
      size(800,800,P3D);
      noStroke();
      
      img = loadImage("GY-521_Front.JPG");
      img.resize(200, 100);
      img2 = loadImage("GY-521_Back.JPG");
      img2.resize(200, 100);
      imageMode(CENTER);
      
      String portName="COM5";
      myPort = new Serial(this, portName, 115200);
      myPort.bufferUntil(linefeed);
      myPort.write('r');
      frameRate(100);
      background(255);
      fill(246, 225, 65);
      lights();
    }

    void draw()
    {
       if (millis() - interval > 1000) {
         // resend single character to trigger DMP init/start
         // in case the MPU is halted/reset while applet is running
         myPort.write('r');
         interval = millis();
        }
   
    // black background
    background(0);
    // translate everything to the middle of the viewport
    pushMatrix();
    translate(width / 2, height / 2);
    rotateX(value[2]);   // MPU y 
    rotateY(-value[0]);  // MPU z
    rotateZ(value[1]);   // MPU x
     
//    drawModell();    
    drawbox();
    
    popMatrix();
}
    
   
     

    