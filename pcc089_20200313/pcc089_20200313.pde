/* 089_20200313 */

void setup() {
  size(1000, 1000);
  noLoop();
  noStroke();
}


void draw() {
  background(220);

  final int MAXRAND = 35;

  PImage pic = loadImage("lena.png");
  int w, h;
  int[][] ts = new int[3][2];

  for ( int i = 0; i < 20000; i++ ) {
    w = (int)random(width);
    h = (int)random(height);
    for ( int j = 0; j < 3; j++ ) {
      ts[j][0] = w + (int)random(-MAXRAND, MAXRAND);
      ts[j][1] = h + (int)random(-MAXRAND, MAXRAND);
    }
    fill(pic.get(w, h));
    triangle(ts[0][0], ts[0][1], ts[1][0], ts[1][1], ts[2][0], ts[2][1]);
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("089.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
