/* 082_20200222 */

float[][][] ps;


void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(ADD);
  strokeCap(SQUARE);
  strokeWeight(7.5);
}


void draw() {
  background(5);
  translate(width/2, height/2);
  initPoints();
  drawSpiral();
}


void initPoints() {

  final float RAD = 480.0;

  float r, t;

  ps = new float[32][80][2];

  t = 0;
  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = 0; j < ps[i].length; j++ ) {
      r = random(j*(RAD/ps[i].length), (j+1)*(RAD/ps[i].length));
      ps[i][j][0] = r * cos(t);
      ps[i][j][1] = r * sin(t);
      t += 19 * (TWO_PI / ps.length) / ps[i].length;
    }
  }

  return ;
}


void drawSpiral() {

  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = 0; j < ps[i].length-1; j++ ) {
      stroke(255*noise(j), 200*noise(j+j), 10*noise(j*j));
      line(ps[i][j][0], ps[i][j][1], ps[i][j+1][0], ps[i][j+1][1]);
    }
  }

  return;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("082.png"); 
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
