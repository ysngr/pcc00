/* 002_20190415 */

void setup() {
  size(1000, 1000);
  background(40);
  noLoop();
  blendMode(SCREEN);
  strokeWeight(0.8);
  noFill();
  rectMode(CENTER);
}


void draw() {

  translate(width/2, height/2);

  final int RECT_NUM = 250;
  final float INIT_RECTSIZE = 70.0;
  
  float rectSize = INIT_RECTSIZE;

  for ( int i = 0; i < RECT_NUM; i++ ) {
    rotate(random(-PI/6, PI/4));
    stroke(random(100, 200));
    rectSize += random(-2, 6);
    rect(0, 0, rectSize, rectSize);
  }
}


void keyPressed() {
  if ( key == 's' ) {
    saveFrame("002.png");
    System.exit(0);
  }
}
