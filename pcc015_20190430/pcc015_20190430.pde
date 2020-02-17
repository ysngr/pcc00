/* 015_20190430 */

float[][] nodes;

void setup() {
  size(1000, 1000);
  noLoop();
  strokeWeight(0.8);
  stroke(255, 255, 255);
}


void draw() {
  background(30);
  initNodes();
  drawWeb();
}



void initNodes() {

  nodes = new float[800][2];

  for ( int i = 0; i < nodes.length; i++ ) {
    nodes[i][0] = random(width);
    nodes[i][1] = random(height);
  }

  return ;
}


void drawWeb() {

  for ( int i = 0; i < nodes.length; i++ ) {
    for ( int j = 0; j < nodes.length; j++ ) {
      if ( dist(nodes[i][0], nodes[i][1], nodes[j][0], nodes[j][1]) <= 80 ) {
        line(nodes[i][0], nodes[i][1], nodes[j][0], nodes[j][1]);
      }
    }
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("015.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
