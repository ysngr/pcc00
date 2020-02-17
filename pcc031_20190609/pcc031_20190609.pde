/* 031_20190609 */

final int AMP = 50;

float[][] wps;


void setup() {
  size(1000, 1000);
  noLoop();
  strokeWeight(1.0);
  stroke(255, 255, 255, 100);  // color = white
  noFill();
}


void draw() {
  background(60);

  for ( float h = random(AMP); h <= height; h += 1.2*AMP ) {
    initWavePoints();
    for ( int i = 0; i < 20; i++ ) {
      drawFigure(h);
      updatewps();
    }
  }
}


void initWavePoints() {

  wps = new float[100][2];

  float theta = random(PI);
  for ( int i = 0; i < wps.length; i++ ) {
    wps[i][0] = i * (width / wps.length);
    wps[i][1] = AMP * sin(theta);
    theta += PI / 8;
  }

  return ;
}


void drawFigure(float h) {

  for ( int i = 1; i < wps.length; i++ ) {
    line(wps[i-1][0], wps[i-1][1]+h, wps[i][0], wps[i][1]+h);
  }

  return ;
}


void updatewps() {

  final float RANDMIN = -3.0, RANDMAX = 4.0;
  for ( int i = 0; i < wps.length; i++ ) {
    wps[i][0] += random(RANDMIN, RANDMAX);
    wps[i][1] += random(RANDMIN, RANDMAX);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("031.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
