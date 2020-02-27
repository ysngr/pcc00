/* 053_20190721 */

void setup() {
  size(1000, 1000);
  noLoop();
  rectMode(CENTER);
  stroke(255, 255, 255, 255);
}


void draw() {
  background(200);

  final float DR = 32.5;

  for ( float h = 0; h <= height; h += DR ) {
    for ( float w = -DR/2; w <= width; w += DR ) {
      if ( (h/DR + (w+DR/2)/DR) % 7 == 0 || (h/DR - ((w+DR/2)/DR)) % 7 == 0 ) {
        pushMatrix();
        translate(w, h);
        rotate(PI/7);
        fill(random(200, 255), random(0, 128), random(150, 200), 255);
        square(0, 0, DR);
        popMatrix();
      } else {
        fill(random(200, 255), random(0, 128), random(150, 200), 80);
        square(w, h, DR);
      }
    }
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("053.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
