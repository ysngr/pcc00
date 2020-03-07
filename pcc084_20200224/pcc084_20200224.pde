/* 084_20200224 */

void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  background(220);
  translate(width/2, height/2);

  for ( int i = 0; i < 35; i++ ) {
    rotate(random(-PI, PI));
    pushMatrix();
    translate(random(-width/2, width/2), random(-height/2, height/2));
    drawCircle();
    popMatrix();
  }

  for ( int i = 0; i < 20; i++ ) {
    rotate(random(-PI/8, PI/8));
    drawWave();
  }
}


void drawCircle() {

  strokeWeight(random(1.0, 2.8));
  stroke(random(40, 80), random(160, 230), random(80, 140));

  int divnum = (int)random(32, 64);
  float r = random(5, 20);
  float nw = random(3, 50);

  for ( float t = 0; t < 3*TWO_PI; t += TWO_PI/divnum ) {
    point((r + nw*noise(t))* cos(t), (r + nw*noise(t)) * sin(t));
  }

  return ;
}


void drawWave() {

  strokeWeight(random(1.2, 2.2));
  stroke(random(0, 80), random(100, 160), random(0, 40));

  int divnum = (int)random(32, 128);
  float amp = random(30, 100);
  float nw = random(3, 8);
  float dy = random(-height/8, height/8);

  float t = 0;
  for ( int x = -width; x < width; x += random(8) ) {
    for ( int i = 0; i < 3; i++ ) {
      point(x + noise(x), (amp + nw*noise(t)) * sin(t) + dy + noise(x));
    }
    t += TWO_PI / divnum;
  }


  return;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("084.png"); 
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
