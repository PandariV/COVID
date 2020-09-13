float rotX = -PI/8, rotY = 0;
int total = 0, saved = 0;
PShape guy;
ArrayList<Germ> germs;
boolean safe = false;

void setup() {
  fullScreen(P3D);
  frameRate(50);
  guy = loadShape("guy.obj");
  update();
}

void draw() {
  background(0);
  
  if(total < 5000) {
    total = millis() - saved;
  } else {
    saved += total;
    total = 0;
    update();
  }
  
  if(safe) {
    fill(0, 255, 0);
    text("Wearing mask and social distancing", width/2 - textWidth("Wearing mask and social distancing")/2, height/10);
  } else {
    fill(255, 0, 0);
    text("Not wearing mask or social distancing", width/2 - textWidth("Not wearing mask or social distancing")/2, height/10);
  }
  
  translate(width/2, height/2);
  if(!mousePressed)
    rotY += .001;
  rotateX(rotX);
  rotateY(rotY);
  
  push();
  rotateX(PI/2);
  stroke(255);
  fill(0);
  for(int x = -width/4; x <= width/4; x += width/20) {
    for(int y = -width/4; y <= width/4; y += width/20) {
      rect(x, y, width/20, width/20);
    }
  }
  pop();
  
  textSize(32);
  noStroke();
  
  if(safe) {
    makeDude(-width/5, 0);
    fill(3, 186, 252);
    push();
    translate(-width/5 + 1, -height/5.5, width/100);
    rotateY(PI/2);
    rect(0, 0, width/40, height/45);
    pop();
    makeDude(width/5, 0);
    push();
    translate(width/5 - 1, -height/5.5, width/100);
    rotateY(PI/2);
    rect(0, 0, width/40, height/45);
    pop();
  } else {
    makeDude(-width/10, 0);
    makeDude(width/10, 0);
  }
  
  for(int i = germs.size() - 1; i >= 0; i--) {
    germs.get(i).update();
    germs.get(i).show();
  }
}

void update() {
  safe = !safe;
  if(safe) {
    germs = new ArrayList<Germ>();
    for(int i = 0; i < 10; i++) {
      germs.add(new Germ());
    } 
  } else {
    germs = new ArrayList<Germ>();
    for(int i = 0; i < 100; i++) {
      germs.add(new Germ());
    }
  }
}

void makeDude(float x, float y) {
  push();
  translate(x, y, -width/20);
  rotateY(PI/2);
  rotateZ(PI);
  shape(guy, 0, 0, width/10, height/5);
  pop();
}

void mouseDragged(){
  rotY += (mouseX - pmouseX) * 0.01;
  rotX -= (mouseY - pmouseY) * 0.01;
}
