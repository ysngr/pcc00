/* 047_20190710 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(ADD);
  rectMode(CENTER);
}


void draw() {
  background(0);
  translate(width/2, height/2);

  final int MAXRAD = 480;

  float x, y, rad, theta;
  for ( int i = 0; i < 800; i++ ) {
    rad = random(MAXRAD);
    theta = random(-PI, PI);
    x = rad * cos(theta);
    y = rad * sin(theta);
    rad = MAXRAD - mag(x, y);
    drawCircle(x, y, rad);
  }
}


void drawCircle(float x, float y, float rad) {

  stroke(random(30, 60), random(50, 100), random(230, 255));  // blue
  //stroke(random(250, 255), random(140, 180), random(0, 40));  // orange
  for ( float theta = 0; theta < TWO_PI; theta += TWO_PI/(2*rad) ) {
    point(x + rad*cos(theta), y + rad*sin(theta));
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("047.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
