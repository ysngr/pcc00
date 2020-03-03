/* 068_20190918 */

float[][][] p;


void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  background(255);
  initPoints();
  drawFigure();
}


void initPoints() {

  final float TILESIZE = 50.0;
  final int PNUM = (int)(1000/TILESIZE) + 1;

  p = new float[PNUM+2][PNUM+2][2];

  int i, j;
  float w, h;
  for ( h = -TILESIZE, i = 0; h <= height+TILESIZE; h += TILESIZE, i++ ) {
    for ( w = -TILESIZE, j = 0; w <= width+TILESIZE; w += TILESIZE, j++ ) {
      p[i][j][0] = w;
      if ( i % 2 == 0 ) {
        p[i][j][0] += random(-TILESIZE/2, TILESIZE/2);
      }
      p[i][j][1] = h;
      if ( j % 2 != 0 ) {
        p[i][j][1] += random(-TILESIZE/2, TILESIZE/2);
      }
    }
  }

  return ;
}


void drawFigure() {

  strokeWeight(0.8);
  stroke(255, 100);
  for ( int i = 0; i < p.length-1; i++ ) {
    for ( int j = 0; j < p[i].length-1; j++ ) {
      fill(random(200, 255), random(0, 80), random(40, 120), random(128, 255));  // red
      //fill(random(0, 60), random(180, 240), random(40, 120), random(128, 255));  // green
      beginShape();
      vertex(p[  i][  j][0], p[  i][  j][1]);
      vertex(p[  i][j+1][0], p[  i][j+1][1]);
      vertex(p[i+1][j+1][0], p[i+1][j+1][1]);
      vertex(p[i+1][  j][0], p[i+1][  j][1]);
      endShape(CLOSE);
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("068.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
