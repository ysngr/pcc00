/* 020_20190512 */

float start_x, start_y, end_x, end_y, rand_r;

void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(SCREEN);
}


void draw() {
  background(0);
  drawGrid();
  drawWorld();
}


void drawGrid() {

  final int GRIDNUM = 20;

  float sx, sy, ex, ey;

  strokeWeight(1);
  stroke(128, 128, 128);

  sx = 0;
  sy = 0;
  ex = 0;
  ey = 0;
  for ( int i = 0; i < GRIDNUM; i++ ) {
    line(sx, sy, ex, ey);
    sy += height / GRIDNUM;
    ex += width / GRIDNUM;
  }
  for ( int i = 0; i < GRIDNUM; i++ ) {
    line(sx, sy, ex, ey);
    sx += width / GRIDNUM;
    ey += height / GRIDNUM;
  }

  sx = 0;
  sy = height;
  ex = 0;
  ey = height;
  for ( int i = 0; i < GRIDNUM; i++ ) {
    line(sx, sy, ex, ey);
    sy -= height / GRIDNUM;
    ex += width / GRIDNUM;
  }
  for ( int i = 0; i < GRIDNUM; i++ ) {
    line(sx, sy, ex, ey);
    sx += width / GRIDNUM;
    ey -= height / GRIDNUM;
  }

  return ;
}


void drawWorld() {

  for ( int i = 0; i < 1000; i++ ) {
    setValues();
    float dx = end_x - start_x;
    float dy = end_y - start_y;
    color col = color(random(0, 255), random(0, 255), random(0, 255));
    
    // draw scratch
    strokeWeight(random(0.25, 1.2));
    stroke(col, random(150, 200));
    noFill();
    bezier(
      start_x                           , start_y                           , 
      start_x + dx/4 + random(-100, 100), start_y + dy/4 + random(-100, 100), 
      end_x -dx/4 + random(-100, 100)   , end_y - dy/4 + random(-100, 100)  , 
      end_x                             , end_y
    );
    
    // draw firework
    noStroke();
    fill(col, random(20, 40));
    ellipse(start_x, start_y, rand_r, rand_r);
    ellipse(end_x, end_y, rand_r, rand_r);
  }

  return ;
}


void setValues() {

  start_x = random(0, width);
  end_x = random(0, width);
  if (start_x < end_x ) {
    float temp = start_x;
    start_x = end_x;
    end_x = temp;
  }

  start_y = random(0, height);
  end_y = random(0, height);
  if (start_y < end_y ) {
    float temp = start_y;
    start_y = end_y;
    end_y = temp;
  }

  rand_r = random(30, 150);

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("020.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
