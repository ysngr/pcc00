/* 081_20200221 */

ArrayList<Clock> cs;


void setup() {
  size(1000, 1000);
  frameRate(1);
  init();
}


void init() {

  cs = new ArrayList<Clock>();
  divArea(0, width, 0, height);

  return ;
}


void divArea(float wl, float wr, float hu, float hl) {

  final float MIN_AREA_R = 50.0, MAX_AREA_R = 250.0;

  float areaSize = wr - wl;

  if ( (wr - wl < MIN_AREA_R && wr - wl < MAX_AREA_R) || random(10) < 3 ) {
    cs.add(new Clock((wl + wr) / 2, (hu + hl) / 2, areaSize/2));
    return ;
  }

  divArea(wl, wl + areaSize/2, hu, hu + areaSize/2);  // upper left
  divArea(wr - areaSize/2, wr, hu, hu + areaSize/2);  // upper right
  divArea(wl, wl + areaSize/2, hl - areaSize/2, hl);  // lower left
  divArea(wr - areaSize/2, wr, hl - areaSize/2, hl);  // lower right

  return ;
}


void draw() {
  background(240);
  for ( int i = 0; i < cs.size(); i++ ) {
    cs.get(i).drawClock();
  }
  for ( int i = 0; i < cs.size(); i++ ) {
    cs.get(i).update();
  }
}



void keyPressed() {
  if ( key == 's' ) {
    saveFrame("081.png");
    System.exit(0);
  }
}
