/* 066_20190914 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(SCREEN);
}


void draw() {
  background(30);
  translate(width/2, height/2);

  final float MAXNOISE = 45.0;

  strokeWeight(1.0);
  stroke(240, 130, 45, 200);
  noFill();

  for ( float r = 85; r < 280; r += random(-0.10, 0.25) ) {
    rotate((PI/512)*noise(r));
    for ( float t = 0; t < TWO_PI; t += PI/256 ) {
      if ( random(10) < 4 ) {
        point((r+MAXNOISE*noise(t))*cos(t), (r+MAXNOISE*noise(t))*sin(t));
      }
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("066.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
