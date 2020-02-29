/* 062_20190908 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(SCREEN);
}


void draw() {
  background(0);
  translate(width/2, height/2);

  int lap;
  for ( float r = 0, t = 0; r < 490; r += 2.0, t += TWO_PI/40 ) {
    lap = (int)((t + TWO_PI) / TWO_PI);
    drawSpiral(r*cos(t), r*sin(t), color(255, 100, 20), lap);
    drawSpiral(r*cos(t+TWO_PI/3), r*sin(t+TWO_PI/3), color(255, 30, 150), lap);
    drawSpiral(r*cos(t+2*TWO_PI/3), r*sin(t+2*TWO_PI/3), color(25, 230, 255), lap);
  }
}


void drawSpiral(float x, float y, color c, int lap) {

  stroke(c, 120);

  for ( float r = 0, t = 0; t < lap*TWO_PI; r += random(0.1), t += TWO_PI/128 ) {
    strokeWeight(4.5 * (1 - t/(lap*TWO_PI)));
    point(x + r*cos(t), y + r*sin(t));
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("062.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
