/* 028_20190605 */

float[][] ps;


void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(LIGHTEST);
  strokeWeight(0.8);
}


void draw() {
  background(50);
  translate(width/2, height/2);
  initps();
  drawLines();
}


void initps() {

  final float RAD = 450;

  ps = new float[256][2];

  float theta = 0;
  for ( int i = 0; i < ps.length; i++ ) {
    ps[i][0] = RAD * cos(theta);
    ps[i][1] = RAD * sin(theta);
    theta += TWO_PI / ps.length;
  }

  return ;
}


void drawLines() {

  color col;

  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = i; j < ps.length; j++ ) {
      if ( random(0, 5) >= 2 ) {
        continue;
      }
      switch( (int)(dist(ps[i][0], ps[i][1], ps[j][0], ps[j][1]) / 100) ) {
        case 0 :  col = color(random(  0, 128), random(  0, 128), random(  0, 128)); break;
        case 1 :  col = color(random(128, 255), random(  0, 128), random(  0, 128)); break;
        case 2 :  col = color(random(  0, 128), random(128, 255), random(  0, 128)); break;
        case 3 :  col = color(random(  0, 128), random(  0, 128), random(128, 255)); break;
        case 4 :  col = color(random(128, 255), random(128, 255), random(  0, 128)); break;
        case 5 :  col = color(random(128, 255), random(  0, 128), random(128, 255)); break;
        case 6 :  col = color(random(  0, 128), random(128, 255), random(128, 255)); break;
        case 7 :  col = color(random(128, 255), random(128, 255), random(128, 255)); break;
        case 8 :  col = color(random(  0, 128)); break;
        case 9 :  col = color(random(128, 255)); break;
        default :  col = color(random(  0, 255), random(  0, 255), random(  0, 255)); break;
      }
      stroke(col, random(100, 150));
      line(ps[i][0], ps[i][1], ps[j][0], ps[j][1]);
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("028.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
