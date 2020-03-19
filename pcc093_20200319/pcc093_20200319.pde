/* 093_20200319 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(LIGHTEST);
}


void draw() {
  background(75, 60, 5);

  final int FLOOR = 12;
  final float WG = 50.0;

  float sw, ew, h;

  for ( int i = 0; i < FLOOR; i++ ) {
    h = WG + i * (height-2*WG) / (FLOOR-1);
    
    strokeWeight(0.8);
    stroke(random(255), random(255), random(255), 80);
    line(WG, h, width-WG, h);

    noStroke();
    fill(random(128, 255), random(255), random(255), 95);
    for ( int j = 0; j < 75; j++ ) {
      sw = random(WG, width-WG);
      ew = sw + random(-100, 100);
      bezier(sw, h, sw+dw(), h+dh(), ew+dw(), h+dh(), ew, h);
    }
  }
}


float dw() {
  return random(-100.0, 100.0);
}


float dh() {
  return random(-100.0, 100.0);
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("093.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
