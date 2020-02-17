/* 022_20190515 */

final int LAYER = 25;
final int DIVNUM = 130;
final float AMP_NOISE = 0.3;

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(ADD);
}


void draw() {
  background(30);
  translate(width/2, height/2);
  for ( int i = LAYER; i > 0; i-- ) {
    drawFigure(i*15);
  }
}


void drawFigure(float amp) {

  noStroke();
  fill(random(255), random(255), random(255), 8+amp*0.075);
  
  beginShape();
  for ( float theta = 0; theta < TWO_PI; theta += TWO_PI/DIVNUM ) {
    float r = amp + random(-amp*AMP_NOISE, amp*AMP_NOISE); 
    curveVertex(r*cos(theta), r*sin(theta));
    if ( theta == 0 || theta + TWO_PI/DIVNUM == TWO_PI ) {
      curveVertex(r*cos(theta), r*sin(theta));
    }
  }
  endShape(CLOSE);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("022.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
