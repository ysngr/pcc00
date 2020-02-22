/* 037_20190626 */

final color BGCOL = color(0, 0, 0);

PVector p;
PVector[] v;


void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(ADD);
  strokeWeight(2.0);
  stroke(65, 255, 70);  // color = green
}


void draw() {
  background(BGCOL);
  initVector();
  for ( int i = 0; i < 200; i++ ) {
    drawLine(initPoint(i));
  }
}


void initVector() {

  final float ABS_V = 1.1;

  v = new PVector[8];

  float theta = 0;
  for ( int i = 0; i < v.length; i++ ) {
    v[i] = new PVector();
    v[i].set(ABS_V * cos(theta), ABS_V * sin(theta));
    theta += TWO_PI / v.length;
  }

  return ;
}


int initPoint(int seed) {

  // initalize point
  p = new PVector();
  p.set(random(width), random(height));

  // select vector
  int vectorIndex = (int)(noise(seed) * v.length);

  return vectorIndex;
}


void drawLine(int idx) {

  for ( int i = 0; i < 800; i++ ) {
    if ( get((int)(p.x + v[idx].x), (int)(p.y + v[idx].y)) != BGCOL ) {
      // turn
      idx = (idx + (int)random(v.length)) % v.length;
    }
    // plot
    point(p.x, p.y);
    // update
    p.x += v[idx].x;
    p.y += v[idx].y;
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("037.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
