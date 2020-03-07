class Clock {

  final int SECOND = 0, MINUTE = 1, HOUR = 2;

  float x, y, r;
  float frameWeight, centerR;
  float secondHand, minuteHand, hourHand;
  float secondWeight, minuteWeight, hourWeight;
  float secondTheta, minuteTheta, hourTheta;
  float dTheta, zeroAngle;


  Clock(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;

    this.frameWeight = random(1.2, 2.4);
    this.centerR = 0.05 * r;

    this.secondHand = 0.75 * r;
    this.minuteHand = 0.75 * r;
    this.hourHand = 0.50 * r;

    this.secondWeight = random(0.4, 0.75);
    this.minuteWeight = random(0.75, 1.4);
    this.hourWeight = random(1.4, 1.8);

    this.secondTheta = random(0, TWO_PI);
    this.minuteTheta = random(0, TWO_PI);
    this.hourTheta = random(0, TWO_PI);

    this.dTheta = random(0, PI/10);
    this.zeroAngle = random(0, TWO_PI);
  }


  void drawClock() {

    // frame
    strokeWeight(frameWeight);
    stroke(30, 30, 30);
    noFill();
    circle(x, y, 2*r);

    // hands
    strokeWeight(secondWeight);
    line(x, y, x + secondHand*cos(secondTheta), y + secondHand*sin(secondTheta));
    strokeWeight(minuteWeight);
    line(x, y, x + minuteHand*cos(minuteTheta), y + minuteHand*sin(minuteTheta));
    strokeWeight(hourWeight);
    line(x, y, x + hourHand*cos(hourTheta), y + hourHand*sin(hourTheta));

    // center point
    noStroke();
    fill(0, 0, 0);
    circle(x, y, centerR);

    return ;
  }


  public void update() {

    // second
    if ( (secondTheta = secondTheta + dTheta) >= TWO_PI ) {
      secondTheta %= TWO_PI;
      // minute
      if ( (minuteTheta = minuteTheta + dTheta) >= TWO_PI ) {
        minuteTheta %= TWO_PI;
        // hour
        hourTheta = (hourTheta + dTheta) % TWO_PI;
      }
    }

    return ;
  }
}
