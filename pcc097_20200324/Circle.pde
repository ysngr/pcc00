class Circle {

  float x, y, initr, maxr, dr;
  color c;


  Circle() {
    this.init();
  }


  void init() {

    this.x = random(width);
    this.y = random(height);
    this.initRads();
    this.c = color(random(255), random(255), random(255));
    this.dr = random(0.6, 2.5);

    return ;
  }


  void initRads() {

    this.initr = random(5, 20);
    this.maxr = random(100, 600);

    return ;
  }


  void drop() {

    for ( float r = initr; r < maxr; r *= 1.07 ) {
      strokeWeight(map(r, initr, maxr, 0.5, 15));
      stroke(c, map(r, initr, maxr, 255, 20));
      circle(x, y, 2*r);
    }

    return ;
  }


  void update() {

    this.initr += dr;
    this.maxr += dr/2;

    if ( this.initr > 300 ) {
      this.init();
    }

    return ;
  }
}
