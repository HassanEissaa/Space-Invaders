class Room{
//////////////////////////////NOT USED THOUGHT GONNA MAKE A TILEMAP
int roomheight=16,roomwidth=21;

PImage tiles[][]=new PImage[roomwidth][roomheight];




Room(){
for(int x=0;x<roomwidth;x++){
    for(int j=0;j<roomheight;j++){
     
       tiles[x][j]=galaxy;
}


}



}
    
    

public void display(){

    for(int x=0;x<roomwidth;x++){
      for(int j=0;j<roomheight;j++){
        image(tiles[x][j],x*64,j*64);
        
    }
    }

}







}