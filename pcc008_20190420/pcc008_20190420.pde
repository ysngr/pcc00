/* 008_20190420 */

final int LINENUM = 5000;
final float MAX_RAND = 15.0;

float[] ps, pe;


void setup() {
  size(1000, 1000);
  background(0);
  noLoop();
  strokeWeight(1.0);
  stroke(255, 255, 255, 25);
  blendMode(SCREEN);
  initPoints();
}

void initPoints() {
  ps = new float[2];
  ps[0] = 0;
  ps[1] = 0;
  
  pe = new float[2];
  pe[0] = width;
  pe[1] = height;
}


void draw() {
  for ( int i = 0; i < LINENUM; i++ ) {
    line(ps[0], ps[1], pe[0], pe[1]);
    updatePoints();
  }
}

void updatePoints() {
  ps[0] += random(-MAX_RAND, MAX_RAND);
  ps[1] += random(-MAX_RAND, MAX_RAND);
  pe[0] += random(-MAX_RAND, MAX_RAND);
  pe[1] += random(-MAX_RAND, MAX_RAND);
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("008.png");
    System.exit(0);
  }
}
