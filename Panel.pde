class Panel{
  
  float posX,posY,anchura,altura;
  
  
  /**
  * Contructor de la clase Panel
  * @param posX Coordenada x del panel
  * @param posY Coordenada y del panel
  * @param anchura Anchura del panel
  * @param altura Altura del panel 
  *
  **/
  
  Panel(float panelX,float panelY,float anchPanel,float altPanel){
      posX = panelX;
      posY = panelY;
      anchura = anchPanel;
      altura = altPanel;
  }
  
  //Se obtiene la altura del panel
  public float getAltura(){
     return altura; 
  }
  
  //Se obtiene la anchura del panel
  public float getAnchura(){
     return anchura; 
  }
  //Se dibuja el panel
  void display(){
      fill(#5D92E5);
      rect(posX,posY,anchura,altura);
      
  }
  
  
  
}
    
   
  
  
  
