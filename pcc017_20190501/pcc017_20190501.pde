/* 017_20190501 */

float x, y;


void setup() {
  size(1000, 1000);
  background(40);
  strokeWeight(0.15);
  stroke(255, 255, 255);
  init();
}

void init() {

  x = 10.5;
  y = 0.0;

  return ;
}


void draw() {
  translate(width/2, height/2);
  update();
  plot();
}


void update() {

  final float a = 0.97, b = 0.995;

  float px = x, py = y;
  x = py - a * px + 5 / (sq(px) + 1) - 5;
  y = -b * px;

  return ;
}


void plot() {

  scale(25);
  point(x, y);
  scale(1/25);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("017.png");
    System.exit(0);
  }
}
