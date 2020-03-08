/* 086_20200306 */

final int SQNUM = 12;
final int RECNUM = 10;


void setup() {
  size(1000, 1000);
  noLoop();
  strokeWeight(1.2);
  stroke(128, 128, 128);
}


void draw() {
  background(240);

  float dr = height / SQNUM;
  float dc = width / SQNUM;
  for ( int r = 0; r < height; r += dr ) {
    for ( int c = 0; c < width; c += dc ) {
      drawRecSq(c, r, c, r+dr, c+dc, r+dr, c+dc, r, RECNUM);
    }
  }
}


void drawRecSq(float lur, float luc, float rur, float ruc, float rlr, float rlc, float llr, float llc, int level) {

  if ( level <= 0 ) {
    return ;
  }

  line(lur, luc, rur, ruc);
  line(rur, ruc, rlr, rlc);
  line(rlr, rlc, llr, llc);
  line(llr, llc, lur, luc);

  drawRecSq(lur+rr(), luc+rc(), rur+rr(), ruc-rc(), rlr-rr(), rlc-rc(), llr-rr(), llc+rc(), level-1);

  return ;
}


float rr() {
  return random(height/SQNUM/RECNUM/1.5);
}


float rc() {
  return random(width/SQNUM/RECNUM/1.5);
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("086.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
