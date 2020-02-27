/* 054_20190807 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(SCREEN);
  strokeWeight(1.75);
  stroke(240, 65, 20, 230);
  fill(240, 65, 20, 15);
}


void draw() {
  background(0);
  translate(width/2, height/2);

  final int DIVNUM = 64;
  final float D_THETA = TWO_PI / DIVNUM;

  float edge_len = 250;
  for ( int i = 0; i < 1.6*DIVNUM; i++ ) {
    triangle(
      edge_len * cos(0) + extendNoise(i)         , edge_len * sin(0) + extendNoise(i)         , 
      edge_len * cos((2.0/3)*PI) + extendNoise(i), edge_len * sin((2.0/3)*PI) + extendNoise(i), 
      edge_len * cos((4.0/3)*PI) + extendNoise(i), edge_len * sin((4.0/3)*PI) + extendNoise(i)
    );
    rotate(random(D_THETA));
    if ( random(10) < 4 ) {
      edge_len += 7;
    }
  }
}


float extendNoise(float seed) {
  final float NOISE_MAX = 12.0;
  return random(-NOISE_MAX, NOISE_MAX) * noise(seed);
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("054.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
