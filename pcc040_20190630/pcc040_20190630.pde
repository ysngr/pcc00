/* 040_20190630 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(SCREEN);
  strokeCap(PROJECT);
  noFill();
}


void draw() {
  background(20);
  for ( int i = 0; i < 25; i++ ) {
    drawLines();
  }
}


void drawLines() {

  final int MAX_LINE_LEN = 30;

  int x = (int)random(width);
  int y = (int)random(height);

  beginShape();
  for ( int i = 0; i < 450; i++ ) {

    strokeWeight(random(1.0, 2.0));
    stroke(random(255), random(255), random(255));

    if ( i % 2 == 0 ) {
      int nextX = (int)(x + random(-MAX_LINE_LEN, MAX_LINE_LEN));
      if ( nextX < 0 ) {
        nextX += (int)random(MAX_LINE_LEN, MAX_LINE_LEN*2);
      } else if ( nextX > width ) {
        nextX += (int)random(-MAX_LINE_LEN*2, -MAX_LINE_LEN);
      }
      //vertex(x, y);
      curveVertex(x, y);
      x = nextX;
    } else {
      int nextY = (int)(y + random(-MAX_LINE_LEN, MAX_LINE_LEN));
      if ( nextY < 0 ) {
        nextY += (int)random(MAX_LINE_LEN, MAX_LINE_LEN*2);
      } else if ( nextY > height ) {
        nextY += (int)random(-MAX_LINE_LEN*2, -MAX_LINE_LEN);
      }
      //vertex(x, y);
      curveVertex(x, y);
      y = nextY;
    }
  }
  endShape();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("040.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
