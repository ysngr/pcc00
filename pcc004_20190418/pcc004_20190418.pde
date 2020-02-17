/* 004_20190418 */

void setup() {
  size(1000, 1000);
  background(255);
  noLoop();
  rectMode(CENTER);
  noStroke();
}


void draw() {

  final int RECTNUM = 5000;
  final float MIN_RECT_WIDTH = 10.0, MAX_RECT_WIDTH = 50.0;
  final float MIN_RECT_HEIGHT = 10.0, MAX_RECT_HEIGHT = 100.0;

  for ( int i = 0; i < RECTNUM; i++ ) {
    fill(random(255), random(255), random(255), random(30, 200));
    rect(random(width), random(height), random(MIN_RECT_WIDTH, MAX_RECT_WIDTH), random(MIN_RECT_HEIGHT, MAX_RECT_HEIGHT));
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("004.png");
    System.exit(0);
  }
}
