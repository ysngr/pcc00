/* 070_20190928 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(ADD);
  strokeWeight(1.8);
}


void draw() {
  background(0);
  translate(width/2, height/2);

  final float RNOISE = 8.0;

  float r = 40.0;
  for ( int step = 0; step < 45; step++ ) {
    stroke(random(200, 255), random(100, 180), random(30, 85));
    for ( int i = 0; i < 6000; i++ ) {
      switch( (int)random(4) ) {
        case 0 :
          point((r+RNOISE*noise(i))*cos(noise(i)*TWO_PI), (r+RNOISE*noise(i))*sin(noise(i)*TWO_PI));
          break;
        case 1 : 
          point((r+RNOISE*sqrt(i))*cos(noise(sqrt(i))*TWO_PI), (r+RNOISE*noise(sqrt(i)))*sin(noise(sqrt(i))*TWO_PI));
          break;
        case 2 : 
          point((r+RNOISE*sqrt(2*i))*cos(noise(i)*TWO_PI), (r+RNOISE*noise(2*i))*sin(noise(i)*TWO_PI));
          break;
        default :
          point((r+rsgn(i)*RNOISE*noise(i*i))*cos(noise(i*i)*TWO_PI), (r+rsgn(i)*RNOISE*noise(i*i))*sin(noise(i*i)*TWO_PI));
          break;
      }
      r += random(-2, 2);
    }
    rotate(random(PI));
    if ( random(3) < 1  ) {
      scale(0.80);
    }
  }
}


float rsgn(float s) { 
  return random(-random(abs(s)), random(abs(s)));
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("070.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
