/* 011_2019021 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(SCREEN);
}


void draw() {
  translate(width/2, height/2);
  background(40);

  for ( int i = 0; i <= 3; i++ ) {
    strokeWeight(0.5);
    stroke(random(200, 255), random(200, 255), random(200, 255));  // color = white
    if ( i == 3 ) {
      strokeWeight(random(2.0, 2.5));
      stroke(random(230, 255), random(0, 30), random(180, 220));  // color = purple
    }
    drawRing(i);
  }
}

void drawRing(int i) {
  
  final float d_theta = TWO_PI / 1024;

  for ( float angle = 0; angle < TWO_PI; angle += d_theta ) {
    if ( random(3) >= 1 ) {
      continue;
    }
    for ( int j = 0; j < random(10, 40); j++ ) {
      float s = random(i*50, i*120) + random(5);
      line(s+random(i*5), 0, s+random(i*32), 0);
      angle += d_theta / 2;
      rotate(angle);
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("011.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
