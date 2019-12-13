import processing.serial.*;
Serial myPort = new Serial(this, Serial.list()[2], 9600);
int rad1 = 120;
int rad2 = 25;
float xpos, ypos;

void setup() {
  println("Available serial ports:");
  println(Serial.list()); 
  background (50, 153, 168);
  size(300, 300);
  strokeWeight(2);
  frameRate(30);
  ellipseMode(RADIUS);
  xpos = width/2;
  ypos = height/2;
  fill (233, 240, 234);
   ellipse(xpos, ypos, rad1, rad1);
  fill (151, 119, 163);
    ellipse(xpos, ypos, rad2, rad2);
   line (30, 150, 65, 150);
   line (150, 65, 150, 30);
   line (270, 150, 235, 150);
   line (90, 90, 60, 70);
   line (240, 70, 215, 90);
    
 
}

void draw() {
  if (myPort.available() > 0)
  {
   
 background (50, 153, 168);
 fill (233, 240, 234);
   ellipse(xpos, ypos, rad1, rad1);
  fill (151, 119, 163);
    ellipse(xpos, ypos, rad2, rad2);
   line (30, 150, 65, 150);
   line (150, 65, 150, 30);
   line (270, 150, 235, 150);
   line (90, 90, 60, 70);
   line (240, 70, 215, 90);
   int myNum = myPort.read();
   float ax = 150+rad1*cos(radians(myNum));
   float ay = 150-rad1*sin(radians(myNum));
   line(150,150, ax,ay);
   println(myNum);
  }
  }
  
// credit to Imogen Armstrong
