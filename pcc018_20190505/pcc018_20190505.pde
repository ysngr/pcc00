/* 018_20190505 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(SCREEN);
}


void draw() {
  background(30);
  for ( int i = 0; i < 10; i++ ) {
    drawLines();
  }
}


void drawLines() {

  float sx = random(width);
  float sy = random(height);

  float ex = random(width);
  float ey = random(height);

  float dx = random(-10, 10);
  float dy = random(-10, 10);

  int drawNum = (int)random(450);

  strokeWeight(1.0);
  stroke(random(255), random(255), random(255), random(255));

  for ( int i = 0; i < drawNum; i++ ) {
    line(sx, sy, ex, ey);
    sx += dx;
    sy += dy;
    ex -= dx;
    ey -= dy;
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("018.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
