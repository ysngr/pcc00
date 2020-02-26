/* 051_20190721 */

float[][] ps;

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(SCREEN);
}


void draw() {
  background(0);
  initPoints();
  for ( int i = 0; i < 200; i++ ) {
    drawCircLines();
    updatePoints();
  }
}


void initPoints() {

  ps = new float[40][6];
  for (int i = 0; i < ps.length; i++) {
    ps[i][0] = random(width);
    ps[i][1] = random(height);
    ps[i][2] = random(30, 80);
    ps[i][3] = random(255);
    ps[i][4] = random(255);
    ps[i][5] = random(255);
  }

  return ;
}


void drawCircLines() {

  for ( int i = 0; i < ps.length; i++ ) {
    noStroke();
    fill(ps[i][3], ps[i][4], ps[i][5], 10);
    ellipse(ps[i][0], ps[i][1], ps[i][2], ps[i][2]);
    for ( int j = 0; j < ps.length; j++ ) {
      if ( i == j || random(i) >= i/5 ) {
        continue;
      }
      stroke(ps[i][3], ps[i][4], ps[i][5], 5);
      noFill();
      line(ps[i][0], ps[i][1], ps[j][0], ps[j][1]);
    }
  }

  return ;
}


void updatePoints() {

  final float DX = 1.5, DY = 1.5, DR = 1.5, DC = 3.0;

  for ( int i = 0; i < ps.length; i++ ) {
    ps[i][0] += sgn(ps[i][0]) * DX * noise(ps[i][0]);
    ps[i][1] += sgn(ps[i][1]) * DY * noise(ps[i][1]);
    ps[i][2] += sgn(ps[i][2]) * DR * noise(ps[i][2]);
    ps[i][3] += sgn(ps[i][3]) * DC * noise(ps[i][3]);
    ps[i][4] += sgn(ps[i][4]) * DC * noise(ps[i][4]);
    ps[i][5] += sgn(ps[i][5]) * DC * noise(ps[i][5]);
  }

  return ;
}


float sgn(float seed) {
  return (random(seed) >= seed/2)? 1.0 : -1.0;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("051.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
