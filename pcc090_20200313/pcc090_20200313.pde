/* 090_20200313 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(ADD);
  strokeWeight(1.0);
  stroke(250, 40, 75, 140);
}


void draw() {
  background(50);
  translate(width/2, height/2);

  final int DIVNUM = 4056;
  final float MAXRAD = 420.0;

  float w, h, r, t, a;
  for ( int i = 0; i < 160; i++ ) {
    r = random(MAXRAD);
    a = random(r/4);
    for ( t = 0; t < TWO_PI; t += TWO_PI/DIVNUM ) {
      w = r * cos(t) + a * cos(23*t);
      h = r * sin(t);
      point(w, h);
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("090.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
