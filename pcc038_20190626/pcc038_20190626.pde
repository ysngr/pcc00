/* 038_20190626 */

final float MAX_SCALE = 1.25;

float[][] paraboraPoints;


void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(SCREEN);
  strokeWeight(1.2);
  //stroke(255, 70, 60, 255);  // color = red
  stroke(255, 240, 100, 200);  // color = yellow
}


void draw() {
  background(0);
  translate(width/2, height/2);
  
  initParaboraPoints();
  for ( int i = 0; i < 2000; i++ ) {
    plotParabora(i);
  }
}


void initParaboraPoints() {

  paraboraPoints = new float[350][2];

  int i = 0;
  float x = - width / 2;
  while ( x < width / 2 && i < paraboraPoints.length ) {
    paraboraPoints[i][0] = x;
    paraboraPoints[i++][1] = 0.005 * sq(x);
    x += random(1.0, 4.0);
  }
  return ;
}


void plotParabora(int idx) {

  rotate(TWO_PI/paraboraPoints.length);
  pushMatrix();
  scale(noise(idx) * MAX_SCALE);
  for ( int i = 0; i < paraboraPoints.length; i++ ) {
    point(paraboraPoints[i][0], paraboraPoints[i][1]);
  }
  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("038.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
