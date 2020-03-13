/* 088_20200312 */

float[][][] ps;


void setup() {
  size(1000, 1000);
  noLoop();
  initPoints();
}


void initPoints() {

  float t;

  ps = new float[8][360][2];

  for ( int i = 0; i < ps.length; i++ ) {
    t = random(PI);
    for ( int j = 0; j < ps[i].length; j++ ) {
      ps[i][j][0] = (j + 0.5) * ((float)width / ps[i].length);
      ps[i][j][1] = (i + 0.5) * ((float)height / ps.length) + 40 * cos(t);
      t += PI / 64;
    }
  }

  return ;
}


void draw() {
  background(220);

  genWave();
  for ( int i = 0; i < 25; i++ ) {
    paint();
  }
}


void genWave() {

  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = 0; j < ps[i].length; j++ ) {
      strokeWeight(random(2.0, 5.0));
      stroke(random(80, 200));
      point(ps[i][j][0], ps[i][j][1]);
    }
  }

  return ;
}


void paint() {

  int breadth = (int)random(15, 30);
  int r = (int)random(ps.length-1);
  int c = (int)random(ps[0].length-breadth);

  for ( int i = 0; i < breadth; i++ ) {
    scratchVertLine(ps[r][c+i][0], ps[r][c+i][1], (ps[r+1][c+i][1]-ps[r][c+i][1]));
  }

  return ;
}


void scratchVertLine(float x, float y, float len) {

  for ( int l = 0; l < len; l++ ) {
    strokeWeight(random(1.0, 2.8));
    stroke(random(120, 200), random(100, 200));
    point(x, y+l);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("088.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
