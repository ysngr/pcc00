/* 067_20190915 */

void setup() {
  size(1000, 1000);
  noLoop();
  strokeWeight(1.0);
  stroke(20, 120, 120, 30);
  noFill();
}


void draw() {
  background(240);
  translate(width/2, height/2);

  final float DR = 4.5;
  final float DT = PI / 256;
  final float MAXNOISE = 80.0;

  float r = 160.0;
  for ( int i = 0; i < 400; i++ ) {
    beginShape();
    for ( float t = 0; t < TWO_PI - random(2*DT); t += DT ) {
      vertex((r+MAXNOISE*noise(t))*cos(t), (r+MAXNOISE*noise(t))*sin(t));
    }
    endShape();
    rotate(random(5*DT));
    r += random(-DR, DR);
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("067.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
