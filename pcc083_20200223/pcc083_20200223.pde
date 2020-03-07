/* 083_20200223 */

final int x = 0, y = 1, r = 2, g = 3, b = 4;
final int VERTSQNUM = 125, HRIZSQNUM = 125;

float[][][] ps;


void setup() {
  size(1000, 1000);
  frameRate(15);
  strokeWeight(0.5);
  stroke(255, 255, 255);
  init();
}


void init() {

  ps = new float[VERTSQNUM][HRIZSQNUM][5];
  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = 0; j < ps[i].length; j++ ) {
      ps[i][j][x] = j * width / HRIZSQNUM;
      ps[i][j][y] = i * height / VERTSQNUM;
      ps[i][j][r] = random(255);
      ps[i][j][g] = random(255);
      ps[i][j][b] = random(255);
    }
  }

  return ;
}


void draw() {
  paint();
  update();
}


void paint() {

  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = 0; j < ps[i].length; j++ ) {
      fill(ps[i][j][r], ps[i][j][g], ps[i][j][b]);
      rect(ps[i][j][x], ps[i][j][y], width/HRIZSQNUM, height/VERTSQNUM);
    }
  }

  return ;
}


void update() {

  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = 0; j < ps[i].length; j++ ) {
      if ( random(10) < 9 ) {
        continue;  // survive
      }

      // infect
      if ( j != 0 && ps[i][j][r] < ps[i][j-1][r] ) {  // left
        ps[i][j][r] = ps[i][j-1][r];
        ps[i][j][g] = ps[i][j-1][g];
        ps[i][j][b] = ps[i][j-1][b];
      }
      if ( j != HRIZSQNUM-1 && ps[i][j][r] < ps[i][j+1][r] ) {  //right
        ps[i][j][r] = ps[i][j+1][r];
        ps[i][j][g] = ps[i][j+1][g];
        ps[i][j][b] = ps[i][j+1][b];
      }
      if ( i != 0 && ps[i][j][b] < ps[i-1][j][b] ) {  // upper
        ps[i][j][r] = ps[i-1][j][r];
        ps[i][j][g] = ps[i-1][j][g];
        ps[i][j][b] = ps[i-1][j][b];
      }
      if ( i != VERTSQNUM-1 && ps[i][j][b] < ps[i+1][j][b] ) {  // lower
        ps[i][j][r] = ps[i+1][j][r];
        ps[i][j][g] = ps[i+1][j][g];
        ps[i][j][b] = ps[i+1][j][b];
      }
      if ( random(10) < 4 ) {  // reborn
        ps[i][j][r] = random(255);
        ps[i][j][g] = random(255);
        ps[i][j][b] = random(255);
      }
      if ( random(10) < 3 ) {  // death
        ps[i][j][r] = 0;
        ps[i][j][g] = 0;
        ps[i][j][b] = 0;
      }
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("083.png");
    System.exit(0);
  }
}
