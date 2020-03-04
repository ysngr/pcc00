/* 072_20191017 */

void setup() {
  size(1000, 1000);
  noLoop();
  strokeWeight(2.8);
}


void draw() {
  background(230);
  translate(width/12, height/2);  // blue
  //translate(width/2, height/12);  // pink

  final int DIVNUM = 1024;
  final float DR = 75.0;

  float r, t;

  r = 0;
  t = 0;
  while ( r < 500*sqrt(2) ) {
    // blue
    if ( t < PI/2 || t > 3*PI/2 ) {
      stroke(random(0, 128), random(0, 255), random(128, 255), 120);
      line(r*cos(t), r*sin(t), r*cos(t)+random(5.5*DR), r*sin(t));
    }
    // pink
    //if ( 0 < t && t <= PI ) {
    //  stroke(random(128, 255), random(0, 128), random(128, 255), 100);
    //  line(r*cos(t), r*sin(t), r*cos(t), r*sin(t)+random(5.5*DR));
    //}

    // update
    if ( (t += TWO_PI/DIVNUM) >= TWO_PI ) {
      t = 0;
      r += DR;
    }
  }

  r = 0;
  t = 0;
  while ( r < 500*sqrt(2) ) {
    stroke(230);
    point(r*cos(t), r*sin(t));

    // update
    if ( (t += PI/DIVNUM) >= TWO_PI ) {
      t = 0;
      r += DR;
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("072.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
