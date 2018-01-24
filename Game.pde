public class Game{

String message;int gameplaytimer=millis()/1000;int time=0;
int level=0;

void setCurrentmessage(String s){

    message=s;




}


void message(){
    fill(#E5977D);
    rect(width-800,height-200,600,100);
    fill(0);

    text(message,170,460);
    

}


void gameplay(){

if(millis()<leveltimer+3000){game.level=1;}
if(3000<millis() && millis()<leveltimer+13000){game.level=2;}
if(13000<millis() && millis()<leveltimer+23000){game.level=3;}
if(23000<millis() && millis()<leveltimer+33000){game.level=4;}

//time++;
//println(time);

        println(level);
        
switch(level){

  case 1:           level1();      break; //println("cse1");  break;

//  case 2:       enemylist.add(new Enemy()); break;
 // case 3:     enemylist.add(new burstshotenemy());break; 

  //case 4:     enemylist.add(new Enemy()); break;

 


}

/*
if(level==1 && level!=2 && level !=3 && level !=4 && level !=5){
   //    enemylist.add(new Enemy());
                 enemylist.add(new dualbulletenemy());

     
 
 println("level 1");
 }
 else if(level!=1 && level==2 && level !=3 && level !=4 && level !=5){ 
     enemylist.add(new dualbulletenemy());
     enemylist.add(new Enemy());
 // println("level 2");
 }
 
 else if(level!=1 && level!=2 && level ==3 && level !=4 && level !=5){ 
     enemylist.add(new dualbulletenemy());
     enemylist.add(new burstshotenemy());
 //     println("level 3");
 }
 
 else if(level!=1 && level!=2 && level !=3 && level ==4 && level !=5){ 
     enemylist.add(new dualbulletenemy());
     enemylist.add(new Enemy());
   ///   println("level 4");
 
 }
 
else  if(level!=1 && level!=2 && level !=3 && level !=4 && level ==5){ 
     enemylist.add(new dualbulletenemy());
     enemylist.add(new burstshotenemy());
   //   println("level 5");
 }

*/

}





void level1(){

enemylist.add(new dualbulletenemy());enemylist.add(new burstshotenemy());
}














}