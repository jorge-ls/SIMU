class Borrador{
  
   int posX,posY; 
   int anchura,altura;
   
   
   Borrador(int posX,int posY,int anchura,int altura){
      this.posX = posX;
      this.posY = posY;
      this.anchura = anchura;
      this.altura = altura;
   }
  
  void display(int posX,int posY){
     fill(255);
     strokeWeight(5);
     rect(posX,posY,anchura,altura);
     //PImage imgBorrador = loadImage("borrador.png");
     //image(imgBorrador,posX,posY,anchura,altura);
  }
  
  boolean isDentroBorrador(){
       println("Entra dentro borrador");
       if (mouseX > posX && mouseX < anchura +posX && mouseY > posY && mouseY < posY + altura){
         println("Entra true");
         return true; 
      }
      //print("Entra false\n");
      return false;
  
  }
  
  
}
