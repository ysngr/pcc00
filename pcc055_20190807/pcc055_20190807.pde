/* 055_20190807 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(SCREEN);
}


void draw() {
  background(0);

  for ( int i = 0; i < 20; i++ ) {
    pushMatrix();
    translate(random(width), random(height));
    stroke(random(255), random(255), random(255), 120);
    for ( float rad = 0; rad < sqrt(2)*width/2; rad += 5*noise(rad) ) {
      drawNoiseCircle(rad);
    }
    popMatrix();
  }
}


void drawNoiseCircle(float rad) {

  for ( float theta = 0; theta < TWO_PI; theta += TWO_PI/1024 ) {
    point(rad*cos(theta), rad*sin(theta));
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("055.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
