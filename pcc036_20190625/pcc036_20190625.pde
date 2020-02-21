/* 036_20190625 */

final color BGCOL = color(0, 0, 0);


void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(ADD);
  strokeWeight(1.5);
  stroke(250, 40, 170);  // color = magenta
}


void draw() {
  background(BGCOL);
  for ( int i = 0; i < 10; i++ ) {
    drawLine();
  }
}


void drawLine() {

  final float STEP = 3.0;

  int x = (int)random(width);
  int y = (int)random(height);
  float theta = random(-PI, PI);
  int dx = (int)(STEP * cos(theta));
  int dy = (int)(STEP * sin(theta));

  for ( int i = 0; i < 5000; i++ ) {
    if ( get(x+dx, y+dy) != color(BGCOL) ) {
      // turn
      theta = random(-PI, PI);
      dx = (int)(STEP * cos(theta));
      dy = (int)(STEP * sin(theta));
    }
    
    // draw
    line(x, y, x + dx, y + dy);
    
    // update
    x += dx;
    y += dy;
    if ( x < 0 || x > width ) {
      dx = -dx;
    }
    if ( x < 0 || x > height ) {
      dy = -dy;
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("036.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
