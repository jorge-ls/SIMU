class Boton {
  
  float posX,posY;
  float altura;
  float anchura;
  String texto;
  String nombreImg;
  
  
  Boton(float pX,float pY,float anchuraBtn,float alturaBtn,String textoBtn,String nombreImgBtn){
    posX = pX;
    posY = pY;
    altura = alturaBtn;
    anchura = anchuraBtn;
    texto = textoBtn;
    nombreImg = nombreImgBtn;
  }
  
  /*void displayEtiqueta(){
     fill(#E7ED48,255);
     rect(posX+anchura/2,posY+altura/2,anchura,20);
  }*/
  
  void display(){
    if (this.isDentroBoton()){
       fill(230);
    }
    else{
      fill(200);  
    }
    
    stroke(0);
    rect(posX,posY,anchura,altura);
    PImage img = loadImage(nombreImg);
    image(img,posX,posY,anchura,altura);
    //Falta por poner el texto
  }
  
 
  boolean isDentroBoton(){
      if (mouseX > posX && mouseX < anchura +posX && mouseY > posY && mouseY < altura + posY){
         //print("Entra true\n");
         return true; 
      }
      //print("Entra false\n");
      return false;
  }
  
  
  
}
