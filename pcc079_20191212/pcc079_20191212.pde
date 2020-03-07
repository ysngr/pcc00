/* 079_20191212 */

final float MINRAD = 200.0, MAXRAD = 280.0;
final int DIVNUM = 512;
final float MAXRAND = 20.5;


void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  background(40);
  plotCircles(160);
  plotWaveCircles(70);
}


void plotCircles(int num) {

  float x, y, r;

  strokeWeight(0.8);
  for ( int i = 0; i < num; i++ ) {
    r = random(MINRAD, MAXRAD);
    stroke(random(128, 255), 240);
    for ( float t = 0; t < TWO_PI; t += TWO_PI/DIVNUM ) {
      x = width/2 + r * cos(t) + random(-MAXRAND, MAXRAND);
      y = height/2 + r * sin(t) + random(-MAXRAND, MAXRAND);
      point(x, y);
    }
  }

  return ;
}


void plotWaveCircles(int num) {

  float x, y, r, rrand;

  strokeWeight(1.8);
  for ( int i = 0; i < num; i++ ) {
    stroke(random(128, 255), 255);
    r = random(MINRAD, MAXRAD);
    rrand = random(3.5*MAXRAND);
    for ( float t = random(-PI/512, PI/512); t < TWO_PI; t += TWO_PI / (DIVNUM/4) ) {
      x = width/2 + (r + rrand) * cos(t);
      y = height/2 + (r + rrand) * sin(t);
      point(x, y);
      rrand *= -1;
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("079.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
