public class Bullets extends Visible{
float sy,sx,diameter=5;
float difx,dify,dif1,dif2;

  Bullets(float initx,float inity,float intx,float inty){
        
    x=initx;
    y=inity;
    speed=10;
    sx=intx;
    sy=inty;
    difx=((sx-x)*speed/distance(x,y,sx,sy))+(random(-2, 2)/10);
    dify=((sy-y)*speed/distance(x,y,sx,sy))+(random(-2, 2)/10);

 
 
 
}

  void displayBullet(){
       fill(0); 
      ellipse(x,y,diameter,diameter);

  }
   void update(){
   
   x+=difx;
   y+=dify;

   
   }
   boolean oob(){
   
   if (x<0 || x>1280 || y<0 || y>960){
       return true;  
     
     
   }
   return false;
     }
     
boolean damage(){
  //damage=10;
  for(int i=0;i<playerBullet.size();i++){
          Bullets enbuk=playerBullet.get(i);

           float distance2=distance(enbuk.x,enbuk.y,bos.x,bos.y);

      for(int j=0;j<enemylist.size();j++){
  
  
     Enemy enem=enemylist.get(j);
     
   float distance=distance(enbuk.x,enbuk.y,enem.x,enem.y);
    float droper=random(100);
 
        if(distance<= player.diameter/2+enbuk.diameter/2){
            enem.hitdamage(enem.damage);  //problem
            return true;
           // playerBullet.remove(i);        
        
        }
        if(enem.isdead()){
            enemylist.remove(i);
                        if(droper<50){
                            health.add(new Health(enem.x,enem.y));
                        }
        
        }
  }
  

        if(distance2<= player.diameter/2+bos.diameter/2){
            bos.hitdamage(bos.damage);  //problem
            return true;
           // playerBullet.remove(i);        
        
        }  }
  return false;
}
}

public class Enemybullet extends Bullets{

Enemybullet(float initx,float inity,float intx,float inty){
      super(initx,inity,intx,inty);

}
boolean damage(){
  damage=10;   //the damage done by the plane 
  for(int i=0;i<enemybullet.size();i++){
  
      Enemybullet enbuk=enemybullet.get(i);
  
 
   float distance=distance(enbuk.x,enbuk.y,player.x,player.y);
        if(distance<= player.diameter/2+enbuk.diameter/2){
            player.hitdamage(damage);                     //problem
            return true;
        
        }
      
  }
  return false;
}

   void update(){
   
   x+=difx;
   y+=dify;

   
   }


}
public class Bossbullet extends Bullets{
Bossbullet(float initx,float inity,float intx,float inty){
      super(initx,inity,intx,inty);

}

  void displayBullet(){
       fill(0); 
      ellipse(x,y,diameter,diameter);

  }

boolean damage(){
  damage=10;   //the damage done by the plane 
  
  
  for(int i=0;i<explosion.size();i++){
      if(explosion.get(i).shouldRemove()){
        explosion.remove(i);
        i--;
        
      }
      else{
      explosion.get(i).drawExplosion();
  
      }
  }
  for(int i=0;i<bossbullet.size();i++){
  
      Bossbullet enbuk=bossbullet.get(i);
  
 
   float distance=distance(enbuk.x,enbuk.y,player.x,player.y);
        if(distance<= player.diameter/2+enbuk.diameter/2){
            explosion.add(new Explosion(player.x,player.y));

            player.hitdamage(damage);    //problem

            return true;
        }
      
  }
  return false;
}





}
////////////////////////////////////////////////////////////////////////
public class Rockets extends Bullets{
      Rockets(float initx,float inity,float intx,float inty){
       
            super(initx,inity,intx,inty);
            
    difx=((sx-x)*speed/distance(x,y,sx,sy));
    dify=((sy-y)*speed/distance(x,y,sx,sy));
      }




  void displayBullet(){
     diameter=20;
        angle=atan2(difx, dify);

       fill(0); 
    pushMatrix();
    translate(x, y);
    rotate(angle);
    imageMode(CENTER);
    image(rocket, 0, 0);
    popMatrix();
  }

     
boolean damage(){
  //damage=10;
  for(int i=0;i<rockets.size();i++){
          Rockets enbuk=rockets.get(i);

           float distance2=distance(enbuk.x,enbuk.y,bos.x,bos.y);

      for(int j=0;j<enemylist.size();j++){
  
  
     Enemy enem=enemylist.get(j);
     
   float distance=distance(enbuk.x,enbuk.y,enem.x,enem.y);

 
        if(distance<= player.diameter/2+enbuk.diameter/2){
            enem.hitdamage(enem.damage);  //problem
                        rockets.remove(i);        

            return true;
        
        }
        if(enem.isdead()){
            enemylist.remove(i);
        }
  }
  

        if(distance2<= player.diameter/2+bos.diameter/2){
            bos.hitdamage(bos.damage);  //problem
                        rockets.remove(i);        

            return true;
        
        }  }
  return false;
}


}