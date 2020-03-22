/* 095_20200322 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(LIGHTEST);
}


void draw() {
  background(30);

  final int XNUM = 15, YNUM = 15;

  for ( int i = 0; i < YNUM; i++ ) {
    for ( int j = 0; j < XNUM; j++ ) {
      strokeWeight(4.0);
      stroke(random(255), random(255), random(255));
      if ( random(10) < 6.5 ) {
        chippedTile(j*width/XNUM, i*height/YNUM, width/XNUM, height/YNUM);
      }
    }
  }
}



void chippedTile(float x, float y, float xlen, float ylen) {

  chippedLine(x, y, x+xlen, y);
  chippedLine(x+xlen, y+ylen, x, y+ylen);
  chippedLine(x, y, x, y+ylen);
  chippedLine(x+xlen, y+ylen, x+xlen, y);

  return ;
}


void chippedLine(float sx, float sy, float ex, float ey) {

  final int POINTNUM = 6;

  float dx, dy, x, y, chip;

  dx = (ex - sx) / POINTNUM;
  dy = (ey - sy) / POINTNUM;
  x = sx;
  y = sy;

  for ( int i = 0; i < POINTNUM; i++ ) {
    if ( random(10) < 6 ) {
      line(x, y, x+dx, y+dy);
    } else {
      chip = random(0.8*(dx+dy));
      if ( dx == 0 ) {  // vertical line
        line(x, y, x+dx/2+chip, y+dy/2);
        line(x+dx/2+chip, y+dy/2, x+dx, y+dy);
      } else {  // horizontal line
        line(x, y, x+dx/2, y+dy/2+chip);
        line(x+dx/2, y+dy/2+chip, x+dx, y+dy);
      }
    }
    x += dx;
    y += dy;
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("095.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
