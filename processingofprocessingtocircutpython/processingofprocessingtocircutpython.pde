import processing.serial.*;
int value = 0;
float X;
float Y;
int movedX, movedY;
String numbers = "";

Serial myPort;

void setup() {
     myPort = new Serial(this, Serial.list()[2], 9600);
     println("Available serial ports:");
     println(Serial.list());
     size(300,450);
     strokeWeight(4);
     stroke(255, 0, 144);
     rect(0,0,299,449);
     line(0,325,300,325);
     strokeWeight(1);
     stroke(0);
     line(150,2,150,323);
     line(2,162.5,298,162.5);
     fill(66, 66, 66);
     textSize(32);
     text("Servo 1:", 25, 365);
     fill(66, 66, 66);
     textSize(32);
     text("Servo 2:", 25, 415); 
     frameRate(10);
}

void draw() {
  fill(value);
  myPort.write(numbers);
  println(numbers);
}

void mouseMoved() {
  background(255);
  strokeWeight(4);
  stroke(255, 0, 144);
  fill(255);
  rect(0,0,299,449);
  line(0,325,300,325);
  strokeWeight(1);
  stroke(0);
  line(150,2,150,323);
  line(2,162.5,298,162.5);
  fill(66, 66, 66);
  textSize(32);
  text("Servo 1:", 25, 365);
  fill(66, 66, 66);
  textSize(32);
  text("Servo 2:", 25, 415); 
  stroke(66, 192, 255);
  fill(66, 192, 255);
  circle(mouseX, mouseY, 10);
  X= map(mouseX, 0, 295, 0, 180);
  Y= map(mouseY, 0, 325, 0, 180);
  if (X > 180)
    X = 180;
  if (Y > 180)
    Y = 180;
  text(int(X), 175 ,365);
  text(int(Y), 175 ,415);
  //mouseX = movedX;
  //mouseY = movedY;
  
  numbers = str(int(X)) + "-" + str(int(Y)) + "*";
  
}

// credit to Imogen Armstrong
