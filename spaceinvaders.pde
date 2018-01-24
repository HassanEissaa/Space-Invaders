PImage playerimage,galaxy,heart,enemy1,speedy,rock,bossimage,shotgun,rocket,space,dualenemy;
Player player;
Room room;
ArrayList<Rocks> rocks;//////////////test
InGame ingame;
Boss bos;
ArrayList<Bullets> playerBullet;
ArrayList<Explosion> explosion = new ArrayList<Explosion>();
ArrayList<Rockets> rockets;
Game game;
ArrayList<Items> health;/////////////////////////////////////////////test
ArrayList<Enemybullet> enemybullet;
ArrayList<Bossbullet> bossbullet;
int time1=0,leveltimer;
char mouse;
ArrayList<Enemy> enemylist;
void setup(){

size(960,640);


speedy=loadImage("speed.png");rock=loadImage("rock.png");space=loadImage("space.jpg");
playerimage=loadImage("player.png");rocket=loadImage("rocket.png");
shotgun=loadImage("shotgun.png");dualenemy=loadImage("dualenemy.png");
player=new Player();bossimage=loadImage("boss.png");
enemy1=loadImage("enemy.png");
galaxy=loadImage("tile.png");
heart=loadImage("heart.png");
room=new Room();
ingame=new InGame();
playerBullet= new ArrayList<Bullets>();
enemybullet= new ArrayList<Enemybullet>();
enemylist=new ArrayList<Enemy>();
health=new ArrayList<Items>();///////////////////////////////////////////////////test
rocks=new ArrayList<Rocks>();///////////////////
bossbullet=new ArrayList<Bossbullet>(); 
bos=new Boss();
game=new Game();
rockets=new ArrayList<Rockets>();
                            health.add(new Health(500,500));
////////////////////////////////////
     



//game.gameplay();

}


void draw(){
background(space);
ingame.isdead();
//room.display();
player.display();
player.update();
player.pickup();
player.displayHealthBar();
for(int i=0;i<playerBullet.size();i++){
playerBullet.get(i).displayBullet();
playerBullet.get(i).update();

}
for(int i=0;i<playerBullet.size();i++){
if(playerBullet.size()!=0){
playerBullet.get(i).oob();

if(playerBullet.get(i).oob() || playerBullet.get(i).damage()){playerBullet.remove(i);}
}

}
/////////////////////////////////////////////////////////////////
game.setCurrentmessage("hey how are you");
//println(millis()+" "+leveltimer);
//println(game.level);
game.message();
for(int i=0;i<enemylist.size();i++){  
enemylist.get(i).display();
enemylist.get(i).update();
enemylist.get(i).shootatplayer();
enemylist.get(i).walkingtoplayer();
enemylist.get(i).displayHealthBar();

}


//////////////////////////////////////////////////////////////////////////////////////////////
/*
if(!bos.isdead()){        

bos.display();
bos.update();
bos.shootatplayer();
bos.walkingtoplayer();
bos.displayHealthBar();

}
*/
////trial
                       println(health.size());     
  for(int j=0;j<health.size();j++){
  health.get(j).display();////////////////////////////////////////test
}
for(int i=0;i<rockets.size();i++){
    rockets.get(i).displayBullet();
        rockets.get(i).update();
                rockets.get(i).damage();





}
////////////////////////////////////////////

//println(player.speed);
time1++;

////////////////////////////////////////////////////////////////


 //   rocks.add(new Rocks(500,0));
   // rocks.add(new Rocks(600,0));
    //rocks.add(new Rocks(700,0));
    //rocks.add(new Rocks(800,0));
    //rocks.add(new Rocks(900,0));
     //rocks.add(new Rocks(400,0));
    //rocks.add(new Rocks(300,0));
    //rocks.add(new Rocks(1000,0));
   // rocks.add(new Rocks(1200,0));
/*
if(time1==200){
       rocks.add(new Rocks(600,0));
    rocks.add(new Rocks(700,0));
    rocks.add(new Rocks(800,0));
    rocks.add(new Rocks(900,0));
     rocks.add(new Rocks(400,0));
    rocks.add(new Rocks(300,0));
    rocks.add(new Rocks(1000,0));
    rocks.add(new Rocks(1200,0));
        rocks.add(new Rocks(1100,0));

}

if(time1==400){

  
    rocks.add(new Rocks(500,0));
    rocks.add(new Rocks(600,0));
    rocks.add(new Rocks(700,0));
    rocks.add(new Rocks(800,0));
    rocks.add(new Rocks(900,0));
     rocks.add(new Rocks(400,0));
    rocks.add(new Rocks(300,0));
    //rocks.add(new Rocks(1000,0));
    rocks.add(new Rocks(1200,0));
        rocks.add(new Rocks(1100,0));




}
if(time1==600){

  
    rocks.add(new Rocks(500,0));
    rocks.add(new Rocks(600,0));
    rocks.add(new Rocks(700,0));
  //  rocks.add(new Rocks(800,0));
    rocks.add(new Rocks(900,0));
     rocks.add(new Rocks(400,0));
    rocks.add(new Rocks(300,0));
    rocks.add(new Rocks(1000,0));
    rocks.add(new Rocks(1200,0));
    rocks.add(new Rocks(1100,0));







}*/



for(int i=0;i<rocks.size();i++){
rocks.get(i).display();
rocks.get(i).update();
rocks.get(i).damage();


}

}
void keyPressed(){
    player.movement(key,true);









}
void keyReleased(){
player.movement(key,false);
    




}
void mousePressed(){

  if(mouseButton==LEFT && player.canShoot ){
        player.shootingTimer = millis();
        player.isShooting = true;
  playerBullet.add(new Bullets(player.x,player.y,mouseX,mouseY));

  }
  if(mouseButton==RIGHT){rockets.add(new Rockets(-200,1000,mouseX,mouseY));}
}