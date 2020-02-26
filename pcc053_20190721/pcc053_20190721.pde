/* 053_20190721 */

void setup() {
  size(1000, 750);
  noLoop();
  blendMode(SUBTRACT);
}


void draw() {
  background(255);

  final float MIN_R = 45, MAX_R = 80;

  float r_vert = random(MIN_R, MAX_R);
  float r_horz = random(MIN_R, MAX_R);
  color col;
  int colorIndex = (int)random(7);

  for ( float h = 0; h < height; h += 35 ) {
    col = selectColor(colorIndex++);
    for ( float w = -MIN_R; w < width; w += random(10, 30) ) {
      stroke(random(255), random(255), random(255), 20);
      fill(col, 15);
      rect(w + random(-5, 5), h + random(-10, 10), r_vert, r_horz);
    }
  }
}


color selectColor(int colIdx) {
  
  color c;

  switch( colIdx % 7 ){
    case 0 :  // red
      c = color(random(230, 255), random(0, 20), random(0, 20));
      break;
    case 1 :  // orange
      c = color(random(230, 255), random(120, 220), random(0, 20));
      break;
    case 2 :  // yellow
      c = color(random(230, 255), random(180, 240), random(0, 20));
      break;
    case 3 :  // green
      c = color(random(0, 20), random(230, 255), random(0, 20));
      break;
    case 4 :  // blue
      c = color(random(0, 20), random(120, 180), random(230, 255));
      break;
    case 5 :  // indigo 
      c = color(random(0, 20), random(0, 20), random(240, 255));
      break;
    case 6 :  // purple
      c = color(random(170, 220), random(0, 20), random(230, 255));
      break;
    default :
      c = color(0, 0, 0);  // dummy
  }

  return c;
}


float sgn(float seed) {
  return (random(seed) >= seed/2)? 1.0 : -1.0;
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("053.png");
    System.exit(0);
  } else if ( key == 'r' ) {
    redraw();
  }
}
