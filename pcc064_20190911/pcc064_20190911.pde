/* 064_20190911 */

void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  background(240);
  translate(width/2, height/2);

  final float RANDMAX = 40.0;

  float sx = -400.0, sy = -400.0, ex = 400.0, ey = 400.0;
  float cp1x = -200.0, cp1y = -200.0, cp2x = 200.0, cp2y = 200.0;
  float sgn;

  strokeWeight(1.0);
  noFill();

  for ( int i = 0; i < 800; i++ ) {
    stroke(75, random(25, 60));
    bezier(sx, sy, cp1x, cp1y, cp2x, cp2y, ex, ey);
    if ( random(100) < 3 ) {
      rotate(PI / 512);
    }
    if ( random(10) < 3 ) {
      scale(random(0.99, 1.01));
    }

    sgn = ( random(10) < 6 )? +0.98 : -0.96;
    sx += sgn * 0.28 * RANDMAX * random(noise(i));
    sy -= sgn * 0.28 * RANDMAX * random(noise(i));
    cp1x += sgn * 0.22 * RANDMAX * random(noise(i));
    cp1y += sgn * 1.25 * RANDMAX * random(noise(i));
    cp2x -= sgn * 0.30 * RANDMAX * random(noise(i));
    cp2y -= sgn * 1.05 * RANDMAX * random(noise(i));
    ex -= sgn * 0.18 * RANDMAX * random(noise(i));
    ey -= sgn * 0.18 * RANDMAX * random(noise(i));
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("064.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
