/* 069_20190926 */

float[][] ps;
int cnt;

void setup() {
  size(1000, 1000);
  noLoop();
  strokeWeight(1.8);
  stroke(30, 120);
  noFill();
}


void draw() {
  background(230);

  initPoints();
  for ( int i = 0; i < 300; i++, cnt++ ) {
    bezier(
      ps[0][0], ps[0][1], 
      ps[1][0], ps[1][1], 
      ps[2][0], ps[2][1], 
      ps[3][0], ps[3][1]
    );

    update();
    if ( random(2) < 1 ) {
      scale(1.2);
    } else {
      scale(0.75);
      translate(random(-10, 10), random(-10, 10));
      rotate(random(PI/64));
    }
  }
}


void initPoints() {

  ps = new float[4][2];
  ps[0][0] = random(         0,  width/4);
  ps[0][1] = random(         0, height/4);
  ps[1][0] = random( width*3/4,    width);
  ps[1][1] = random(         0, height/4);
  ps[2][0] = random(         0,  width/4);
  ps[2][1] = random(height*3/4,   height);
  ps[3][0] = random( width*3/4,    width);
  ps[3][1] = random(height*3/4,   height);
  
  cnt = 0;

  return ;
}


void update() {

  final float MAX_NOISE = 7.0;

  for ( int i = 0; i < ps.length; i++ ) {
    ps[i][0] += random(-MAX_NOISE, MAX_NOISE) * noise(cnt); 
    ps[i][1] += random(-MAX_NOISE, MAX_NOISE) * noise(cnt*2);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("069.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
