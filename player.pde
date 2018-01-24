public class Player extends InGame{
  float shootingTimer,fireRate;
  boolean movingUp=false,movingDown=false,movingRight=false,movingLeft=false,isShooting=false,canShoot=true;
  Player(){
  
  x=width/2;
  y=height/2;
  dead=false;
  angle=0;
  fullhealth=100;
  speed=5;
  diameter=60;
 damage=10;
 currhealth=100;
   shootingTimer = millis();
  canShoot = true;
    isShooting = false;
  fireRate=500;
  }
  
public void update(){
    if (isShooting) {
      float curTime = millis() - shootingTimer;
      if (curTime < fireRate)
        canShoot = false;
      else {
        canShoot = true;
        shootingTimer = millis();
        isShooting = false;
      }
    }
    angle=atan2(mouseY-y,mouseX-x);  
     y=constrain((y+speed*(int(movingDown)-int(movingUp))),0,height);
     x=constrain((x+speed*(int(movingRight)-int(movingLeft))),0,width);
    

}
 void pickup(){
 
   for(int i=0;i<health.size();i++){
  if(player.x>=health.get(i).x-25 &&player.x<=health.get(i).x+25 && health.get(i).y+25>=player.y &&health.get(i).y-30<=player.y ){
    
        
        
        
        if(health.get(i) instanceof Health){((Health)health.get(i)).use();   }
        if(health.get(i) instanceof Speed){((Speed)health.get(i)).timereset(); ((Speed)health.get(i)).use();  }
        health.remove(i);
   }
   
   }
 
 
 
 
 }
   public void displayHealthBar() {
   
    fill(0);
    fill(255);
    stroke(8);
    rect(5, 20, 140, 10);
    fill(255, 0, 0);
    noStroke();
    if (player.currhealth/player.fullhealth > 0) { //When you die, the red bar completely goes away
      rect(5, 20, player.currhealth/player.fullhealth*140, 10);
    }
    }
  
  
  
  
  
  
public void display(){
if(!player.isdead()){
  
pushMatrix();
translate(x,y);
rotate(angle);
imageMode(CENTER);
image(playerimage,0,0,49,43);
popMatrix();
}
}
void movement(char c,boolean b){
 
if(c=='w'){
  movingUp=b;
 }
 if(c=='s'){
   movingDown=b;
 }
 if(c=='d'){
 
   movingRight=b;
 }
 if(c=='a'){
  
  movingLeft=b;
 }
  
  
  


}
  









}