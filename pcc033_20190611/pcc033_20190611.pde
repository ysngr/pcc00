/* 033_20190611 */

final int RAD_DIST = 80;

float[][] ps;
float[] rs;


void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  background(40);
  translate(width/2, height/2);

  initRads();
  initPlanets();
  drawCircles();
  drawRelLine();
  drawPlanets();
}


void initRads() {
  
  final int MAXRAD = 480;

  rs = new float[(int)(MAXRAD/RAD_DIST)];

  int ri = 0;
  for ( float r = RAD_DIST; r <= MAXRAD; r += RAD_DIST ) {
    rs[ri++] = r;
  }

  return ;
}


void initPlanets() {

  float rad, theta;

  ps = new float[100][2];
  
  for ( int i = 0; i < ps.length; i++ ) {
    rad = rs[(int)random(0, rs.length)];
    theta = random(-PI, PI);
    ps[i][0] = rad * cos(theta);
    ps[i][1] = rad * sin(theta);

    for ( int j = 0; j < i; j++ ) {
      if ( dist(ps[i][0], ps[i][1], ps[j][0], ps[j][1]) < RAD_DIST / 6 ) {
        i--;  // dispose
      }
    }
  }

  return ;
}


void drawCircles() {

  strokeWeight(1);
  stroke(255);
  noFill();

  for ( int i = 0; i < rs.length; i++ ) {
    circle(0, 0, 2*rs[i]);
  }

  return ;
}


void drawRelLine() {

  for ( int i = 0; i < ps.length; i++ ) {
    for ( int j = i; j < ps.length; j++ ) {

      // decrease the number of lines
      if ( mag(ps[i][0], ps[i][1]) <= RAD_DIST && mag(ps[j][0], ps[j][1]) <= RAD_DIST ) {
        continue;
      }
      if ( random(10) < 5.0 ) {
        continue;
      }

      // draw line 
      if ( dist(ps[i][0], ps[i][1], ps[j][0], ps[j][1]) < RAD_DIST * 2 ) {
        strokeWeight((random(10) < 9.0)? random(0.8, 1.2) : random(4.2, 5.0));
        stroke(random(200, 240), random(200, 255), random(0, 30), random(120, 200));  // color = yellow
        line(ps[i][0], ps[i][1], ps[j][0], ps[j][1]);
      }
    }
  }

  return ;
}


void drawPlanets() {
  
  noStroke();
  for ( int i = 0; i < ps.length; i++ ) {
    fill(random(200, 255), random(100, 160), random(0, 40));  // color = orange
    circle(ps[i][0], ps[i][1], 2*random(5, 17));
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("033.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
