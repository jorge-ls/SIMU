import java.awt.Color;

class Lienzo{
  
 float posX,posY;
 float anchura,altura;
 Punto puntoOrigen,puntoFinal;
 int elipseX,elipseY,recX,recY,triX,triY;
 Color selectedFill;
 Color selectedStroke;
 String typing = "";
 String saved = "";
 
  Lienzo(float posicionX,float posicionY,float ancLienzo,float altLienzo){
    posX = posicionX;
    posY = posicionY;
    anchura = ancLienzo;
    altura = altLienzo;
    selectedFill = Color.white;
    selectedStroke = Color.black;
    
  }
  
  
  void setTam(float anchura,float altura){
       this.anchura = anchura;
       this.altura = altura;
  }
  
  
  //Se selecciona el color de relleno
  
  void setFillColor(Color selectColor){
      println("Se ha seleccionado un color");
      this.selectedFill = selectColor;
  }
  
  //Se selecciona el color del trazo
  
  void setStrokeColor(Color selectedColor){
     this.selectedStroke = selectedColor; 
  }
  
  //Devuelve el color de relleno seleccionado
  
  Color getFillColor(){
     return selectedFill; 
  }
  
  //Devuleve el color de trazo seleccionado
  
  Color getStrokeColor(){
     return selectedStroke; 
  }
  
  /*void mouseClicked(){
     
  }*/
  
  //Guarda la imagen 
  void saveImagen(){
      PImage imagen = createImage(width,(height-height/5)-1,RGB);
      loadPixels();
      imagen.loadPixels();
      for (int i= width * ((height/5)+1); i < pixels.length; i++){
         imagen.pixels[i- width * ((height/5)+1)] = pixels[i];     
      }
      imagen.save("saves/imagen.png");
  }
   
  void limpiarLienzo(){
    loadPixels();
    for (int i= width * ((height/5)+1);i< pixels.length;i++){
        pixels[i] = color(255);
    }
    updatePixels();
    
  }
       
  //Escribe texto en el lienzo
  
  
 
  
 void mousePressed(){
      //println("Entra mouse pressed");
      puntoOrigen = new Punto(mouseX,mouseY);
      println("Punto origen x: "+puntoOrigen.getPosX());
      println("Punto origen y: "+puntoOrigen.getPosY());
  }
  
  void mouseMoved(){
     
  }
 
 void mouseDragged(){
     if (editorGrafico.opcion == 0){
       if (isDentroLienzo()){
           stroke(selectedStroke.getRGB());
           strokeWeight(grosor);
           line(mouseX,mouseY,pmouseX,pmouseY);  
       }
        
     }
     else if (editorGrafico.opcion == 1){
        puntoFinal = new Punto(mouseX,mouseY);
        elipseX = puntoFinal.getPosX() - puntoOrigen.getPosX();
        elipseY = puntoFinal.getPosY() - puntoOrigen.getPosY();
        //println("PuntoFinal.x: "+elipseX);
        //println("PuntoFinal.y: "+elipseY);
     }
     else if (editorGrafico.opcion == 2){
        puntoFinal = new Punto(mouseX,mouseY);
        recX = puntoFinal.getPosX() - puntoOrigen.getPosX();
        recY = puntoFinal.getPosY() - puntoOrigen.getPosY();
     }
     else if (editorGrafico.opcion == 3){
        puntoFinal = new Punto(mouseX,mouseY);
        triX = puntoFinal.getPosX();
        triY = puntoFinal.getPosY();
     }
     //Accion del borrador
     else if (editorGrafico.opcion == 4){
         fill(255);
         strokeWeight(10);
         stroke(255);
         line(mouseX,mouseY,pmouseX,pmouseY);  
     }
  }
     void mouseReleased(){
        if (editorGrafico.opcion == 1){
          stroke(selectedStroke.getRGB());
          strokeWeight(grosor);
          fill(selectedFill.getRGB(),255-alfa);
          ellipseMode(CORNER);
          ellipse(puntoOrigen.getPosX(),puntoOrigen.getPosY(),elipseX,elipseY);
          elipseX = 0;
          elipseY = 0;
        }
        else if (editorGrafico.opcion == 2){
          stroke(selectedStroke.getRGB());
          strokeWeight(grosor);
          fill(selectedFill.getRGB(),255-alfa);
          rect(puntoOrigen.getPosX(),puntoOrigen.getPosY(),recX,recY);
          recX = 0;
          recY = 0;
        }
        else if (editorGrafico.opcion == 3){
          stroke(selectedStroke.getRGB());
          strokeWeight(grosor);
          fill(selectedFill.getRGB(),255-alfa);
          int triY2 = triY-50;
          println("Triangulo final x: ",triX);
          println("Triangulo final y: ",triY);
          triangle(puntoOrigen.getPosX(),puntoOrigen.getPosY(),triX,triY,triX,triY2);
          //puntoFinal.setPos(puntoOrigen.getPosX(),puntoOrigen.getPosY());
          //triY2 = puntoFinal.getPosY();
          //puntoOrigen.setPos(0,0);
          //triX = 0;
          //triY = 0;
          //triY2 = 0;
        }
     
     }
    
}
