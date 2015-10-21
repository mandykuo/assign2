final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_WIN = 2;
final int GAME_OVER = 3;

float x = 590;
float y = 240;
float speed = 5;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;


int gameState;
int b=floor(random(200));
int c;
int d=floor(random(450));
int e=floor(random(640));
int f=floor(random(480));
int z;

PImage img1, img2, img3, img4, img5, img6, img7, img8, img9, img10;


void setup () {
  
  size(640,480);
  
  //load images
  img1=loadImage("img/enemy.png");
  img2=loadImage("img/fighter.png");
  img3=loadImage("img/treasure.png");
  img4=loadImage("img/hp.png");
  img5=loadImage("img/bg1.png");
  img6=loadImage("img/bg2.png");
  img7=loadImage("img/start1.png");
  img8=loadImage("img/start2.png");
  img9=loadImage("img/end1.png");
  img10=loadImage("img/end2.png");
  gameState = GAME_START;
}

void draw() {
  
   if (upPressed) {
    y -= speed;
  }
  if (downPressed) {
    y += speed;
  }
  if (leftPressed) {
    x -= speed;
  }
  if (rightPressed) {
    x += speed;
  }

//boundary detection
if(x>width-50){
  x=width-50;
}
if(x<0){
  x=0;
}
if(y>height-50){
  y=height-50;
}
if(y<0){
  y=0;
}
  
  
  background(0);
  image(img8,0,0);
  
  switch (gameState){
    case GAME_START:
    // mouse action
      if (mouseX >210 && mouseX < 450 && mouseY > 380 && mouseY < 430){
        if (mousePressed){
          // click
          gameState = GAME_RUN;
        }else{
          // hover
          image(img7,0,0);
          
        }
      }
    break;
    
  
    case GAME_RUN:
    //background
    image(img5,z,0);
    image(img6,z-640,0);
    image(img5,z-1280,0);
    z++;
    z%=1280;
    
    //enemy
    image(img1,c,d);
    c+=4;
    c%=640;
    
    //fighter
    image(img2,x,y);
    
    //treasure
    image(img3,e,f);
    
    //blood
    rect(15,10,b,30);
    fill(255,0,0);
    
    //hp
    image(img4,10,10);
    
    //game over condition
    if(c<=x+50 && c>=x-50){
      if(d<=y+50 && d>=y-50){
       gameState = GAME_OVER;
      } 
     }
 break;
 
     
    case GAME_OVER:
      
      // mouse action
      if (mouseX >210 && mouseX < 420 && mouseY > 300 && mouseY < 350){
        if (mousePressed){
          // click
          gameState = GAME_START;
        }else{
          // hover
          image(img9,0,0);
        }
      }
      image(img10,0,0);
  
  }
}



void keyPressed() {
  if (key == CODED) {  
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
