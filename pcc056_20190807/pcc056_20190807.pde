/* 056_20190807 */

void setup() {
  size(1500, 1000);
  noLoop();
  blendMode(SCREEN);
}


void draw() {
  background(0);

  for ( int i = 0; i < 150; i++ ) {
    drawNoisyCircle(random(width), random(height));
  }
}


void drawNoisyCircle(float cx, float cy) {

  final float MIN_RAND = -8;
  final float MAX_RAND = 8;

  int fignum = (int)random(50);
  int divnum = (int)random(128, 256);
  float r, dr;

  stroke(random(200, 255), random(50, 150), random(0, 100), 150);  // red
  //stroke(random(20, 60), random(120, 220), random(200, 255), 150);  // blue
  noFill();

  r = 0;
  dr = random(5);
  pushMatrix();
  translate(cx, cy);
  for ( int i = 0; i < fignum; i++ ) {  
    beginShape();
    for ( float t = 0; t < TWO_PI; t += TWO_PI/divnum ) {
      curveVertex(r*cos(t) + random(MIN_RAND, MAX_RAND), r*sin(t) + random(MIN_RAND, MAX_RAND));
    }
    endShape(CLOSE);
    r += dr;
  }
  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("056.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
