/* 060_20190829 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(SCREEN);
}


void draw() {
  background(5, 30, 65);
  translate(width/2, height/2);

  final float R = 350.0;
  for ( float t = 0; t < TWO_PI; t += TWO_PI/12 ) {
    drawSpiral(R*cos(t), R*sin(t));
  }
}


void drawSpiral(float cx, float cy) {

  final float MAXRAND = 1.2;

  pushMatrix();
  translate(cx, cy);

  float r = 0;
  float x, y;
  float px = 0, py = 0;
  for ( float t = 0; t < 4*TWO_PI; t += TWO_PI/128 ) {
    r += random(0.5, 0.7);
    x = r * cos(t) + random(MAXRAND);
    y = r * sin(t) + random(MAXRAND);
    
    strokeWeight(random(6.0));
    stroke(random(0, 50), random(100, 200), random(200, 255));
    line(x, y, px, py);
    
    px = x;
    py = y;
  }

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("060.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
