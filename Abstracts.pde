public class Visible{

 float x,y,timer,angle,speed=5,currhealth,damage,diameter,fullhealth=100;
 boolean dead;
 

  float distance(float x1,float y1,float x2,float y2){
  
        float d1=x1-x2;
        float d2=y1-y2;
        float ad1=pow(d1,2);
        float ad2=pow(d2,2);
        return sqrt(ad1+ad2);
        
  
  
  
  }
}
  public class InGame extends Visible {
  
    
    boolean isdead(){
    if(currhealth<=0){
        return true;
    
    }
    return false;
    }
    void hitdamage(float dmg){
        if(currhealth>0){
            currhealth-=dmg;
          
        }
        else{
          this.dead=true;
      
    
  }
    
    
    
    
    }
  
  
  
  
  
  }
   
  