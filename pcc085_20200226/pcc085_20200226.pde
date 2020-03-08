/* 085_20200226 */

float r, t;
float dr, dt;
color c;


void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  background(240);
  translate(random(width), random(height));
  
  init();
  for ( int i = 0; i < 15000; i++ ) {
    if ( mag(r*cos(t), r*sin(t)) > 250 || random(100) < 0.1 ) {
      translate(r*cos(t), r*sin(t));
      init();
    } else {
      r += dr;
      t += dt;
      stroke(c);
      point(r*cos(t), r*sin(t));
    }
  }
}


void init() {

  r = 0;
  t = 0;
  dr = random(0.8);
  dt = random(-PI/64, PI/64);
  c = color(random(200, 255), random(0, 120), random(100, 200));
  strokeWeight(random(1.2, 2.5));

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("085.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
