/* 000_20190410 */

void setup() {
  size(1000, 1000);
  background(0);
  frameRate(10);
}


void draw() {
  if ( (int)random(0, 100) % 2 == 0 ) {
    background(random(40, 120));
  }
  drawCircleLines();
}


void drawCircleLines() {

  final int CIRCLE_NUM = 500;
  final int LINE_NUM = 300;

  float[] xs, ys; 
  float diag, alpha;
  int start, end;

  // init points
  xs = new float[CIRCLE_NUM];
  ys = new float[CIRCLE_NUM];
  for ( int i = 0; i < CIRCLE_NUM; i++ ) {
    xs[i] = random(width);
    ys[i] = random(height);
  }

  // circle
  noStroke();
  for ( int i = 0; i < CIRCLE_NUM; i++ ) {
    diag = random(3, 100);
    alpha = (diag < 50)? 100: random(50, 90);
    fill(random(0, 80), random(80, 200), random(80, 255), alpha);
    circle(xs[i], ys[i], diag);
  }

  // line
  stroke(255, 255, 255, 50);
  strokeWeight(1.25);
  for ( int i = 0; i < LINE_NUM; i++ ) {
    start = (int)random(CIRCLE_NUM);
    while ( (end = (int)random(CIRCLE_NUM)) == start );
    line(xs[start], ys[start], xs[end], ys[end]);
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("000.png");
    System.exit(0);
  }
}
