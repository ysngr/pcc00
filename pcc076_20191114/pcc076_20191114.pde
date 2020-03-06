/* 076_20191114 */

float[][][] ps;


void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(LIGHTEST);
  initPoints();
}


void initPoints() {

  ps = new float[15][15][2];

  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = 0; j < ps[i].length; j++ ) {
      ps[i][j][0] = i * (width / (ps.length - 1));
      ps[i][j][1] = j * (height / (ps[i].length - 1));
    }
  }

  return ;
}


void draw() {
  background(10, 60, 25);

  int[][] is;
  color c;

  drawHoles();

  for ( int i = 0; i < 30; i++ ) {
    is = selectPoints();
    c = selectColor();

    strokeWeight(random(3.5, 4));
    stroke(c);
    noFill();
    bezier(
      ps[is[0][0]][is[0][1]][0], ps[is[0][0]][is[0][1]][1], 
      ps[is[1][0]][is[1][1]][0], ps[is[1][0]][is[1][1]][1], 
      ps[is[2][0]][is[2][1]][0], ps[is[2][0]][is[2][1]][1], 
      ps[is[3][0]][is[3][1]][0], ps[is[3][0]][is[3][1]][1]
    );
  }
}


void drawHoles() {

  noStroke();
  fill(255);

  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = 0; j < ps[i].length; j++ ) {
      circle(ps[i][j][0], ps[i][j][1], 10);
    }
  }

  return ;
}


int[][] selectPoints() {

  int[][] indexes = new int[4][2];
  for ( int i = 0; i < indexes.length; i++ ) {
    indexes[i][0] = (int)random(ps.length);
    indexes[i][1] = (int)random(ps[0].length);
  }

  return indexes;
}


color selectColor() {

  color c;

  switch( (int)random(5) ) {
    case 0 : c = color(random(200, 240), random(  0,  20), random( 10,  40)); break;
    case 1 : c = color(random(230, 255), random(100, 140), random(  0,  20)); break;
    case 2 : c = color(random(220, 240), random(200, 240), random(  0,  20)); break;
    case 3 : c = color(random( 40,  60), random(140, 180), random(220, 255)); break;
    case 4 : c = color(random( 40,  80), random( 80, 120), random(240, 255)); break;
    default : c = color(0);  // dummy
  }

  return c;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("076.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
