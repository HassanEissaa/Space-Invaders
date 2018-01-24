class Rocks extends Visible{

  
PVector position,velocity;

Rocks(){
  diameter=50;
  damage=10;
  //osition=new PVector( 500, 500);
 // velocity=new PVector(-2,2);

 // position=new PVector( x, y);
  //velocity=new PVector(-2,2);
  

}
Rocks(float xx,float yy){

x=xx;
y=yy;
  position=new PVector( x, y);
  velocity=new PVector(-4,4);



}


void display(){
image(rock,position.x,position.y,50,50);

}
void update(){ 

position.add(velocity);
}

void damage(){    
  
  for(int i=0;i<rocks.size();i++){
    
   float distance=distance(rocks.get(i).position.x,rocks.get(i).position.y,player.x,player.y);
          if(distance<=player.diameter+diameter){
                 explosion.add(new Explosion(player.x,player.y));
              player.hitdamage(damage);
              rocks.remove(i);
          
          
          }



  }




}

}