/* 048_20190713 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(SUBTRACT);
}


void draw() {
  background(240);

  float[] p = initPoint();
  for (int i = 0; i < 10000; i++) {
    drawTriangle(p);
  }
}


float[] initPoint() {

  float[] p = new float[2];
  p[0] = random(width);
  p[1] = random(height);

  return p;
}


void drawTriangle(float[] p) {

  final int UPPER_LEFT = 0, UPPER_RIGHT = 1, LOWER_LEFT = 2, LOWER_RIGHT = 3;

  stroke(random(0, 50), random(200, 255), random(200, 255));
  fill(random(60, 200), random(200, 255), random(30, 60), 40);

  float vertlen = random(10, 25);
  switch( (int)random(4) ) {
    case UPPER_LEFT : 
      triangle(p[0], p[1], p[0]-vertlen, p[1], p[0], p[1]-vertlen); 
      if ( random(2) >= 1 )  p[0] -= vertlen;
      else  p[1] -= vertlen;
      break;
    case UPPER_RIGHT :
      triangle(p[0], p[1], p[0]+vertlen, p[1], p[0], p[1]-vertlen);
      if ( random(2) >= 1 )  p[0] += vertlen;
      else  p[1] -= vertlen;
      break;
    case LOWER_LEFT :
      triangle(p[0], p[1], p[0]-vertlen, p[1], p[0], p[1]+vertlen);
      if ( random(2) >= 1 )  p[0] -= vertlen;
      else  p[1] += vertlen;
      break;
    case LOWER_RIGHT :
      triangle(p[0], p[1], p[0]+vertlen, p[1], p[0], p[1]+vertlen);
      if ( random(2) >= 1 )  p[0] += vertlen;
      else  p[1] += vertlen;
      break;
  }

  if ( p[0] < 0 )  p[0] = 0;
  else if ( p[0] > width )  p[1] = width;
  if ( p[1] < 0 )  p[0] = 0;
  else if ( p[1] > height )  p[1] = height;

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("048.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
