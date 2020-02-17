/* 005_20190418 */

void setup() {
  size(1000, 1000);
  background(0);
  noLoop();
  strokeCap(PROJECT);
}


void draw() {

  final float TILENUM = 30.0;
  final float TILESIZE = 1000 / TILENUM;

  float xs, xe, ys, ye;

  for ( int r = 0; r < TILENUM; r++ ) {
    for ( int c = 0; c < TILENUM; c++ ) {
      
      stroke(0, 191, 255, random(100, 255));  // color = blue
      strokeWeight(random(10, 12));
      
      switch( (int)random(0, 4) ) {
      case 0 :  /* \ */
        xs = c * TILESIZE;
        ys = r * TILESIZE;
        xe = xs + TILESIZE;
        ye = ys + TILESIZE;
        break;
      case 1 :  /* / */
        xs = (c + 1) * TILESIZE;
        ys = r * TILESIZE;
        xe = xs - TILESIZE;
        ye = ys + TILESIZE;
        break;
      case 2 :  /* | */
        xs = (c + 0.5) * TILESIZE;
        ys = r * TILESIZE;
        xe = xs;
        ye = ys + TILESIZE;
        break;
      case 3 :  /* - */
        xs = c * TILESIZE;
        ys = (r + 0.5) * TILESIZE;
        xe = xs + TILESIZE;
        ye = ys;
        break;
      default :  /* dummy */
        xs = -1; ys = -1; xe = -1; ye = -1;
      }
      line(xs, ys, xe, ye);
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("005.png");
    System.exit(0);
  }
}
