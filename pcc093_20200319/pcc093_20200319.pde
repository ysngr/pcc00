/* 093_20200319 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(ADD);
  noFill();
}


void draw() {
  background(60);

  final int FLOOR = 19;
  final float WG = 50.0;

  float sw, ew, h;

  for ( int i = 0; i < FLOOR; i++ ) {
    sw = random(WG, width-WG);
    ew = sw + random(-100, 100);
    h = WG + i * (height-2*WG) / (FLOOR-1);
    stroke(random(255), random(0, 180), random(0, 200), 80);

    int len = (int)random(700, 1200);
    for ( int j = 0; j < len; j++ ) {
      sw += sgn() * noise(j+j);
      ew += sgn() * noise(j*j);
      h += noise(j);
      strokeWeight(random(1.2));
      bezier(sw, h, sw+dw(), h-dh(), ew-dw(), h+dh(), ew, h);
    }
  }
}


float sgn() {
  return ( random(2) < 1 )? 1.0 : -1.0;
}


float dw() {
  return random(-20.0, 20.0);
}


float dh() {
  return random(-80.0, 80.0);
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("093.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
