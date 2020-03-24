/* 097_20200324 */

Circle[] c;

void setup() {
  size(1000, 1000);
  frameRate(10);
  blendMode(LIGHTEST);
  noFill();
  initCircles();
}


void initCircles() {

  c = new Circle[8];
  for ( int i = 0; i < c.length; i++ ) {
    c[i] = new Circle();
  }

  return ;
}


void draw() {
  background(10, 0, 40);  
  for ( int i = 0; i < c.length; i++ ) {
    c[i].drop();
    c[i].update();
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("097.png"); 
    System.exit(0);
  } else if ( key == 'r' ) {
    initCircles();
  }
}
