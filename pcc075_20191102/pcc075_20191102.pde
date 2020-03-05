/* 075_20191102 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(ADD);
  strokeWeight(0.8);
  stroke(240, 100, 40, 80);
  noFill();
}


void draw() {
  background(30);
  translate(width/2, height/2);

  final float R = 320.0;
  final float MAXRAND = 30;

  float[][] ps = new float[4][2];
  float t;

  for ( int i = 0; i < 400; i++ ) {
    t = random(-PI/3, PI/3);
    for ( int j = 0; j < ps.length; j++ ) {
      t += random(PI/3);
      ps[j][0] = R * cos(t);
      ps[j][1] = R * sin(t);
    }
    bezier(
      ps[0][0]+random(MAXRAND), ps[0][1], 
      ps[1][0]                , ps[1][1], 
      ps[2][0]                , ps[2][1], 
      ps[3][0]+random(MAXRAND), ps[3][1]
    );
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("075.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
