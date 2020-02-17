/* 030_20190607 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(SCREEN);
  strokeWeight(2);
}


void draw() {
  background(30);
  translate(width/2, height/2);
  drawRandomCircles();
}


void drawRandomCircles() {

  for ( int i = 0; i < 256; i++ ) {
    rotate(PI/6);
    stroke(random(128, 255), 30);  // color = white
    fill(random(0, 128), random(0, 128), random(128, 200), 15);  // color = blue
    ellipse(0, 0, 400+random(-20, 100), 900+random(-20, 100));
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("030.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
