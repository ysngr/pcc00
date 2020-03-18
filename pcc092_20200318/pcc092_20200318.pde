/* 092_20200318 */

final int DIVNUM = 80;

float[][] ps;


void setup() {
  size(1200, 800);
  noLoop();
  strokeWeight(1.0);
}


void draw() {
  background(240);

  for ( int h = 0; h <= height; h += height/5 ) {
    pushMatrix();
    translate(0, h);
    genWave((int)random(100, 200));
    popMatrix();
  }
  translate(0, height/2);
  genWave(1000);
}


void genWave(int n) {
  
  stroke(random(255), random(80, 200), random(200, 255), 30);

  init();
  for ( int i = 0; i < n; i++ ) {
    plot();
    update();
  }

  return ;
}



void init() {

  final float AMP = 0.8 * height/2;

  float r, t;

  ps = new float[1200][2];
  r = random(AMP/2, AMP);
  t = 0;

  for ( int i = 0; i < ps.length; i++ ) {
    ps[i][0] = i;
    ps[i][1] = r * sin(t);
    t += TWO_PI / DIVNUM;

    if ( i % DIVNUM == 0 ) {
      r = random(AMP);
      t = 0;
    }
  }

  return ;
}


void plot() {

  for ( int i = 0; i < ps.length-1; i++ ) {
    line(ps[i][0], ps[i][1], ps[i+1][0], ps[i+1][1]);
  }

  return ;
}


void update() {

  final float D = 0.5;

  int sgn;

  sgn = ( random(2) < 1 )? 1 : -1;
  for ( int i = 0; i < ps.length; i++ ) {
    ps[i][0] += sgn * D;
    ps[i][1] += sgn * D;

    if ( i % DIVNUM == 0 ) {
      sgn = ( random(2) < 1 )? 1 : -1;
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("092.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
