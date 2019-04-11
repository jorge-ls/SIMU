class Punto{
  
  int posX;
  int posY;
  
   /**
  * Contructor de la clase Punto
  * @param posX Coordenada x del punto
  * @param posY Coordenada y del punto
  *
  **/
  
  Punto(int posX,int posY){
     this.posX = posX;
     this.posY = posY;
  }
  
  //Se obtiene la posicion x del punto
  public int getPosX(){
     return posX; 
  }
  //Se obtiene la posicion y del punto
  public int getPosY(){
     return posY; 
  }
  
  //Se establece la posicion del punto
  public void setPos(int pX,int pY){
     posX = pX;
     posY = pY;
  }
  
}
