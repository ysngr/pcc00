/* 061_20190907 */

final float SQR = 80.0;


void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  background(30);

  for ( int r = 0; r < height/SQR; r++ ) {
    for ( int c = 0; c < width/SQR; c++ ) {
      if( (r+c) % 2 == 0 ) {
        drawFlower((r+0.5)*SQR, (c+0.5)*SQR);
      } else {
        drawLine((r+0.5)*SQR, c*SQR);
      }
    }
  }
}



void drawFlower(float x, float y) {

  final float DIVNUM = 24.0;
  final float R = 10.0;

  noStroke();
  fill(255, 125, 0);  // orange
  //fill(0, 200, 255);  // blue

  for( int i = 1; i <= 3; i++ ){
    for( float t = 0; t < TWO_PI; t += TWO_PI / random(DIVNUM/1.5, DIVNUM) ){
      circle(x+i*R*cos(t), y+i*R*sin(t), 12/(5-i));
    }
  }

  return ;
}


void drawLine(float x, float y) {

  strokeWeight(3);
  stroke(255, 125, 0);  // orange
  //stroke(0, 180, 255);  // blue
  
  line(x, y, x, y+SQR);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("061.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
