/* 046_20190709 */

final int VERT_P_NUM = 20, HORZ_P_NUM = 20;

float[][][] ps;


void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(SCREEN);
  initPoints();
}


void initPoints() {

  ps = new float[VERT_P_NUM+1][HORZ_P_NUM+1][2];

  for ( int h = 0; h <= VERT_P_NUM; h++ ) {
    for ( int w = 0; w <= HORZ_P_NUM; w++ ) {
      ps[h][w][0] = w * (width / HORZ_P_NUM);
      ps[h][w][1] = h * (height / VERT_P_NUM);
    }
  }

  return ;
}


void draw() {
  background(30);
  for ( int i = 0; i < 1200; i++ ) {
    drawLine();
  }
}


void drawLine() {

  int w1, w2;
  int h = (int)random(VERT_P_NUM);

  do {
    w1 = (int)random(HORZ_P_NUM+1);
    w2 = (int)random(HORZ_P_NUM+1);
  } while ( abs(w1-w2) > HORZ_P_NUM/10 );

  strokeWeight(random(1.0, 2.5));
  stroke(random(60, 240), random(150, 240), random(30, 120), 200);
  line(ps[h][w1][0], ps[h][w1][1], ps[h+1][w2][0], ps[h+1][w2][1]);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("046.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
