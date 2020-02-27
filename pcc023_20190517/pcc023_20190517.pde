/* 023_20190517 */

float[][] points;


void setup() {
  size(1000, 1000);
  blendMode(ADD);
  noLoop();
  strokeWeight(0.5);
  noFill();
}


void draw() {
  background(0);
  initPoints();
  drawNet();
}


void initPoints() {

  points = new float[140][2];
  for ( int i = 0; i < points.length; i++ ) {
    points[i][0] = random(width);
    points[i][1] = random(height);
  }

  return ;
}


void drawNet() {

  final int MAX_R = 240;

  for ( int i = 0; i < points.length; i++ ) {
    for ( int j = 0; j < points.length; j++ ) {
      if ( i == j ) {
        continue;
      }
      if ( dist(points[i][0], points[i][1], points[j][0], points[j][1]) <= MAX_R ) {
        int[] controlPointsIndexes = findControlPointsIndexes(i, j);
        stroke(random(180, 200), random(20, 60), random(200, 240), random(220, 255));
        bezier(
          points[i][0]                      , points[i][1]                      , 
          points[controlPointsIndexes[0]][0], points[controlPointsIndexes[0]][1], 
          points[controlPointsIndexes[1]][0], points[controlPointsIndexes[1]][1], 
          points[j][0]                      , points[j][1]
        );
      }
    }
  }

  return ;
}


int[] findControlPointsIndexes(int i, int j) {

  int[] controlPointsIndexes = {-1, -1};  // dummy value

  for ( int k = 0; k < controlPointsIndexes.length; k++ ) {
    float minDist = 10000;  // dummy value
    int idx = (k == 0)? i : j;
    for ( int p = 0; p < points.length; p++ ) {
      if ( p == i || p == j ) {
        continue;
      }
      float tempDist = dist(points[idx][0], points[idx][1], points[p][0], points[p][1]);
      if ( tempDist < minDist && p != controlPointsIndexes[0] && tempDist >= 60 ) {
        minDist = tempDist;
        controlPointsIndexes[k] = p;
      }
    }
  }

  return controlPointsIndexes;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("023.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
