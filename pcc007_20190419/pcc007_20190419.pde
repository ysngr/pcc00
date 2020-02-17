/* 007_20190419 */

void setup() {
  size(1000, 1000);
  background(235);
  noLoop();
  rectMode(CENTER);
  strokeWeight(1.5);
}


void draw() {

  final int SQRNUM = 20;
  final float SQRSIZE = 1000 / SQRNUM;

  float sqrSize = SQRSIZE - 3;
  int alpha = 150;

  for ( int c = 0; c < SQRNUM; c++ ) {  
    for ( int r = 0; r < SQRNUM; r++ ) {
      pushMatrix();
      translate((c + 0.5)*SQRSIZE, (r + 0.5)*SQRSIZE);
      rotate(random(-PI/12, PI/12));
      stroke(random(255), random(255), random(255));
      fill(random(255), random(255), random(255), alpha);
      square(0, 0, sqrSize);
      popMatrix();
    }
    sqrSize -= 2;
    alpha += 5;
  }
}


void keyPressed() {
  if ( key == 's') {
    saveFrame("007.png");
    System.exit(0);
  }
}
