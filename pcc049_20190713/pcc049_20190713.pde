/* 049_20190713 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(ADD);
  strokeWeight(0.5);
}


void draw() {
  background(0);

  final float STEP = 2.0;  

  float x, y;

  for ( int p = 0; p < 400; p++ ) {
    //stroke(random(200, 255), random(0, 80), random(0, 80));  // red
    stroke(random(30, 50), random(80, 100), random(150, 240));  // blue
    //stroke(random(255));  // gray
    x = random(width);
    y = random(height);
    for ( int i = 0; i < 8000; i++ ) {
      point(x, y);
      x += ( random(2) <= 1 )? STEP*noise(random(i)) : -STEP*noise(random(i));
      if ( x < 0 )  x = 0;
      else if ( x > width )  x = width;
      y += ( random(2) <= 1 )? STEP*noise(random(i)) : -STEP*noise(random(i));
      if ( y < 0 )  y = 0;
      else if ( y > height )  y = height;
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("049.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
