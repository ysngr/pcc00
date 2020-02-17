/* 012_20190423 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(ADD);
  noStroke();
}


void draw() {
  background(30);
  drawStars(150, 15, 30);
  drawStars(25, 25, 45);
}


void drawStars(int starNum, float minDiag, float maxDiag) {

  final int MIN_ALPHA = 5, MAX_ALPHA = 20;
  final color YELLOW = color(255, 255, 224);
  final color ORANGE = color(255, 153, 51);
  final color BLUE = color(80, 130, 255);

  float x, y, diag;
  color col;
  float alpha, d_alpha;

  for ( int i = 0; i < starNum; i++ ) {
    x = random(width);
    y = random(height);
    diag = random(minDiag, maxDiag);
    d_alpha = (MAX_ALPHA - MIN_ALPHA) / diag;

    switch( (int)random(3) ) {
      case 0 : col = YELLOW; break;
      case 1 : col = ORANGE; break;
      case 2 : col = BLUE;   break;
      default : col = color(0, 0, 0);  // dummy
    }

    for ( alpha = MIN_ALPHA; diag > 0; diag--, alpha += d_alpha ) {
      fill(col, alpha);
      circle(x, y, diag);
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("012.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
