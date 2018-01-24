public class Enemy extends InGame {
  ArrayList<Bullets> bullet;
  PImage enemy;
  float spawn;
  float waittoshoot=random(200,250), timer, timer2, waittowalk=100;
  float distanceX, distanceY, mindistance=250, measureddistance;
  float shoottime;
  Enemy() {
    damage=5;
    currhealth=20;
    dead=false;
    spawn=random(0,100);
    if(spawn<50){
    x=random(-200,-100);
    y=random(width);}
    if(spawn>50){x=random(height);y=random(1000,1500);        }
    fullhealth=20;
        enemy=enemy1;

  }
  Enemy(float h, PImage image) {


    enemy=image;

    currhealth=h;
  }

  void display() {

    pushMatrix();
    translate(x, y);
    rotate(angle);
    imageMode(CENTER);
    image(enemy, 0, 0);
    popMatrix();
  }

  void shootatplayer() {
    if (timer>=waittoshoot) {

      enemybullet.add(new Enemybullet(x, y, player.x+(random(-2, 2)/10), player.y));
      timer=int((random(0, waittoshoot-1)));
    }
    for (int i=0; i<enemybullet.size(); i++) {
      enemybullet.get(i).displayBullet();
      enemybullet.get(i).update();
      if (enemybullet.get(i).oob() || enemybullet.get(i).damage()) {
        enemybullet.remove(i);
      }
    }
  }
  void update() {
    timer++;
    timer2++;

    angle=atan2(player.y-y, player.x-x);
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
  void walkingtoplayer() {


    measureddistance=distance(x, y, player.x, player.y);
    {

        if (measureddistance>mindistance) {

          distanceX=(player.x-x)*speed/distance(x, y, player.x, player.y);
          distanceY=(player.y-y)*speed/distance(x, y, player.x, player.y);


          x+=distanceX/5;
          y+=distanceY/5;
          timer2=int((random(0, waittowalk-1)));
        } else {
          distanceY=0;
          distanceX=0;
        }
      }
    
  }
}
////////////////////////////////////////////////////////////////////////
public class dualbulletenemy extends Enemy {

  dualbulletenemy() {
    damage=5;
    currhealth=20;
    fullhealth=20;
    dead=false;
    x=random(-200,-100);
    y=random(width);
    diameter=60;
        enemy=dualenemy;

  }
  dualbulletenemy(float h, PImage image) {


    enemy=dualenemy;

    currhealth=h;
  }

  void shootatplayer() {
    if (timer>=waittoshoot) {

      enemybullet.add(new Enemybullet(x+20, y+20, player.x, player.y));
      enemybullet.add(new Enemybullet(x-20, y-20, player.x, player.y));
      timer=int((random(0, waittoshoot-1)));
    }
    for (int i=0; i<enemybullet.size(); i++) {
      enemybullet.get(i).displayBullet();
      enemybullet.get(i).update();
      if (enemybullet.get(i).oob() || enemybullet.get(i).damage()) {
        enemybullet.remove(i);
      }
    }
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
}
///////////////////////////////////////////////////////////////////////////
public class burstshotenemy extends Enemy{
      
  
  
  burstshotenemy(){
  
     damage=5;
    currhealth=20;
    dead=false;
    x=random(-200,-100);
    y=random(width);
      enemy=shotgun;

  
  
  }

  burstshotenemy(float h, PImage image) {
    
    enemy=shotgun;
    currhealth=h;

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
void shootatplayer() {
    if (timer>=waittoshoot) {
      for(int i=0;i<5;i++){
      enemybullet.add(new Enemybullet(x, y, player.x, player.y));
      timer=int((random(0, waittoshoot-1)));
    }
    }
    for (int i=0; i<enemybullet.size(); i++) {
      enemybullet.get(i).displayBullet();
      enemybullet.get(i).update();
      if (enemybullet.get(i).oob() || enemybullet.get(i).damage()) {
        enemybullet.remove(i);
      }
    }
  }












}