/* 077_20191117 */

void setup() {
  size(1000, 1000);
  noLoop();
  strokeWeight(0.5);
  stroke(66, 66, 66);
  noFill();
}


void draw() {
  background(230);
  translate(width/2, height/2);

  int v, pv = (int)random(3, 7);
  float r, pr = random(400, 650);
  for ( int i = 0; i < 3; i++ ) {
    while ( (r = random(2, pr)) > pr );
    while ( (v = (int)random(pv, 24)) < pv );
    drawShape(v, r);
    pv = v;
    pr = r;
  }
}


void drawShape(int v, float r) {

  float[][] ps = new float[v][2];

  float t = 0;
  for ( int i = 0; i < ps.length; i++ ) {
    ps[i][0] = r * cos(t);
    ps[i][1] = r * sin(t);
    t += TWO_PI / v;
  }

  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = i; j < ps.length; j++ ) {
      line(ps[i][0], ps[i][1], ps[j][0], ps[j][1]);
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("077.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
