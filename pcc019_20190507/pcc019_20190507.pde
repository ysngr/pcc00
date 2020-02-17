/* 019_20190507 */

final int VERT_LEN = 80;
final int MAX_LEVEL = 5;
final float[] getAngleByLevel = {PI/36, PI/20, PI/18, PI/12, PI/5, PI/2.3};
final float[] startPoint = {0, 0};


void setup() {
  size(1000, 1000);
  noLoop();
  blendMode(ADD);
}


void draw() {
  background(30);
  translate(width/2, height/2);
  
  for ( int i = 0; i < 30; i++ ) {
    float scale = random(0.5, 1.5);
    color treeCol = color(random(255), random(255), random(255), random(128, 255));
    pushMatrix();
    translate(random(-500, 500), random(-500, 500));
    scale(scale);
    drawRecTree(MAX_LEVEL, startPoint, treeCol);
    scale(1/scale);
    popMatrix();
  }
}


void drawRecTree(int level, float[] p, color treeCol) {

  fill(treeCol, 80);
  ellipse(p[0], p[1], level*5, level*5);

  if ( level < 0 ) {
    return ;
  }

  float[][] next_px = drawVertexes(level, p, treeCol);
  drawRecTree(level-1, next_px[0], treeCol);
  drawRecTree(level-1, next_px[1], treeCol);

  return ;
}


float[][] drawVertexes(int level, float[] p, color treeCol) {

  float angle = getAngleByLevel[level];

  float[][] next_ps = {
    {p[0] + (VERT_LEN+level*8) * cos(angle) , p[1] + (VERT_LEN+level*8) * sin(angle) }, 
    {p[0] + (VERT_LEN+level*8) * cos(-angle), p[1] + (VERT_LEN+level*8) * sin(-angle)}
  };

  stroke(treeCol, 180);
  strokeWeight(level+0.5);
  line(p[0], p[1], next_ps[0][0], next_ps[0][1]);  
  line(p[0], p[1], next_ps[1][0], next_ps[1][1]);

  return next_ps;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("019.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
