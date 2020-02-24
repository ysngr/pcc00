/* 042_20190630 */

void setup() {
  size(1000, 1000);
  background(0);
  noLoop();
  blendMode(LIGHTEST);
  strokeWeight(1.0);
}


void draw() {
  translate(width/2, height/2);

  PImage pic = loadImage("lena.png");

  for ( int i = 0; i < 16; i++ ) {
    rotate(random(PI));
    for ( int h = 0; h < height; h++ ) {
      for ( int w = 0; w < width; w++ ) {
        if ( random(10) < 6 ) {
          stroke(pic.get(w, h), random(50, 80));
          point(w-width/2, h-height/2);
        }
      }
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("042.png");
    System.exit(0);
  }
}
