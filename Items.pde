public class Items extends Visible{
      PImage item;
      int timer;
      
    Items(float initx,float inity ){
          
          x=initx;
          y=inity;
          
    
    
    
    }
    void display(){}

}

public class Health extends Items{
  float recover=fullhealth/5;
  Health(float initx ,float inity){
        super(initx,inity);
      
  
  }
  void use(){
              player.currhealth+=recover;
              
               if(player.currhealth>player.fullhealth){
                  player.currhealth=player.fullhealth;
              
           }
 }
void display(){
       image(heart,x,y);
}
}
public class Speed extends Items{
      

Speed(float initx ,float inity){
      super(initx,inity);
}
void use(){
  
     player.speed=10;

     
         
     
     
 
 
 
 //player.speed=5;

}

void display(){

       image(speedy,x,y);
}
void timereset(){ timer=millis();}


}