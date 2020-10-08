int OFFMAX = 450;
float angle = 0;
PImage logo;


void setup() {
  size(900, 800, P3D);
  logo=loadImage("discologo.png");
}

void draw() {
  background(0);

  translate(width/2, height/2);

  stroke(255);

  for (int xo = -OFFMAX; xo <= OFFMAX; xo += 50) {  //loop for the cubes on the x-axis
    for (int yo = -OFFMAX; yo <= OFFMAX; yo += 50) {  //loop for the cubes on the y-axis
      for (int zo = -200; zo <= -25; zo += 50) {  //loop for the cubes on the z-axis
        pushMatrix();  
        translate(xo, yo, zo); //positions the small cubes

        rotateX(frameCount * 0.01);
        rotateY(frameCount * 0.01);
        rotateZ(frameCount * 0.01);
        fill( colorFromOffset(xo), colorFromOffset(yo), colorFromOffset(zo));  //calling the color method below and setting R, G, B colour values based on x,y,z positions


        box((float) (14 + (Math.sin(frameCount / 20.0)) * 20));
        popMatrix();
      }
    }
  }

  rectMode(CENTER);
  fill( random(255), random(255), random(255));
  rect(0, 0, 390, 150);
  image(logo, -180, -62, 360, 125);



  pushMatrix();
  fill( random(255), random(255), random(255));
  stroke(255);
  translate(-310, 0, 0);
  rotateX(radians(angle));
  rotateY(radians(angle));
  sphere(100);

  popMatrix();

  pushMatrix();
  fill( random(255), random(255), random(255));
  stroke(200);
  translate(310, 0, 0);
  rotateX(radians(-angle));
  rotateY(radians(-angle));
  sphere(100);

  popMatrix();
  
  angle = angle + 1;
}


int colorFromOffset(int offset) {

  return (int) ((offset + OFFMAX) / (2.0 * OFFMAX) * 255);  //offset+offmax because we dont want any negative numbers. Divide that by 2*OFFMAX to stay within the range of offset.
}
