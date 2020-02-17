/* 027_20190603 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(ADD);
  noStroke();
}


void draw() {

  background(0);
  translate(width/2, height/2);

  float[][] triP = new float[3][2];
  float radius, theta;

  for ( int i = 0; i < 2300; i++ ) {
    radius = random(60, 480);
    theta = random(-PI, PI);

    triP[0][0] = radius * cos(theta);
    triP[0][1] = radius * sin(theta);
    triP[1][0] = triP[0][0] + random(-70, 70);
    triP[1][1] = triP[0][1] + random(-70, 70);
    triP[2][0] = triP[0][0] + random(-70, 70);
    triP[2][1] = triP[0][1] + random(-70, 70);

    fill(random(0, 128), random(100, 200), random(128, 255), random(60, 80));  // color = blue
    triangle(triP[0][0], triP[0][1], triP[1][0], triP[1][1], triP[2][0], triP[2][1]);
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("027.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
