/* 074_20191025 */

void setup() {
  size(1000, 1000);
  noLoop();
  noFill();
  strokeWeight(1.0);
}


void draw() {
  background(230, 245, 245);

  for ( int i = 0; i < 8; i++ ) {
    pushMatrix();
    translate(random(width), random(height));
    stroke(random(150, 255), random(100, 200), random(0, 120), 200);
    for ( int j = 0; j < 120; j++ ) {
      drawRandRing();
    }
    popMatrix();
  }
}


void drawRandRing() {

  final float MAX_NOISE = 25.0;

  float r, t, st;

  r = random(145, 200);
  st = random(-PI, PI);
  t = st;
  while ( t < st + TWO_PI ) {
    point(r * cos(t) + MAX_NOISE * noise(r+t), r * sin(t) + MAX_NOISE * noise(r*t));
    t += TWO_PI / 128;
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("074.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
