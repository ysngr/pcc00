/* 014_20190429 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(ADD);
}


void draw() {

  Star[] stars;

  background(20);

  stars = new Star[150];
  for ( int i = 0; i < stars.length; i++ ) {
    stars[i] = new Star();
    stars[i].drawStar();
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("014.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
