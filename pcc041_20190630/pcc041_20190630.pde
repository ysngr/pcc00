/* 041_20190630 */

float[][] ps;


void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(ADD);
  strokeCap(PROJECT);
  noFill();
}


void draw() {
  background(20);
  initPoints();
  drawArcs();
}


void initPoints() {

  ps = new float[40][3];

  for ( int i = 0; i < ps.length; i++ ) {
    ps[i][0] = random(width);
    ps[i][1] = random(height);
    ps[i][2] = random(120, 300);
  }

  return ;
}


void drawArcs() {

  float r;

  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = 0; j < 25; j++ ) {
      r = random(ps[i][2]);
      strokeWeight(random(0.5, 4.0));
      stroke(random(255), random(255), random(255));
      arc(ps[i][0], ps[i][1], r, r, random(-PI, 0), random(0, PI));
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("041.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
