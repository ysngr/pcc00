/* 013_20190424 */

void setup() {
  size(1000, 1000);
  smooth();
  noLoop();
  blendMode(ADD);
}


void draw() {

  final int MAXTIMES = 15;
  final int MINSIZE = 50, MAXSIZE = 120;

  background(30);

  for ( int i = 0; i < MAXTIMES; i++ ) {
    drawNofillCircleSphere(random(width), random(height), (int)random(MINSIZE, MAXSIZE));
    drawFillCircleSphere(random(width), random(height), (int)random(MINSIZE, MAXSIZE));
    drawPointSphere(random(width), random(height), random(MINSIZE, MAXSIZE));
  }
}


void drawNofillCircleSphere(float x, float y, int diag) {

  float R = random(255); 
  float G = random(255);
  float B = random(255);

  noFill();
  strokeWeight(3);
  for ( int d = 0; d < diag; d++ ) {
    stroke(R, G, B, diag-d);
    circle(x, y, d);
  }
}


void drawFillCircleSphere(float x, float y, int diag) {

  noStroke();
  fill(random(255), random(255), random(255), 5);
  for ( int d = diag; d > 0; d-- ) {
    circle(x, y, d);
  }
}


void drawPointSphere(float x, float y, float rad) {

  strokeWeight(1.2);
  stroke(random(255), random(255), random(255), 30);

  float r, theta;
  for ( int i = 0; i < 80000; i++ ) {
    r = random(rad);
    theta = random(-PI, PI);
    point(x + r*cos(theta), y + r*sin(theta));
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("013.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
