/* 006_20190419 */

final float TILENUM = 25.0;
final float TILESIZE = 1000 / TILENUM;
final float MAX_RAND = 10.5;


void setup() {
  size(1000, 1000);
  background(50);
  noLoop();
  strokeWeight(1.0);
}


void draw() {
  for ( int r = 0; r < TILENUM; r++ ) {
    for ( int c = 0; c < TILENUM; c++ ) {
      drawNoisySquare(r, c);
    }
  }
}


void drawNoisySquare(int r, int c) {
  stroke(random(140, 180), random(240, 255), random(240, 255), random(200, 240));  // color = light blue
  fill(random(0, 40), random(120, 160), random(220, 255), random(220, 240));  // color = blue
  beginShape();
  vertex(c*TILESIZE + rand(), r*TILESIZE + rand());  // upper left
  vertex((c+1)*TILESIZE + rand(), r*TILESIZE + rand());  // upper right
  vertex((c+1)*TILESIZE + rand(), (r+1)*TILESIZE + rand());  // lower left
  vertex(c*TILESIZE + rand(), (r+1)*TILESIZE + rand());  // lower right
  endShape(CLOSE);
}


float rand() {
  return random(-MAX_RAND, MAX_RAND);
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("006.png");
    System.exit(0);
  }
}
