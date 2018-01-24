class Boss extends Enemy {
  Boss() {



    damage=10;
    currhealth=20;
    dead=false;
    x=height/2;
    y=width/2;
    diameter=100;
  }


  Boss(float h, PImage boss) {
    diameter=100;
      currhealth=h;
      
    damage=10;
    currhealth=20;
    fullhealth=20;
    dead=false;
    x=height/2;
    y=width/2;

enemy=boss;
  }
  void display() {

    pushMatrix();
    translate(x, y);
    rotate(angle);
    imageMode(CENTER);
    image(bossimage, 0, 0);
    popMatrix();
  }
  
   public void displayHealthBar() {
    rectMode(CORNER);
    fill(255);
    stroke(0);
    rect(x, y-10, 15, 5);
    noStroke();
    fill(255, 0, 0);
    rect(x, y-10, currhealth*15/fullhealth, 5);
  }
 void  walkingtoplayer(){}
  
 
  void shootatplayer() {
    waittoshoot=40;
    if (timer>=waittoshoot) {

      bossbullet.add(new Bossbullet(x, y, player.x, player.y));
      timer=int((random(0, waittoshoot-1)));
    }
    for (int i=0; i<bossbullet.size(); i++) {
      bossbullet.get(i).displayBullet();
      bossbullet.get(i).update();
      if (bossbullet.get(i).oob() || bossbullet.get(i).damage()) {
        bossbullet.remove(i);
      }
    }
  } 
}