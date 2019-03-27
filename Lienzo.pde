import java.awt.Color;

class Lienzo{
  
 float posX,posY;
 float anchura,altura;
 Punto puntoOrigen,puntoFinal;
 int elipseX,elipseY,recX,recY,triX,triY;
 Color selectedFill;
 Color selectedStroke;
 
  Lienzo(float posicionX,float posicionY,float ancLienzo,float altLienzo){
    posX = posicionX;
    posY = posicionY;
    anchura = ancLienzo;
    altura = altLienzo;
    selectedFill = Color.white;
    selectedStroke = Color.black;
    
  }
  
  void display(){
     fill(255);
     rect(posX,posY,anchura,altura);
     
  }
  
  void setTam(float anchura,float altura){
       this.anchura = anchura;
       this.altura = altura;
  }
  void run(){
    lienzo.display();
  }
  
  //Se selecciona el color de relleno
  
  void setFillColor(Color selectColor){
      this.selectedFill = selectColor;
  }
  
  //Se selecciona el color del trazo
  
  void setStrokeColor(Color selectedColor){
     this.selectedStroke = selectedColor; 
  }
  
  /*void mouseClicked(){
     
  }*/
  
  //Guarda la imagen 
  void saveImagen(){
     save("saves/imagen.png"); 
  }
  
 void mousePressed(){
      puntoOrigen = new Punto(mouseX,mouseY);
      //mouseDragged();
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
        print("Punto final x: "+puntoFinal.getPosX()+"\n");
         print("Punto final y: "+puntoFinal.getPosY()+"\n");
        elipseX = puntoFinal.getPosX() - puntoOrigen.getPosX();
        elipseY = puntoFinal.getPosY() - puntoOrigen.getPosY();
        
        /*stroke(0);
        noFill();
        ellipseMode(CORNER);
        ellipse(puntoOrigen.getPosX(),puntoOrigen.getPosY(),elipseX,elipseY);*/
     }
     else if (editorGrafico.opcion == 2){
        puntoFinal = new Punto(mouseX,mouseY);
        recX = puntoFinal.getPosX() - puntoOrigen.getPosX();
        recY = puntoFinal.getPosY() - puntoOrigen.getPosY();
     
        /*stroke(0);
        noFill();
        rect(puntoOrigen.getPosX(),puntoOrigen.getPosY(),recX,recY);*/
     }
     /*else if (editorGrafico.opcion == 3){
        puntoFinal = new Punto(mouseX,mouseY);
        triX = puntoFinal.getPosX();
        triY = puntoFinal.getPosY();
      }*/
      //else if ()
       
     }
     void mouseReleased(){
        if (editorGrafico.opcion == 1){
          stroke(selectedStroke.getRGB());
          strokeWeight(grosor);
          fill(selectedFill.getRGB(),255-alfa);
          ellipseMode(CORNER);
          ellipse(puntoOrigen.getPosX(),puntoOrigen.getPosY(),elipseX,elipseY);

        }
        else if (editorGrafico.opcion == 2){
          stroke(selectedStroke.getRGB());
          strokeWeight(grosor);
          fill(selectedFill.getRGB(),255-alfa);
          rect(puntoOrigen.getPosX(),puntoOrigen.getPosY(),recX,recY);
          
        }
     }
     
 
  }
  
  
  
