/* 016_20190430 */

float[][] points;

void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  background(50);
  initPoints();
  drawLeaves();
}



void initPoints() {

  final float GUTTER = 50.0;

  points = new float[180][2];
  for ( int i = 0; i < points.length; i++ ) {
    points[i][0] = random(-GUTTER, width+GUTTER);
    points[i][1] = random(-GUTTER, height+GUTTER);
  }

  return ;
}


void drawLeaves() {

  for ( int i = 0; i < points.length; i++ ) {
    for ( int j = 0; j < points.length; j++ ) {
      if ( dist(points[i][0], points[i][1], points[j][0], points[j][1]) < random(100, 250) ) {
        stroke(random(255), random(255), random(255), 180);
        fill(random(255), random(255), random(255), random(120, 150));
        bezier(
          points[i][0]                                       , points[i][1], 
          (points[i][0] + points[j][0]) / 2 + random(-40, 40), (points[i][1] + points[j][1]) / 2 + random(-40, 40), 
          (points[i][0] + points[j][0]) / 2 + random(-60, 60), (points[i][1] + points[j][1]) / 2 + random(-60, 60), 
          points[j][0]                                       , points[j][1]                                        
        );
      }
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("016.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
