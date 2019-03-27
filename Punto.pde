class Punto{
  
  int posX;
  int posY;
  
  Punto(int puntoX,int puntoY){
     posX = puntoX;
     posY = puntoY;
  }
  
  public int getPosX(){
     return posX; 
  }
  
  public int getPosY(){
     return posY; 
  }
  
  public void setPos(int pX,int pY){
     posX = pX;
     posY = pY;
  }
  
}
