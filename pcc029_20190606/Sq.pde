class Sq {

  float rad;
  float theta;
  float sqsize;
  float strokeWeight;
  color col;
  //float alpha;


  Sq() {
    initSq();
  }


  private void initSq() {

    rad = random(5, 25);
    theta = random(-PI, PI);
    sqsize = random(10, 30);
    strokeWeight = random(1.2, 2.5);
    col = color(random(128, 255), random(0, 128), random(0, 128));  // color = red
    //alpha = random(230, 255);

    return ;
  }


  public void drawSquare() {

    strokeWeight(strokeWeight);
    stroke(col);
    //stroke(col, alpha);
    square(rad*cos(theta), rad*sin(theta), sqsize);

    return ;
  }


  public void updateSquare() {

    rad += 10.0;
    theta += PI / 64;
    sqsize += 3.0;
    //alpha -= 3.0;

    return ;
  }


  public void reconstruct() {

    initSq();

    return ;
  }
}
