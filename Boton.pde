class Boton {
  
  float posX,posY;
  float altura;
  float anchura;
  String texto;
  String nombreImg;
  
  /**
  * Contructor de la clase Boton
  * @param pX Coordenada x del boton
  * @param pY Coordenada y del boton
  * @param anchuraBtn Anchura del boton
  * @param alturaBtn Altura del boton
  * @param textoBtn Texto identificador del boton
  * @param nombreImgBtn Nombre de la imagen asociada al boton 
  *
  **/
  
  Boton(float pX,float pY,float anchuraBtn,float alturaBtn,String textoBtn,String nombreImgBtn){
    posX = pX;
    posY = pY;
    altura = alturaBtn;
    anchura = anchuraBtn;
    texto = textoBtn;
    nombreImg = nombreImgBtn;
  }
  
  
  //Funcion que dibuja el boton, si el cursor esta sobre el boton se dibuja con un color diferente
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
  
  //Funcion que comprueba si el cursor esta dentro de los limites establecidos por el boton
  
  boolean isDentroBoton(){
      if (mouseX > posX && mouseX < anchura +posX && mouseY > posY && mouseY < altura + posY){
         return true; 
      }
      return false;
  }
  
  
  
}
