import gab.opencv.*;
import processing.video.*;
import java.awt.*;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage title;
PImage title2;
PImage title3;
PImage title4;
PImage title5;
PImage title6;
int screen;

Capture video;
OpenCV opencv;

int minStrLen;
int maxStrLen;
int charSize = 10;
color strColor = color(64, 192, 64);
char charset[] = {'0', '1'};

MString Strings[];

void setup()
{
  size(850,850,P3D);
  
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  img1 = loadImage("oculus1.png");
  img2 = loadImage("oculus2.png");
  img3 = loadImage("psvr.png");
  img4 = loadImage("htcvive.png");
  title= loadImage("title.png");
  title2= loadImage("title2.png");
  title3= loadImage("title3.png");
  title4= loadImage("title4.png");
  title5= loadImage("title5.png");
  title6= loadImage("title6.png");
  video.start();
  
  minStrLen = (height / charSize) / 2;
  maxStrLen = (height / charSize) * 7/ 8;
  
  Strings = new MString[width / charSize];
  
  for (int s = 0; s < Strings.length; s++)
    Strings[s] = new MString(s * charSize);

}

void draw()
{
  
  switch(screen) {
  case 0:
    intro();
    break;
  case 1:
    choose();
    break;
  case 2:
    oculus1();
    break;
  case 3:
    oculus2();
    break;
  case 4:
    psvr();
    break;
  case 5:
    htcvive();
    break;
  } 
  
}

void captureEvent(Capture c) {
  c.read();
}


void intro(){
  background(0);
  noStroke();

  fill(0);  
  title = loadImage("title.png");
  image(title, 350, 120);
   textSize(10);
  for (int s = 0; s < Strings.length; s++)
  {
    Strings[s].move();
    Strings[s].display();
  }
  textSize(60);
  pushMatrix();
  textSize(42);
  rect(40, 450, 650, 70);
  fill(random(0, 100));
  text("Presiona 1 para continuar", 40, 500);
  popMatrix();
  

  keyPressed();
  if (key == '1') {
    screen = 1;
  }
}


void choose(){
  
  background(0);
  noStroke(); 
  textSize(10);
  for (int s = 0; s < Strings.length; s++)
  {
    Strings[s].move();
    Strings[s].display();
  }
  textSize(60);
  pushMatrix();
  title2 = loadImage("title2.png");
  image(title2, 380, 150);
  popMatrix();
  
  pushMatrix();
  title3 = loadImage("title3.png");
  image(title3, 20, 20);
  popMatrix();
  
  pushMatrix();
  title4 = loadImage("title4.png");
  image(title4, 20, 200);
  popMatrix();
  
  pushMatrix();
  title5 = loadImage("title5.png");
  image(title5, 20, 380);
  popMatrix();
  
  pushMatrix();
  title6 = loadImage("title6.png");
  image(title6, 20, 550);
  popMatrix();
  
   keyPressed();
  if (key == '0') {
    screen = 2;
  }
  
    if (key == '1') {
    screen = 3;
  }
  
  if (key == '2') {
    screen = 4;
  }
  
   if (key == '3') {
    screen = 5;
  }
}


void oculus1(){
  background(0);
  scale(3);
  opencv.loadImage(video);
  image(video, 0, 0 );
  textSize(10);
  for (int s = 0; s < Strings.length; s++)
  {
    Strings[s].move();
    Strings[s].display();
  }
  textSize(60);
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    image(img1, faces[i].x, faces[i].y-25, faces[i].width, faces[i].height);
  }
  
  pushMatrix();
  textSize(30);
  fill(0);
  text("Press 5 to choose again", 70, 270);
  popMatrix();
  
  keyPressed();
  if (key == '5') {
    screen = 1;
  }
}


void oculus2(){
    background(0);
  scale(3);
  opencv.loadImage(video);
  image(video, 0, 0 );

  textSize(10);
  for (int s = 0; s < Strings.length; s++)
  {
    Strings[s].move();
    Strings[s].display();
  }
  textSize(60);
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    image(img2, faces[i].x, faces[i].y-25, faces[i].width, faces[i].height);
  }
  
  pushMatrix();
  textSize(60);
  translate(20,500);
  fill(255);
  text("Presiona 5 para regresar", 70, 100);
  popMatrix();
  
  keyPressed();
  if (key == '5') {
    screen = 1;
  }
}


void psvr(){
  background(0);
  scale(3);
  opencv.loadImage(video);
  image(video, 0, 0 );
  textSize(10);
  for (int s = 0; s < Strings.length; s++)
  {
    Strings[s].move();
    Strings[s].display();
  }
  
  textSize(60);
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    image(img3, faces[i].x, faces[i].y-25, faces[i].width, faces[i].height);
  }
  
  pushMatrix();
  textSize(20);
  fill(255);
  text("Press 5 to choose again", 70, 270);
  popMatrix();
  
  keyPressed();
  if (key == '5') {
    screen = 1;
  }
}


void htcvive(){
    background(0);
  scale(3);
  opencv.loadImage(video);
  image(video, 0, 0 );
  textSize(10);
  for (int s = 0; s < Strings.length; s++)
  {
    Strings[s].move();
    Strings[s].display();
  }
  textSize(60);
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    image(img4, faces[i].x, faces[i].y-25, faces[i].width, faces[i].height);
  }
  
  pushMatrix();
  textSize(60);
  fill(0);
  text("Press 5 to choose again", 70, 270);
  popMatrix();
  
  keyPressed();
  if (key == '5') {
    screen = 1;
  }
}
class MString
{
  int x;
  int strLen;
  char chars[];
  int currY;
  int speed;
  int updFreq;

  MString(int tx)
  {
    x = tx;
    strLen = int(random(minStrLen, maxStrLen));
    chars = new char[strLen];
    for (int i = 0; i < strLen; i++)
    {
      chars[i] = charset[int(random(charset.length))];
    }
    currY = int(random(-strLen*2, -strLen)); //I want all of the strings to start outside of the screen
    speed = int(random(1, 3));
    updFreq  = int(random(2, 5)); //how many steps for the symbols to update
  }

  void move()
  {
    if (frameCount % speed == 0)
    {  
      currY ++; //move one line down
      for (int i = 0; i < strLen-1; i++)
      {
        chars[i] = chars[i+1];
        if (int(random(10)) == updFreq)
          chars[i] = charset[int(random(charset.length))]; //The strings in the original Matrix scrollers change constantly, so we renew the string
      }
      chars[strLen-1] = charset[int(random(charset.length))];
    }
  }

  void display()
  {
    fill(strColor);
    for (int i = 0; i < strLen-1; i++) 
      text(chars[i], x, ((currY + i) * charSize) % height);
  }
}