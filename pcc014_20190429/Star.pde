class Star {

  final float MINDIAG = 2.0, MAXDIAG = 7.5;
  final color STAR_YELLOW = color(225, 215, 0);
  final color STAR_WHITE = color(255, 255, 221);

  float x, y, diag;
  color col;


  Star() {
    this.x = random(width);
    this.y = random(height);
    this.diag = random(MINDIAG, MAXDIAG);
    this.col = ( random(0, 2) >= 1 )? STAR_YELLOW : STAR_WHITE;
  }


  void drawStar() {

    noStroke();
    fill(col, 170);
    circle(this.x, this.y, this.diag);

    strokeWeight(0.1);
    stroke(col, 170);
    fill(col, 170);
    pushMatrix();
    translate(this.x, this.y);
    for ( int i = 0; i < 4; i++ ) {
      rotate(PI / 4);
      triangle(0, 1.2*this.diag + random(1), 0.1*this.diag, 0, -0.1*this.diag, 0);
      rotate(PI / 4);
      triangle(0, 1.15*this.diag, this.diag*0.05, 0, -this.diag*0.05, 0);
    }
    for ( int i = 0; i < 8; i++ ) {
      rotate(random(0, PI));
      triangle(0, this.diag + random(0.5), this.diag*0.025, 0, -this.diag*0.025, 0);
    }
    popMatrix();

    return ;
  }
}
