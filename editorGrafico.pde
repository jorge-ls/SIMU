import javax.swing.JColorChooser;
import javax.swing.JFileChooser;
import javax.swing.filechooser.FileNameExtensionFilter;
import java.awt.Color;

JColorChooser paleta;
Lienzo lienzo;
Panel panel;
Boton btnLapiz,btnElipse,btnRect,btnTriangle,btnFill,btnStroke,btnRubber,btnSave,btnOpen,btnText,btnBN,btnUmbral;
Boton btnInvert,btnSatur,btnRestore,btnNew;
static int opcion = -1;
PImage imgBorrador;
PImage imgSelected;
int anchBoton = 60;
int altBoton = 60;
float x1 = 700;
float x2= 700;
float grosor = 1;
float alfa = 0;


void setup(){
    background(255);
    size(1000,600);
    btnNew = new Boton(0,0,anchBoton,altBoton,"Nuevo","new.png");
    btnLapiz = new Boton(anchBoton,0,anchBoton,altBoton,"Lapiz","pencil.png");
    btnElipse = new Boton(anchBoton*2,0,anchBoton,altBoton,"Elipse","elipse.png");
    btnRect = new Boton(anchBoton*3,0,anchBoton,altBoton,"Rectangulo","rectangulo.png");
    btnTriangle = new Boton(anchBoton*4,0,anchBoton,altBoton,"Triangulo","triangle.png");
    btnFill = new Boton(anchBoton*5,0,anchBoton,altBoton,"FillColor","fill2.png");
    btnStroke = new Boton(anchBoton*6,0,anchBoton,altBoton,"StrokeColor","stroke.png");
    btnRubber = new Boton(anchBoton*7,0,anchBoton,altBoton,"Rubber","rubber.png");
    btnSave = new Boton(anchBoton*8,0,anchBoton,altBoton,"Save","save.png");
    btnOpen = new Boton(anchBoton*9,0,anchBoton,altBoton,"Open","openFile.png");
    btnText = new Boton(0,altBoton,anchBoton,altBoton,"Texto","text.png");
    btnRestore = new Boton(anchBoton,altBoton,anchBoton,altBoton,"Restaurar","restore.png");
    btnBN = new Boton(anchBoton*2,altBoton,anchBoton,altBoton,"BlancoNegro","blancoNegro.png");
    btnUmbral = new Boton(anchBoton*3,altBoton,anchBoton,altBoton,"Umbral","threshold.png");
    btnInvert = new Boton(anchBoton*4,altBoton,anchBoton,altBoton,"Negativo","invert.png");
    btnSatur = new Boton(anchBoton*5,altBoton,anchBoton,altBoton,"Saturacion","satur.png");
    
    
    //Se dibuja el lienzo 
    lienzo = new Lienzo(0,height/5,width,height-height/5);
    lienzo.display();
    
    
}

void draw(){
    //background(255);
    stroke(0);
    strokeWeight(1);
    Panel panel = new Panel(0,0,width,height/5);
    panel.display();
   
    paleta = new JColorChooser();
    btnNew.display();
    btnLapiz.display();
    btnElipse.display();
    btnRect.display();
    btnTriangle.display();
    btnFill.display();
    btnStroke.display();
    btnRubber.display();
    btnSave.display();
    btnOpen.display();
    btnText.display();
    btnBN.display();
    btnUmbral.display();
    btnInvert.display();
    btnSatur.display();
    btnRestore.display();
    //Se dibujan los scrollbars
    strokeWeight(3);
    line(700,50,900,50);
    line(700,80,900,80);
    x1 = constrain(x1,700,900);
    x2 = constrain(x2,700,900);
    fill(0);
    rect(x1,45,10,10);
    rect(x2,75,10,10);
    text("Transparencia: ",610,50);
    text("Grosor: ",610,80);
}

boolean isDentroLienzo(){
   return mouseY >= height/5; 
}


void mouseDragged(){
    if (mouseX >= 700 && mouseY >=40 && mouseY <=60){
       x1+= mouseX - pmouseX; 
       alfa = map(x1,700,900,0,255);
    }
    else if (mouseX >= 700 && mouseY>=70 && mouseY <=90){
       x2+= mouseX - pmouseX; 
       grosor = map(x2,700,900,1,10);
    }
    else {
        lienzo.mouseDragged();  
    }
    
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
        //borrador.display(mouseX,mouseY);
     //}
   }
}


void checkCursor(){
   if (editorGrafico.opcion == 4){
      cursor(ARROW); 
   }
}

void mouseClicked(){
    if (btnLapiz.isDentroBoton()){
        print("Boton lapiz seleccionado\n");
        checkCursor();
        editorGrafico.opcion = 0; //Opcion lapiz
    }
    else if (btnElipse.isDentroBoton()){
        print("Elipse Seleccionado\n");
        checkCursor();
        editorGrafico.opcion = 1; //Opción elipse
    }
    else if (btnRect.isDentroBoton()){
        checkCursor();
        print("Rectangulo Seleccionado\n");
        editorGrafico.opcion = 2; //opcion rectangulo 
    }
    else if (btnTriangle.isDentroBoton()){
        checkCursor();
        print("Triangulo Seleccionado\n");
        editorGrafico.opcion = 3; //Opcion triangulo
    }
    else if (btnFill.isDentroBoton()){
       checkCursor(); 
       Color selectedFill = JColorChooser.showDialog(null,"Paleta de colores",Color.white);
       lienzo.setFillColor(selectedFill);
    }
    else if (btnStroke.isDentroBoton()){
       checkCursor();
       Color selectedStroke = JColorChooser.showDialog(null,"Paleta de colores",Color.white);
       lienzo.setStrokeColor(selectedStroke);
    }
    else if (btnRubber.isDentroBoton()){
      //if (editorGrafico.opcion != 4 ){
         print("Entra borrador");
         editorGrafico.opcion = 4; //Opcion borrar
         PImage imgBorrador = loadImage("borrador.png");
         cursor(imgBorrador,10,10);
      //}
    }
    else if (btnSave.isDentroBoton()){
         checkCursor();
         editorGrafico.opcion = 5;
         //loadPixels();
         lienzo.saveImagen();
    }
    else if (btnOpen.isDentroBoton()){
         checkCursor();
         //selectInput("Selecciona un fichero para abrir","file");
         JFileChooser fileChooser = new JFileChooser();
         fileChooser.showOpenDialog(null);
         //if (seleccion == JFileChooser.APROVE_OPTION){
         File fichero = fileChooser.getSelectedFile();
         //}
         if (fichero == null){
            println("No se ha seleccionado ningun fichero"); 
         }
         else{
             String fileName = fichero.getName();
             imgSelected = loadImage(fileName); 
             image(imgSelected,0,height/5,width,height-height/5);
         }
     }
      else if (btnText.isDentroBoton()){
          checkCursor();
          println("Opcion editar texto");
          editorGrafico.opcion = 6; //Opcion texto
      }
      else if (btnRestore.isDentroBoton()){
          checkCursor();
          if (imgSelected != null){
              image(imgSelected,0,height/5,width,height-height/5);
          }
          
      }
      else if (btnNew.isDentroBoton()){
            lienzo = new Lienzo(0,height/5,width,height-height/5);
            lienzo.display();
      }
      else if (btnBN.isDentroBoton()){
          checkCursor();
          loadPixels();
          for (int i=0;i< pixels.length; i++){
              color c = pixels[i];
              pixels[i] = color(red(c)*0.3+green(c)*0.59+blue(c)*0.11);
          }
          updatePixels();
      }
      else if (btnUmbral.isDentroBoton()){
           checkCursor();
           filter(THRESHOLD,0.7);
      }
      else if (btnInvert.isDentroBoton()){
           checkCursor();
           filter(INVERT);
      }
      else if (btnSatur.isDentroBoton()){
          checkCursor();
          colorMode(HSB);
          loadPixels();
          for (int i=0;i< pixels.length; i++){
              float b = brightness(pixels[i]);
              float s = saturation(pixels[i]);
              float h = hue(pixels[i]);
              pixels[i] = color(h,s*2,b);
          }
          updatePixels();
      }
  }
    

     
