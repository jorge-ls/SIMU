import javax.swing.JColorChooser;
import java.awt.Color;

JColorChooser paleta;
Lienzo lienzo;
Panel panel;
Borrador borrador;
Boton btnLapiz,btnElipse,btnRect,btnTriangle,btnFill,btnStroke,btnRubber,btnSave;
static int opcion = -1;
PImage imgBorrador;

void setup(){
    background(255);
    size(1000,600);
    btnLapiz = new Boton(0,0,width/10,height/5,"Lapiz","pencil.png");
    btnElipse = new Boton(width/10,0,width/10,height/5,"Elipse","elipse2.png");
    btnRect = new Boton((width/10)*2,0,width/10,height/5,"Rectangulo","rectangulo.png");
    btnTriangle = new Boton((width/10)*3,0,width/10,height/5,"Triangulo","triangle.png");
    btnFill = new Boton((width/10)*4,0,width/10,height/5,"FillColor","fill2.png");
    btnStroke = new Boton((width/10)*5,0,width/10,height/5,"StrokeColor","stroke.png");
    btnRubber = new Boton((width/10)*6,0,width/10,height/5,"Rubber","rubber.png");
    btnSave = new Boton((width/10)*7,0,width/10,height/5,"Save","save.png");
    //Se dibuja el lienzo 
    lienzo = new Lienzo(0,height/5,width,height-height/5);
    Panel panel = new Panel(0,0,width,height/5);
    panel.display();
    lienzo.display();
    paleta = new JColorChooser();
    btnLapiz.display();
    btnElipse.display();
    btnRect.display();
    btnTriangle.display();
    btnFill.display();
    btnStroke.display();
    btnRubber.display();
    btnSave.display();
}

void draw(){
    //fill(160);
    //rect(0,0,width,height/5);
    //Se dibujan los botones
    //mouseMoved();
    
}

boolean isDentroLienzo(){
   return mouseY >= height/5; 
}


void mouseDragged(){
    lienzo.mouseDragged();
}

void mousePressed(){
   lienzo.mousePressed(); 
}

void mouseReleased(){
   lienzo.mouseReleased(); 
}

void mouseMoved(){
   if (editorGrafico.opcion == 4) {
     //if (borrador.isDentroBorrador()){
        borrador.display(mouseX,mouseY);
     //}
   }
}

void mouseClicked(){
    if (btnLapiz.isDentroBoton()){
        print("Boton lapiz seleccionado\n");
        editorGrafico.opcion = 0; //Opcion lapiz
    }
    else if (btnElipse.isDentroBoton()){
        print("Elipse Seleccionado\n");
        editorGrafico.opcion = 1; //Opción elipse
    }
    else if (btnRect.isDentroBoton()){
        print("Rectangulo Seleccionado\n");
        editorGrafico.opcion = 2; //opcion rectangulo 
    }
    else if (btnTriangle.isDentroBoton()){
        print("Triangulo Seleccionado\n");
        editorGrafico.opcion = 3; //Opcion triangulo
    }
    else if (btnFill.isDentroBoton()){
       Color selectedFill = JColorChooser.showDialog(null,"Paleta de colores",Color.white);
       lienzo.setFillColor(selectedFill);
    }
    else if (btnStroke.isDentroBoton()){
       Color selectedStroke = JColorChooser.showDialog(null,"Paleta de colores",Color.white);
       lienzo.setStrokeColor(selectedStroke);
    }
    else if (btnRubber.isDentroBoton()){
      //if (editorGrafico.opcion != 4 ){
         print("Entra borrador");
         editorGrafico.opcion = 4; //Opcion borrar
         borrador = new Borrador(mouseX,mouseY,50,50);
         borrador.display(mouseX,mouseY);
         //displayBorrador(mouseX,mouseY);
         //mouseMoved();
      //}
    }
    else if (btnSave.isDentroBoton()){
         editorGrafico.opcion = 5;
         //loadPixels();
         
         lienzo.saveImagen();
    }
  }
    

     
