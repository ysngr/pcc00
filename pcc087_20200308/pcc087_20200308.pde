/* 087_20200308 */

float[][][] ps;


void setup() {
  size(1000, 1000);
  noLoop();
  init();
}


void init() {

  ps = new float[19][19][2];

  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = 0; j < ps[i].length; j++ ) {
      ps[i][j][0] = (j + 1) * width/(ps[i].length+1);
      ps[i][j][1] = (i + 1) * height/(ps.length+1);
    }
  }

  return ;
}


void draw() {
  background(240);

  for ( int i = 0; i < 750; i++ ) {
    lay((int)random(ps.length), (int)random(ps[0].length));
  }
  for ( int i = 0; i < 200; i++ ) {
    paint((int)random(ps.length), (int)random(ps[0].length));
  }
}


void lay(int ri, int ci) {
  
  final float XLEN = width / (ps[0].length+1);
  final float YLEN = height / (ps.length+1);

  float sx, sy, ex, ey;

  sx = ps[ri][ci][0];
  sy = ps[ri][ci][1];

  switch( (int)random(3) ) {
    case 0 : ex = sx + XLEN; break;
    case 1 : ex = sx - XLEN; break;
    default : ex = sx;
  }

  switch( (int)random(3) ) {
    case 0 : ey = sy + YLEN; break;
    case 1 : ey = sy - YLEN; break;
    default : ey = sy;
  }

  strokeWeight(random(0.5));
  stroke(40);
  line(sx, sy, ex, ey);

  return ;
}


void paint(int ri, int ci) {

  final float XLEN = width / (ps[0].length+1);
  final float YLEN = height / (ps.length+1);

  noStroke();
  fill(random(240, 255), random(80, 220), random(0, 140), random(10, 100));

  switch( (int)random(4) ) {
    case 0 :  // upper left
      triangle(
        ps[ri][ci][0]     , ps[ri][ci][1]     , 
        ps[ri][ci][0]-XLEN, ps[ri][ci][1]     , 
        ps[ri][ci][0]     , ps[ri][ci][1]-YLEN
      );
      break;
    case 1 :  // upper right
      triangle(
        ps[ri][ci][0]     , ps[ri][ci][1]     , 
        ps[ri][ci][0]+XLEN, ps[ri][ci][1]     , 
        ps[ri][ci][0]     , ps[ri][ci][1]-YLEN
      );
      break;
    case 2 :  // lower left
      triangle(
        ps[ri][ci][0]     , ps[ri][ci][1]     , 
        ps[ri][ci][0]-XLEN, ps[ri][ci][1]     , 
        ps[ri][ci][0]     , ps[ri][ci][1]+YLEN
      );
      break;
    case 3 :  // lower right
      triangle(
        ps[ri][ci][0]     , ps[ri][ci][1]     , 
        ps[ri][ci][0]+XLEN, ps[ri][ci][1]     , 
        ps[ri][ci][0]     , ps[ri][ci][1]+YLEN
      );
      break;
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("087.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
