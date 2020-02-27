/* 057_20190819 */

float[][][] ps;

void setup() {
  size(1000, 1000);
  noLoop();
  initPoints();
}


void initPoints() {

  final int P_NUM = 30;

  ps = new float[P_NUM+1][P_NUM+1][2];

  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = 0; j < ps[i].length; j++ ) {
      ps[i][j][0] = (float)height / P_NUM * i;
      ps[i][j][1] = (float)width / P_NUM * j;
    }
  }

  return ;
}



void draw() {
  background(0);

  updatePoints();
  for ( int i = 0; i < 3; i++ ) {
    genWave();
  }
  drawLines();
}


void updatePoints() {

  final float MAX_RAND = 5.0;

  for (int i = 0; i < ps.length; i++) {
    for (int j = 0; j < ps[i].length; j++) {
      ps[i][j][0] += random(-MAX_RAND, MAX_RAND);
      ps[i][j][1] += random(-MAX_RAND, MAX_RAND);
    }
  }

  return ;
}


void genWave() {

  final float RAD = 400;
  final float MAX_WGT = width / 2 - RAD;

  float wgt;
  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = 0; j < ps[i].length; j++ ) {
      wgt = abs(dist(ps[i][j][0], ps[i][j][1], width/2, height/2) - RAD);
      ps[i][j][0] += random(wgt/MAX_WGT/24, wgt/MAX_WGT/12) * (ps[i][j][0] - width/2);
      ps[i][j][1] += random(wgt/MAX_WGT/24, wgt/MAX_WGT/12) * (ps[i][j][1] - height/2);
    }
  }

  return ;
}


void drawLines() {

  strokeWeight(2);
  stroke(255, 255);

  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = 0; j < ps[i].length; j++ ) {
      if ( i != ps.length - 1 ) {
        line(ps[i][j][0], ps[i][j][1], ps[i+1][j][0], ps[i+1][j][1]);  // vertical line
      }
      if ( j != ps[i].length - 1 ) {
        line(ps[i][j][0], ps[i][j][1], ps[i][j+1][0], ps[i][j+1][1]);  // horizontal line
      }
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("057.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
