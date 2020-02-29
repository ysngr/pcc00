/* 063_20190911 */

void setup() {
  size(1080, 800);
  noLoop();
  blendMode(SCREEN);
}


void draw() {
  background(0);

  for ( int i = 0; i < 20; i++ ) {
    drawFlower(random(width), random(height));
  }
}


void drawFlower(float x, float y) {

  final float MAXRAND = 45.0;

  noStroke();
  fill(random(255), random(255), random(255), 6.5);

  pushMatrix();
  translate(x, y);
  for ( int i = 0; i < 500; i++ ) {
    rotate(random(-PI, PI));
    rect(random(-MAXRAND, MAXRAND), random(-MAXRAND, MAXRAND), random(25, 45), random(120, 180));
  }
  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("063.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
