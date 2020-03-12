/* 088_20200312 */

float[][][] ps;


void setup() {
  size(1000, 1000);
  noLoop();
  initPoints();
}


void initPoints() {

  float t;

  ps = new float[10][360][2];

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
  for ( int i = 0; i < 32; i++ ) {
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

  int breadth = (int)random(10, 20);
  int r = (int)random(ps.length-1);
  int c = (int)random(ps[0].length-breadth);

  strokeWeight(1.2);
  stroke(random(120, 200));
  fill(random(120, 200), random(150, 255));

  beginShape();
  for ( int i = 0; i < breadth; i++ ) {
    vertex(ps[r][c+i][0], ps[r][c+i][1]);
  }
  for ( int i = breadth-1; i >= 0; i-- ) {
    vertex(ps[r+1][c+i][0], ps[r+1][c+i][1]);
  }
  endShape(CLOSE);

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
