import javax.swing.JColorChooser;
import javax.swing.JFileChooser;
import javax.swing.filechooser.FileNameExtensionFilter;
import java.awt.Color;

JColorChooser paleta;
Lienzo lienzo;
Panel panel;
Borrador borrador;
Boton btnLapiz,btnElipse,btnRect,btnTriangle,btnFill,btnStroke,btnRubber,btnSave,btnOpen;
static int opcion = -1;
PImage imgBorrador;
int anchBoton = 80;
int altBoton = 100;
float x1 = 700;
float x2= 700;
float grosor = 1;
float alfa = 255;


void setup(){
    background(255);
    size(1000,600);
    btnLapiz = new Boton(0,0,anchBoton,height/5,"Lapiz","pencil.png");
    btnElipse = new Boton(anchBoton,0,anchBoton,height/5,"Elipse","elipse.png");
    btnRect = new Boton(anchBoton*2,0,anchBoton,height/5,"Rectangulo","rectangulo.png");
    btnTriangle = new Boton(anchBoton*3,0,anchBoton,height/5,"Triangulo","triangle.png");
    btnFill = new Boton(anchBoton*4,0,anchBoton,height/5,"FillColor","fill2.png");
    btnStroke = new Boton(anchBoton*5,0,anchBoton,height/5,"StrokeColor","stroke.png");
    btnRubber = new Boton(anchBoton*6,0,anchBoton,height/5,"Rubber","rubber.png");
    btnSave = new Boton(anchBoton*7,0,anchBoton,height/5,"Save","save.png");
    btnOpen = new Boton(anchBoton*8,0,anchBoton,height/5,"Open","openFile.png");
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
    btnLapiz.display();
    btnElipse.display();
    btnRect.display();
    btnTriangle.display();
    btnFill.display();
    btnStroke.display();
    btnRubber.display();
    btnSave.display();
    btnOpen.display();
    //Se dibujan los scrollbars
    strokeWeight(3);
    line(700,50,900,50);
    line(700,80,900,80);
    x1 = constrain(x1,700,900);
    x2 = constrain(x2,700,900);
    fill(0);
    rect(x1,45,10,10);
    rect(x2,75,10,10);
    text("Transparencia: ",650,50);
    text("Grosor: ",650,80);
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
             PImage imgSelected = loadImage(fileName); 
             image(imgSelected,0,height/5,width,height-height/5);
         }
         
         
  }
    
}
     
