/* 010_20190421 */

final int x = 0, y = 1;
final int DIVNUM = 32;
final float INIT_D_RAD = 220;
final int FIGNUM = 10000;
final float RAND_CENTER = 2.5;
final float RAND_D = 2.2;


float[] center;
float[][] d;


void setup() {
  size(1000, 1000);
  noLoop();
  strokeWeight(0.5);
  noFill();
}



void draw() {
  background(230);
  init();
  for ( int i = 0; i < FIGNUM; i++ ) {
    drawFigure();
    updateFigure();
  }
}


void init() {
  center = new float[2];
  center[x] = width / 2;
  center[y] = height / 2;

  d = new float[DIVNUM][2];
  for ( int i = 0; i < d.length; i++ ) {
    d[i][x] = INIT_D_RAD * cos(i * TWO_PI/DIVNUM);
    d[i][y] = INIT_D_RAD * sin(i * TWO_PI/DIVNUM);
  }
}


void drawFigure() {
  stroke(50, random(3, 25));  // color = black
  beginShape();
  for ( int i = 0; i < d.length; i++ ) {
    curveVertex(center[x] + d[i][x], center[y] + d[i][y]);
  }
  endShape(CLOSE);
}


void updateFigure() {

  center[x] += random(-RAND_CENTER, RAND_CENTER);
  center[y] += random(-RAND_CENTER, RAND_CENTER);

  for (int i = 0; i < d.length; i++) {
    d[i][x] += random(-RAND_D, RAND_D);
    d[i][y] += random(-RAND_D, RAND_D);
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("010.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
