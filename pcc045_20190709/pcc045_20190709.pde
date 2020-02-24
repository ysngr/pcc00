/* 045_20190709 */

void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  //background(220);  // red
  background(180);  // blue
  translate(width/2, height/2);

  float theta = 0;
  for ( int i = 0; i < 50; i++ ) {
    drawLeaf(theta);
    theta += random(PI/4);
  }

  for ( int i = 0; i < 50; i++ ) {
    drawCenterCircle(random(30, 45));
  }
}


void drawLeaf(float theta) {

  float minRad = random(0, 20);
  float maxRad = random(450, 500);

  strokeWeight(1);
  stroke(255, 255, 255);
  //fill(random(240, 255), random(60, 100), random(40, 70), 150);  // red
  fill(random(40, 60), random(120, 150), random(200, 240), 150);  // blue

  bezier(
    minRad * cos(theta)                     , minRad * sin(theta)                     , 
    (maxRad/3) * cos(theta-random(PI/4))    , (maxRad/3) * sin(theta-random(PI/4))    , 
    (maxRad/3) * 2 * cos(theta-random(PI/4)), (maxRad/3) * 2 * sin(theta-random(PI/4)), 
    maxRad * cos(theta)                     , maxRad * sin(theta)
  );
  bezier(
    minRad * cos(theta)                     , minRad * sin(theta)                     , 
    (maxRad/3) * cos(theta+random(PI/4))    , (maxRad/3) * sin(theta+random(PI/4))    , 
    (maxRad/3) * 2 * cos(theta+random(PI/4)), (maxRad/3) * 2 * sin(theta+random(PI/4)), 
    maxRad * cos(theta)                     , maxRad * sin(theta)
  );

  return ;
}


void drawCenterCircle(float rad) {

  noStroke();
  fill(random(200, 240), random(200, 220), random(40, 60), 80);
  circle(random(-8, 8), random(-8, 8), rad);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("045.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
