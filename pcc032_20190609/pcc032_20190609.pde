/* 032_20190609 */

final float SQSIZE = 130.0;


void setup() {
  size(1000, 1000);
  noLoop();
  strokeWeight(1.5);
}


void draw() {
  background(250, 225, 185);  // color = pale orange

  for ( float h = random(-SQSIZE/2, SQSIZE/2); h <= height + SQSIZE/2; h += SQSIZE + random(-SQSIZE/8, SQSIZE/8) ) {
    for ( float w = random(-SQSIZE/2, SQSIZE/2); w <= width + SQSIZE/2; w += SQSIZE + random(-SQSIZE/8, SQSIZE/8) ) {
      drawArcs(w, h);
    }
  }
}


void drawArcs(float w, float h) {

  float rad, next_theta;
  for ( float theta = 0; theta < TWO_PI; theta = next_theta ) {
    rad = random(0, SQSIZE);
    next_theta = theta + random(PI/4);
    stroke(255, 255, 255, random(200, 255));  // color = white
    fill(random(0, 120), random(60, 240), random(0, 120), random(100, 255));  // color = green
    arc(w, h, rad, rad, theta, next_theta);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("032.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
