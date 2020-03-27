/* 099_20200328 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(ADD);
}


void draw() {
  background(20);
  spread(0, 0, width, height);
}


void spread(float x, float y, float xlen, float ylen) {

  if ( random(10) < 2.5 ) {
    engrave(x, y, xlen, ylen);
    return ;
  }

  if ( xlen < 0.01*width || ylen < 0.01*height ) {
    engrave(x, y, xlen, ylen);
    return ;
  }

  spread(x       , y       , xlen/2, ylen/2);
  spread(x       , y+ylen/2, xlen/2, ylen/2);
  spread(x+xlen/2, y       , xlen/2, ylen/2);
  spread(x+xlen/2, y+ylen/2, xlen/2, ylen/2);

  return ;
}


void engrave(float x, float y, float xlen, float ylen) {

  float diag = hypotenuse(width, height);
  int linenum = (int)map(hypotenuse(xlen, ylen), 0.01*diag, diag, 30, 3000);

  strokeWeight(map(hypotenuse(xlen, ylen), 0.01*diag, diag, 0.35, 1.2));
  stroke(random(255), random(255), random(255));

  for ( int i = 0; i < linenum; i++ ) {
    line(x+random(xlen), y+random(ylen), x+random(xlen), y+random(ylen));
  }

  return ;
}


float hypotenuse(float b, float h) {
  return sqrt(sq(b) + sq(h));
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("099.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
