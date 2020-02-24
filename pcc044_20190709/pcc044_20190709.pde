/* 044_20190709 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(ADD);
  strokeWeight(1.0);
  noFill();
}


void draw() {
  background(0);
  translate(width/2, height/2);

  for ( int i = 0; i < 200; i++ ) {
    drawSpiral(random(PI));
  }
}


void drawSpiral(float initTheta) {

  final float DR = 2;

  float dr = sgn(initTheta) * random(1, DR);
  float r = dr;
  float theta = initTheta;
  
  float x = DR * cos(theta);
  float y = DR * sin(theta);
  float px = x;
  float py = y;

  while ( mag(x, y) < sqrt(2) * (width/2)  ) {
    r += dr;
    theta += random(PI / 70);
    x = r * cos(theta);
    y = r * sin(theta);
    stroke(random(20, 50), random(120, 180), random(200, 255), random(170, 200));
    line(x, y, px, py);
    px = x; 
    py = y;
  }

  return ;
}


float sgn(float seed) {
  if ( seed >= 0 ) {
    return 1.0;
  } else {
    return -1.0;
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("044.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
