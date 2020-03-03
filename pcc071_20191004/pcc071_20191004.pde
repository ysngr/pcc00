/* 071_20191004 */

float[][] p;


void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(ADD);  // blue
  //blendMode(BLEND);  // black
  strokeWeight(1.0);
  noFill();
}


void draw() {
  background(30);  // blue
  //background(230);  // black
  translate(width/2, height/2);

  init();
  for ( int i = 0; i < 512; i++ ) {
    drawFigure(); 
    update(i);
  }
}


void init() {

  final float INIT_RAD = 240.0; 

  p = new float[128][2]; 

  float t = 0; 
  for ( int i = 0; i < p.length; i++ ) {
    p[i][0] = INIT_RAD * cos(t); 
    p[i][1] = INIT_RAD * sin(t); 
    t += TWO_PI / p.length;
  }

  return;
}


void drawFigure() {

  stroke(random(0, 40), random(60, 140), random(200, 255), random(10, 15));  // blue
  //stroke(30, 10);  // black

  beginShape(); 
  for ( int i = 0; i < p.length; i++ ) {
    vertex(p[i][0], p[i][1]);
  }
  endShape(CLOSE); 

  return;
}


void update(int seed) {

  final float MAXNOISE = 5.5; 

  for ( int i = 0; i < p.length; i++ ) {
    p[i][0] += rsgn(i) * MAXNOISE * noise(seed); 
    p[i][1] += rsgn(i) * MAXNOISE * noise(seed);
  }

  return;
}


float rsgn(int s) {
  return map(random(-s, s), -s, s, -1, 1);
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("071.png"); 
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
