/* 025_20190529 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(SCREEN);
}


void draw() {
  background(0);
  translate(width/2, height/2);
  for ( int i = 0; i < 6; i++ ) {
    drawRotRect(random(0, width/2), random(0, height/2), (int)random(100, 200));
  }
}


void drawRotRect(float centerX, float centerY, int num) {

  for ( int i = 0; i < num; i++ ) {
    float scl = random(0, 1.2);
    scale(scl);
    rotate(random(-PI, PI));
    strokeWeight(random(0.5, 1.2));
    stroke(255, 255, 255, 128);
    fill(random(0, 128), random(0, 128), random(0, 255), 50);
    rect(centerX, centerY, random(20, 400), random(20, 400));
    scale(1/scl);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("025.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
