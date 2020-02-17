/* 009_20190420 */

final int MIN_RAD = 30;
final int MAX_RAD = 150;

float[][] circles;


void setup() {
  size(1000, 1000);
  noLoop();
  strokeWeight(1.0);
  circles = new float[15][3];
}


void draw() {
  background(40);
  initCircles();
  drawCircles();
  drawLines();
}


void initCircles() {
  for ( int i = 0; i < circles.length; i++ ) {
    circles[i][0] = random(50, width-50);
    circles[i][1] = random(50, height-50);
    circles[i][2] = random(MIN_RAD, MAX_RAD);
  }
}


void drawCircles() {
  stroke(255, 220);
  for ( int i = 0; i < circles.length; i++ ) {
    for (; circles[i][2] >= random(10, 45); circles[i][2] *= random(0.85, 0.95) ) {
      for ( float theta = 0; theta < TWO_PI; theta += PI/64 ) {
        point(circles[i][0] + circles[i][2] * sin(theta), circles[i][1] + circles[i][2] * cos(theta));
      }
    }
  }
}


void drawLines() {
  for ( int i = 0; i < circles.length; i++ ) {
    for ( int j = i; j < circles.length; j++ ) {
      if ( random(0, 3) < 1 ) {
        continue;
      }
      stroke(255, 255, 255, random(150, 180));
      line(circles[i][0], circles[i][1], circles[j][0], circles[j][1]);
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("009.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
