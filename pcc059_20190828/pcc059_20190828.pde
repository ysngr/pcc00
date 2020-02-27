/* 059_20190828 */

float[][][] ps;


void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(SCREEN);
  initPoints();
}


void initPoints() {

  final float R = 500.0;

  float r, t;

  ps = new float[3][32][2];

  for ( int i = 0; i < ps.length; i++ ) {
    r = (i + 1) * (R / ps.length);
    t = 0;
    for ( int j = 0; j < ps[i].length; j++ ) {
      ps[i][j][0] = r * cos(t);
      ps[i][j][1] = r * sin(t);
      t += TWO_PI / ps[i].length;
    }
  }

  return ;
}


void draw() {
  background(50);
  translate(width/2, height/2);

  for ( int i = 0; i < 380; i++ ) {
    drawFig();
  }
}


void drawFig() {

  color c = color(165, 20, 240);
  int stg = (int)random(ps.length);
  int[] is = getIndexes();

  switch( stg ) {
    case 0 : stroke(c, 180); break;
    case 1 : stroke(c, 160); break;
    case 2 : stroke(c, 140); break;
  }
  fill(random(200, 255), random(100, 150), random(0, 50), 20);
  
  triangle(
    ps[stg][is[0]][0], ps[stg][is[0]][1], 
    ps[stg][is[1]][0], ps[stg][is[1]][1], 
    ps[stg][is[2]][0], ps[stg][is[2]][1]
  );

  return ;
}


int[] getIndexes() {

  int[] indexes = new int[3];

  for ( int i = 0; i < indexes.length; i++ ) {
    indexes[i] = (int)random(ps[0].length);
  }

  return indexes;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("059.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
