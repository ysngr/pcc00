/* 003_20190417 */

int[][] points;


void setup() {
  size(1000, 1000);
  background(0);
  noLoop();
  strokeWeight(0.25);
  noFill();
  initPoints();
}

void initPoints() {

  points = new int[100][2];
  for ( int i = 0; i < points.length; i++ ) {
    points[i][0] = (int)random(width);
    points[i][1] = (int)random(height);
  }
}


void draw() {

  final int MAX_TIMES = 10000;
  final float DIAM = 0.5;

  for ( int i = 0; i < MAX_TIMES; i++ ) {
    for ( int j = 0; j < points.length; j++ ) {
      updatePoint(j);
      stroke(random(240, 255), random(160, 200), random(10, 30), random(230, 255));  // color = orange
      circle(points[j][0], points[j][1], DIAM);
    }
  }
}

void updatePoint(int idx) {
  points[idx][0] += ( random(0, 2) >= 1 )? 2 : -2;
  points[idx][1] += ( random(0, 2) >= 1 )? 2 : -2;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("003.png");
    System.exit(0);
  }
}
