/* 034_20190612 */

float[][] points;

void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  translate(width/2, height/2);
  initPoints();
  for ( float minRad = 0; minRad < 1000 * sqrt(2); minRad = updatePoints() ) {
    drawShape();
  }
}


void initPoints() {

  final float INIT_RAD = 3;

  points = new float[16][2];
  
  float theta = 0;
  for ( int i = 0; i < points.length; i++ ) {
    points[i][0] = INIT_RAD;
    points[i][1] = theta;
    theta += TWO_PI / points.length;
  }

  return ;
}


float updatePoints() {

  float minRad = 9999;  // dummy value

  for ( int i = 0; i < points.length; i++ ) {
    points[i][0] += random(1);
    if ( points[i][0] < minRad ) {
      minRad = points[i][0];
    }
  }

  return minRad;
}


void drawShape() {

  strokeWeight(random(0.5, 10));
  stroke(random(0, 50), random(128, 255), random(200, 255), 100);  // color = blue
  noFill();

  beginShape();
  for ( int i = 0; i < points.length; i++ ) {
    curveVertex(points[i][0] * cos(points[i][1]), points[i][0] * sin(points[i][1]));
  }
  curveVertex(points[0][0] * cos(points[0][1]), points[0][0] * sin(points[0][1]));
  curveVertex(points[1][0] * cos(points[1][1]), points[1][0] * sin(points[1][1]));
  curveVertex(points[2][0] * cos(points[2][1]), points[2][0] * sin(points[2][1]));
  endShape(CLOSE);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("034.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
