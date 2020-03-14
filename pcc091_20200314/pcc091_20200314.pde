/* 091_20200314 */

void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  background(240);

  for ( int i = 0; i < 80; i++ ) {
    drawRing();
  }
}


void drawRing() {

  final int DIVNUM = 512;

  float x, y, r, t, sw, sgn;

  stroke(random(50, 180), random(60, 180), random(140, 180), 180);

  x = random(width);
  y = random(height);
  r = random(20.0, 80.0);
  t = random(-PI, PI);
  sw = random(0.50);
  sgn = sign();

  for ( int i = 0; i < DIVNUM; i++ ) {
    strokeWeight(sw);
    point(x + r*cos(t), y + r*sin(t));
    sw *= 1.007;
    t += sgn * TWO_PI / DIVNUM;
  }

  return ;
}


float sign() {
  return ( random(2) < 1 )? 1.0 : -1.0;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("091.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
