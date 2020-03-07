/* 078_20191126 */

final int R = 0, G = 1, B = 2;

float[][] ps;
float[] col;


void setup() {
  size(1000, 1000);
  noLoop();
  strokeWeight(0.5);
  noFill();
  blendMode(SCREEN);
}


void draw() {
  background(30);
  translate(width/2, height/2);

  initPoints();
  initColor((int)random(255), (int)random(255), (int)random(255));
  for ( int i = 0; i < 500; i++ ) {
    drawFigure();
    updatePoints(i);
    updateColor(i);
  }
}


void initPoints() {

  final float MAXRAND = 20.0;
  final float DR = 20.0;

  ps = new float[50][2];
  col = new float[3];

  float r = 0;
  for ( int i = 0; i < ps.length/2; i++ ) {
    ps[i][0] = r * cos(PI/4) + random(-MAXRAND, MAXRAND);
    ps[i][1] = r * sin(PI/4) + random(-MAXRAND, MAXRAND);
    r += DR;
  }
  for ( int i = ps.length/2; i < ps.length; i++ ) {
    ps[i][0] = abs(r) * cos(PI*5/4) + random(-MAXRAND, MAXRAND);
    ps[i][1] = abs(r) * sin(PI*5/4) + random(-MAXRAND, MAXRAND);
    r -= DR;
  }

  return ;
}


void initColor(int r, int g, int b) {

  col[R] = r;
  col[G] = g;
  col[B] = b;

  return ;
}


void drawFigure() {

  stroke(col[R], col[G], col[B], 25);
  for ( int i = 0; i < ps.length-4; i++ ) {
    bezier(ps[i][0], ps[i][1], ps[i+1][0], ps[i+1][1], ps[i+2][0], ps[i+2][1], ps[i+3][0], ps[i+3][1]);
  }

  return ;
}


void updatePoints(int seed) {

  final float MAXNOISE = 6.5;

  for ( int i = 0; i < ps.length; i++ ) {
    ps[i][0] += randsgn(seed) * MAXNOISE * noise(seed);
    ps[i][1] += randsgn(seed) * MAXNOISE * noise(seed);
  }

  return ;
}


void updateColor(int seed) {

  final float MAXNOISE = 4.0;

  col[R] += randsgn(seed) * MAXNOISE * noise(seed);
  col[G] += randsgn(seed) * MAXNOISE * noise(seed);
  col[B] += randsgn(seed) * MAXNOISE * noise(seed);

  return ;
}


float randsgn(float seed) {
  return ( random(seed) > seed/2 )? 1.0 : -1.0;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("078.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
