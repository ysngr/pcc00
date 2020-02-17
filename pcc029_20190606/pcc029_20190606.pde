/* 029_20190606 */

Sq[][] sqs;
boolean isFillSq;
int ringIdx;


void setup() {
  size(800, 800);
  background(0);
  frameRate(15);
  blendMode(ADD);
  rectMode(CENTER);
  noFill();
  init();
}


void init() {

  sqs = new Sq[20][16];
  isFillSq = false;
  ringIdx = 0;

  return ;
}


void draw() {
  translate(width/2, height/2);
  background(0);

  boolean isRingIdxUpdate = false;
  if ( random(0, 10) >= 6 ) {
    genNewRing();
    isRingIdxUpdate = true;
  }
  drawSquares();
  updateSquares(isRingIdxUpdate);
}


void genNewRing() {

  for ( int i = 0; i < sqs[ringIdx].length; i++ ) {
    if ( isFillSq ) {
      sqs[ringIdx][i].reconstruct();
    } else {
      sqs[ringIdx][i] = new Sq();
    }
  }

  return ;
}


void drawSquares() {

  for ( int i = 0; i < sqs.length; i++ ) {
    if ( isFillSq == false && i >= ringIdx ) {
      break;
    }
    for ( int j = 0; j < sqs[i].length; j++ ) {
      sqs[i][j].drawSquare();
    }
  }

  return ;
}


void updateSquares(boolean isRingIdxUpdate) {

  for ( int i = 0; i < sqs.length; i++ ) {
    if ( isFillSq == false && i >= ringIdx ) {
      break;
    }
    for ( int j = 0; j < sqs[i].length; j++ ) {
      sqs[i][j].updateSquare();
    }
  }

  if ( isRingIdxUpdate ) {
    ringIdx++;
    if ( isFillSq == false && ringIdx == sqs.length ) {
      isFillSq = true;
    }
    ringIdx %= sqs.length;
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("029.png"); 
    System.exit(0);
  }
}
