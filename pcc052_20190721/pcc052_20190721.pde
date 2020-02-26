/* 052_20190721 */

void setup() {
  size(1300, 1000);
  noLoop();
  blendMode(ADD);
}


void draw() {
  background(0);
  for ( int i = 0; i < 100; i++ ) {
    drawCircle();
  }
}


void drawCircle() {

  float rad;
  float cx = random(width);
  float cy = random(height);

  stroke(random(255), random(255), random(255), 30);
  fill(random(255), random(255), random(255), 5);
  
  for ( int i = 0; i < 30; i++ ) {
    rad = random(500);
    arc(cx, cy, rad, rad, random(-TWO_PI, PI), random(-PI, TWO_PI));
  }


  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("052.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
