/* 050_20190714 */

float[][][] points;

void setup() {
  size(1000, 1000);
  noLoop();
}


void draw() {
  background(255);
  initPoints();
  drawTriangles();
}


void initPoints() {

  final int W_STEP = 100, H_STEP = 100;
  final float MAX_NOISE = 20.0;

  points = new float[(int)((width+W_STEP+W_STEP/2)/W_STEP)+1][(int)((height+H_STEP+H_STEP/2)/H_STEP)+1][2];
  for ( int h_idx = 0, h = -(int)(H_STEP/2); h < height+H_STEP; h_idx++, h += H_STEP ) {
    for ( int w_idx = 0, w = -(int)(W_STEP/2); w < width+W_STEP; w_idx++, w += W_STEP ) {
      points[h_idx][w_idx][0] = w + sgn(w_idx, h_idx) * MAX_NOISE * noise(h_idx+w_idx);
      points[h_idx][w_idx][1] = h + sgn(w_idx, h_idx) * MAX_NOISE * noise(h_idx+w_idx);
    }
  }

  return ;
}


float sgn(float seed1, float seed2) {
  if ( random(seed1 + seed2) >= (seed1 + seed2) / 2 ) {
    return 1.0;
  } else {
    return -1.0;
  }
}


void drawTriangles() {

  strokeWeight(2);
  stroke(255);
  
  for ( int i = 0; i < points.length; i++ ) {
    for ( int j = 0; j < points[i].length-1; j++ ) {
      fill(random(30, 120), random(150, 220), random(200, 255));
      if ( i < points.length-1 ) {
        triangle(points[i][j][0], points[i][j][1], points[i][j+1][0], points[i][j+1][1], points[i+1][j][0], points[i+1][j][1]);
      }
      if ( i > 0 ) {
        triangle(points[i][j][0], points[i][j][1], points[i][j+1][0], points[i][j+1][1], points[i-1][j+1][0], points[i-1][j+1][1]);
      }
    }
  }
  
  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("050.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
