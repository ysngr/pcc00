/* 024_20190523 */

void setup() {
  size(1000, 1000);
  noLoop();
  noStroke();
  textAlign(CENTER, CENTER);
}


void draw() {

  background(255);

  final String charactors = "Lena";
  
  PImage img = loadImage("lena.png");

  for ( int h = 0; h <= height; h += 8 ) {
    for ( int w = 0; w <= width; w += 8 ) {
      if ( random(0, 100) <= 99.95 ) {
        fill(img.get(w, h));
        textSize(random(18, 32));
      } else {
        fill(0);
        textSize(128);
      }
      text(charactors.charAt((int)random(0, charactors.length())), w + random(-2, 2), h + random(-2, 2));
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("024.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
