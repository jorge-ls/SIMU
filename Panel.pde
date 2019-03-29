class Panel{
  
  float posX,posY,anchura,altura;
  
  
  Panel(float panelX,float panelY,float anchPanel,float altPanel){
      posX = panelX;
      posY = panelY;
      anchura = anchPanel;
      altura = altPanel;
  }
  
  void display(){
      fill(#5D92E5);
      rect(posX,posY,anchura,altura);
      
  }
  
  
  
}
    
   
  
  
  
