/* 058_20190824 */

void setup() {
  size(1000, 1000);
  noLoop();
  rectMode(CENTER);
  strokeWeight(1.2);
}


void draw() {
  background(0);
  randRecSquare(width/2, height/2, 500, 5);
}


void randRecSquare(float x, float y, float rectsize, int stage) {

  if ( stage < 0 ) {
    return ;
  }
  
  randDrawSquare(x - rectsize/2, y - rectsize/2, rectsize);
  randRecSquare(x - rectsize/2, y - rectsize/2, rectsize/2, stage - 1);
  
  randDrawSquare(x + rectsize/2, y - rectsize/2, rectsize);
  randRecSquare(x + rectsize/2, y - rectsize/2, rectsize/2, stage - 1);
  
  randDrawSquare(x - rectsize/2, y + rectsize/2, rectsize);
  randRecSquare(x - rectsize/2, y + rectsize/2, rectsize/2, stage - 1);
  
  randDrawSquare(x + rectsize/2, y + rectsize/2, rectsize);
  randRecSquare(x + rectsize/2, y + rectsize/2, rectsize/2, stage - 1);

  return ;
}


void randDrawSquare(float x, float y, float l) {

  if ( random(3) < 2 ) {
    return ;
  }

  if ( random(2) < 1 ) {
    stroke(255, random(255));
  } else {
    noStroke();
  }
  fill(255, 80);

  square(x, y, l);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("058.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
