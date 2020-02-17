/* 021_20190515 */

float[][] points;

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(SCREEN);
}


void draw() {
  background(0);

  for ( int i = 0; i < 5; i++ ) {
    initPoints();
    pushMatrix();
    translate(random(width), random(height));
    drawEdges();
    popMatrix();
  }
}


void initPoints() {

  final float MINRAD = 50.0, MAXRAD = 420.0;

  points = new float[128][2];
  for ( int i = 0; i < points.length; i++ ) {
    float theta = random(-PI, PI);
    points[i][0] = random(MINRAD, MAXRAD) * cos(theta); 
    points[i][1] = random(MINRAD, MAXRAD) * sin(theta);
  }

  return ;
}


void drawEdges() {

  color col = color(random(255), random(255), random(255));
  
  for ( int i = 0; i < points.length; i++ ) {
    for ( int j = i; j < points.length; j++ ) {
      if ( random(0, 100) >= 75 ) {
        stroke(col , random(60, 120));
        line(points[i][0], points[i][1], points[j][0], points[j][1]);
      }
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("021.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
