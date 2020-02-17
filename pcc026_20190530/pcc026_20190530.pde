/* 026_20190530 */

void setup() {
  size(1000, 1000);
  frameRate(3);
  blendMode(ADD);
  rectMode(CENTER);
  noStroke();
}


void draw() {

  background(0);
  translate(width/2, height/2);

  final int DIVNUM = 32;

  for ( int scl = 0; scl < width/2 * sqrt(2); scl += 20 ) {
    for ( float theta = 0; theta < TWO_PI; theta += TWO_PI / DIVNUM ) {
      rotate(TWO_PI/DIVNUM);
      fill(random(128, 255), random(0, 128), random(0, 128), 120);
      rect(scl, 0, random(scl/12, scl/8), random(scl/4, scl/2));
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("026.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
