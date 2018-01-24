class Explosion{

 PImage[] explosionImages = {
   loadImage("tank_explosion1.png"),
   loadImage("tank_explosion2.png"),
   loadImage("tank_explosion3.png"),
   loadImage("tank_explosion4.png") };
 float x,y;
 static final float  TOTAL_ANIMATION_TIME=1;
 float  startTime;
 
 
 Explosion( float initX,float initY){
 startTime=millis()/1000f;
 x=initX;
 y=initY;
 
 }
 void drawExplosion(){
 
 float currentTime=millis()/1000f;
 float frameTime=TOTAL_ANIMATION_TIME/explosionImages.length;
 float timeDiff=currentTime-startTime;
 int currentFrame=floor(timeDiff/frameTime);
 imageMode(CENTER);
 image(explosionImages[currentFrame],x,y);
 
 
 
 
 
 
 
 
 
 
 }
 
 
 
 boolean shouldRemove(){
 float currentTime=millis()/1000f;
 return currentTime>=startTime+TOTAL_ANIMATION_TIME;
 
 }










}