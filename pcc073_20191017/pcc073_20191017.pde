/* 073_20191017 */

void setup() {
  size(1000, 1000);
  noLoop();
  strokeWeight(0.05);
}


void draw() {
  background(220);

  for ( int i = 0; i < 15; i++ ) {
    pushMatrix();
    translate(random(width), random(height));
    drawFlower();
    popMatrix();
  }
}


void drawFlower() {

  final int DIVNUM = 2048;
  final float RAND = 3.8;

  stroke(random(255), random(255), random(255), 60);

  float r = 0, t = 0;
  for ( int i = 0; i < 4500; i++ ) {
    line(0, 0, r*cos(t), r*sin(t));
    rotate(TWO_PI / DIVNUM);

    r += random(-RAND, RAND);
    t += random(TWO_PI / DIVNUM);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("073.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
