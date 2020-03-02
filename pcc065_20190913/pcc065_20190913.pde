/* 065_20190913 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(MULTIPLY);
  strokeWeight(1.25);
  stroke(100, 35);
  noFill();
}


void draw() {
  background(230);
  translate(width/2, height/2);

  final float MAXRAND = 100.0;

  for ( float r = 175; r < 250; r += random(1.5) ) {
    beginShape();
    for ( float t = 0; t < TWO_PI; t += PI/50 ) {
      if ( random(10) < 2 ) {
        vertex((r+random(MAXRAND))*cos(t), (r+random(MAXRAND))*sin(t));
      } else {
        vertex(r*cos(t), r*sin(t));
      }
    }
    endShape(CLOSE);
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("065.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
