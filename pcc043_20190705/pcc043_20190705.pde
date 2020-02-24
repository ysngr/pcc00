/* 043_20190705 */

void setup() {
  size(1000, 1000);
  noLoop();
  rectMode(CENTER);
  strokeWeight(1);
  noFill();
}


void draw() {
  background(255);
  translate(width/2, height/2);

  float rectSize = 1;
  for ( int i = 0; i < 120; i++ ) {
    stroke(random(255));  // color = black/white
    for ( int j = 0; j < 180; j++ ) {
      square(0, 0, rectSize+50*noise(i+j));
      rotate(noise(i+j)/2);
    }
    rectSize += random(20);
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("043.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
