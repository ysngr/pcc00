/* 039_20190629 */

final int START_REC_LEVEL = 20;


void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(ADD);
  rectMode(CENTER);
  strokeWeight(1);
}


void draw() {
  background(0);

  final int RECTNUM = 5;
  final int RECTSIZE = 1000 / RECTNUM;

  for ( int h = RECTSIZE/2; h < height; h += RECTSIZE ) {
    for ( int w = RECTSIZE/2; w < width; w += RECTSIZE ) {
      pushMatrix();
      translate(w, h);
      setColor(w, h);
      drawRecRects(START_REC_LEVEL, RECTSIZE);
      popMatrix();
    }
  }
}


void setColor(float widthSeed, float heightSeed) {

  int r = (int)map(widthSeed, 0, width, 45, 255);
  int g = (int)map(heightSeed, 0, height, 125, 200);
  int b = (int)map(widthSeed + heightSeed, 0, width+height, 180, 255);
  color col = color(r, g, b); 

  stroke(col);
  fill(col, 50);

  return ;
}


void drawRecRects(int recLevel, float edgelen) {

  if ( recLevel <= 0 ) {
    return ;
  }

  if ( recLevel != START_REC_LEVEL ) {
    rotate(random(-PI, PI));
  }

  rect(0, 0, edgelen, edgelen);

  drawRecRects(recLevel-1, edgelen/sqrt(2));

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("039.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
