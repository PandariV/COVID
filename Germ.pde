class Germ {
  float x, y, z, xspeed, yspeed, zspeed;
  
  Germ() {
    x = safe ? width/2 - width/5 : width/2 - width/10;
    y = random(height/4, height/3);
    xspeed = random(10, 25);
    yspeed = random(1, 5);
    zspeed = random(-3, 3);
  }
  
  void update() {
    x += xspeed;
    y += yspeed;
    z += zspeed;
    yspeed += .1;
    xspeed -= .05;
    
    if(safe) {
      if(x >= width/2 + width/5 || y >= height/2) {
        xspeed = 0;
        yspeed = 0;
        zspeed = 0;
      }
    } else {
      if(x >= width/2 + width/10 || y >= height/2) {
        xspeed = 0;
        yspeed = 0;
        zspeed = 0;
      }
    }
  }
  
  void show() {
    push();
    translate(-width/2, -height/2);
    translate(x, y, z);
    fill(19, 235, 105);
    sphere(width/200);
    pop();
  }
}
