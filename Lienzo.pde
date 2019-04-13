import java.awt.Color;

class Lienzo{
  
 Punto puntoOrigen,puntoFinal; //Puntos para dibujar las figuras geometricas
 int elipseX,elipseY,recX,recY,triX,triY; //Valores de las elipses,rectangulos y triangulos dibujados
 Color selectedFill; //Color de relleno seleccionado
 Color selectedStroke; // Color de trazo seleccionado
 boolean dragged = false; //Booleano que comprueba si esta dibujando un triangulo
 
 
  /**
  *  Constructor de la clase Lienzo
  **/
  Lienzo(){
    selectedFill = Color.white;
    selectedStroke = Color.black;
    
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
   
  //Limpia el lienzo
  void limpiarLienzo(){
    loadPixels();
    for (int i= width * ((height/5)+1);i< pixels.length;i++){
        pixels[i] = color(255);
    }
    updatePixels();
    
  }
  
 // Se crea el punto origen de la figura geometrica a dibujar
  
 void mousePressed(){
      //println("Entra mouse pressed");
      puntoOrigen = new Punto(mouseX,mouseY);
      loadPixels();
  }
  
 
  //Se implementan las distintas opciones que requieren el "arrastre" del raton
 
 void mouseDragged(){
     //Se traza una linea
     if (editorGrafico.opcion == 0){
       if (isDentroLienzo()){
           stroke(selectedStroke.getRGB());
           strokeWeight(grosor);
           line(mouseX,mouseY,pmouseX,pmouseY);  
       }
        
     }
     //Se establece el tamaño de la elipse
     else if (editorGrafico.opcion == 1){
        puntoFinal = new Punto(mouseX,mouseY);
        elipseX = puntoFinal.getPosX() - puntoOrigen.getPosX();
        elipseY = puntoFinal.getPosY() - puntoOrigen.getPosY();
        //println("PuntoFinal.x: "+elipseX);
        //println("PuntoFinal.y: "+elipseY);
     }
     //Se establece el tamaño del rectangulo
     else if (editorGrafico.opcion == 2){
        puntoFinal = new Punto(mouseX,mouseY);
        recX = puntoFinal.getPosX() - puntoOrigen.getPosX();
        recY = puntoFinal.getPosY() - puntoOrigen.getPosY();
        
     }
     //Se establece el punto final del triangulo
     else if (editorGrafico.opcion == 3){
        puntoFinal = new Punto(mouseX,mouseY);
        triX = puntoFinal.getPosX();
        triY = puntoFinal.getPosY();
        dragged = true;
     }
     //Accion del borrador
     else if (editorGrafico.opcion == 4){
         fill(255);
         strokeWeight(10);
         stroke(255);
         line(mouseX,mouseY,pmouseX,pmouseY);  
     }
  }
  
    //Se tratan las distintas opciones que requieren que se suelte el boton del raton
    
     void mouseReleased(){
       // Se dibuja la elipse cuando su tamaño ya ha sido establecido
        if (editorGrafico.opcion == 1){
          stroke(selectedStroke.getRGB());
          strokeWeight(grosor);
          fill(selectedFill.getRGB(),255-alfa);
          ellipseMode(CORNER);
          ellipse(puntoOrigen.getPosX(),puntoOrigen.getPosY(),elipseX,elipseY);
          elipseX = 0;
          elipseY = 0;
        }
        //Se dibuja el rectangulo cuando su tamaño ya ha sido establecido
        else if (editorGrafico.opcion == 2){
          stroke(selectedStroke.getRGB());
          strokeWeight(grosor);
          fill(selectedFill.getRGB(),255-alfa);
          rect(puntoOrigen.getPosX(),puntoOrigen.getPosY(),recX,recY);
          recX = 0;
          recY = 0;
        }
        //Se dibuja el triangulo
        else if (editorGrafico.opcion == 3){
          stroke(selectedStroke.getRGB());
          strokeWeight(grosor);
          fill(selectedFill.getRGB(),255-alfa);
          int triY2 = triY-50;
          println("Triangulo final x: ",triX);
          println("Triangulo final y: ",triY);
          if (dragged){
              triangle(puntoOrigen.getPosX(),puntoOrigen.getPosY(),triX,triY,triX,triY2);  
          }
          dragged = false;
          
        }
     
     }
    
}
