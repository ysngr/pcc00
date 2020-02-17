/* 001_20190411 */

void setup() {
  size(1000, 1000);
  blendMode(ADD);
  frameRate(15);
  noStroke();
}


void draw() {

  background(0);
  translate(500, 500);
  
  drawCircles( 300,   0,  70, 30,  70,  5, 15);
  drawCircles(1000,  10, 300, 60, 120,  5, 20);
  drawCircles( 500, 250, 450, 60, 120, 20, 30);
  drawCircles( 250, 300, 450, 40, 100, 30, 40);
}



void drawCircles(int cirnum, float r_min, float r_max, float alpha_min, float alpha_max, float cir_min, float cir_max){
  
  float r, theta;
 
  for ( int i = 0; i < cirnum; i++ ) {
    r = random(r_min, r_max);
    theta = random(-PI, PI);
    fill(random(200, 255), random(150, 240), random(0, 100), random(alpha_min, alpha_max));  // color = yellow
    circle(r*cos(theta), r*sin(theta), random(cir_min, cir_max));
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("001.png");
    System.exit(0);
  }
}
