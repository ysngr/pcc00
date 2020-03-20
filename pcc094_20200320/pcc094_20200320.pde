/* 094_20200320 */

void setup() {
  size(1170, 800);
  noLoop();
  blendMode(LIGHTEST);
  stroke(200, 235, 250, 25);
  noFill();
}


void draw() {
  background(0, 20, 60);

  for ( int i = 0; i < 7; i++ ) {
    noiseSeed((long)i);
    drop();
  }
}


void drop() {

  float r, t;
  float rotdir;

  pushMatrix();
  translate(random(width), random(height));  

  r = random(4, 10);
  rotdir = ( random(2) < 1 )? 1.0 : -1.0;

  for ( int i = 0; i < 380; i++ ) {
    strokeWeight(random(2.0));

    beginShape();
    for ( t = 0; t < TWO_PI; t += PI/32 ) {
      vertex(r*cos(t)*noise(t), r*sin(t)*noise(t));
    }
    endShape();

    r += random(2.8) * noise(r);
    rotate(rotdir*PI/1024);
  }

  popMatrix();

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("094.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
