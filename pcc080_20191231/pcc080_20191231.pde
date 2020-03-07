/* 080_20191231 */

float x, y;


void setup() {
  size(1000, 1000);
  noLoop();
  background(0);
  strokeWeight(1.0);
  stroke(220, 35, 75);  // red
  //stroke(75, 78, 220);  // blue
  noFill();
  blendMode(ADD);
}


void draw() {
  translate(width/2, height/2);

  init();
  for ( int i = 0; i < 300000; i++ ) {
    calc();
    plot();
  }
}


void init() {

  x = 0.5;
  y = 0.5;

  return ;
}


void calc() {

  final float a = 0.9, b = 0.22, c = -1.77, d = 0.76;

  float A = a * (sq(x) + sq(y)) + b * (sq(x) - 3*sq(y)) + c;
  float px = x;
  float py = y;

  x = A * px + d * (sq(px) - sq(py));
  y = A * py - 2 * d * px * py; 

  return ;
}


void plot() {

  point(370*x, 340*y);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("080.png");
    System.exit(0);
  }
}
