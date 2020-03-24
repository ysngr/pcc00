/* 096_20200324 */

final int PIECEX = 20, PIECEY = 20;

void setup() {
  size(1000, 1000);
  noLoop();
  strokeWeight(1.2);
  stroke(255);
}


void draw() {
  final float DW = width / PIECEX, DH = height / PIECEY;
  
  image(loadImage("lena.png"), 0, 0);

  for ( float h = DH; h < height; h += DH ) {
    drawHorizontalLine(h);
  }
  for ( float w = DW; w < width; w += DW ) {
    drawVerticalLine(w);
  }
}


void drawHorizontalLine(float h) {

  final float DT = PI / 64;

  float pieceWidth = width / PIECEX;
  float r;

  for ( float w = 0; w < width; w += pieceWidth ) {
    r = random(pieceWidth/12, pieceWidth/6);

    line(w, h, w+pieceWidth/2-r, h);

    if ( random(2) < 1 ) {
      for ( float t = PI; t >= 0; t -= DT ) {
        point(w + pieceWidth/2 + r*cos(t), h + r*sin(t));
      }
    } else {
      for ( float t = -PI; t < 0; t += DT ) {
        point(w + pieceWidth/2 + r*cos(t), h + r*sin(t));
      }
    }

    line(w+pieceWidth/2+r, h, w+pieceWidth, h);
  }

  return ;
}


void drawVerticalLine(float w) {

  final float DT = PI / 64;

  float pieceHeight = height / PIECEY;
  float r;

  for ( float h = 0; h < height; h += pieceHeight ) {
    r = random(pieceHeight/12, pieceHeight/6);

    line(w, h, w, h+pieceHeight/2-r);

    if ( random(2) < 1 ) {
      for ( float t = PI/2; t >= -PI/2; t -= DT ) {
        point(w + r*cos(t), h + pieceHeight/2 + r*sin(t));
      }
    } else {
      for ( float t = PI/2; t < PI*3/2; t += DT ) {
        point(w + r*cos(t), h + pieceHeight/2 + r*sin(t));
      }
    }

    line(w, h+pieceHeight/2+r, w, h+pieceHeight);
  }

  return ;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("096.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
