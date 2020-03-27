/* 098_20200327 */

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(ADD);
  strokeWeight(1.0);
  stroke(255, 0, 0);
}


void draw() {
  background(55, 5, 5);
  translate(width/2, height/2);

  float t = 0;
  for ( float r = 0; r < 550; r += 10 ) {
    drawRecCircle(r*cos(t), r*sin(t), map(r, 0, 550, 10, 135), 0);
    t += PI / 7;
  }
}


void drawRecCircle(float x, float y, float r, int recLevel) {

  float dr, t, dx, dy;

  if ( recLevel >= 7 ) {
    return ;
  }

  fill(random(180, 255), random(0, 50), random(0, 50), 35);
  circle(x, y, 2*r);

  dr = random(r/4, r/2);
  t = random(-PI, PI);
  dx = dr * cos(t);
  dy = dr * sin(t);

  drawRecCircle(x+dx, y+dy, r-dr, recLevel+1);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("098.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
