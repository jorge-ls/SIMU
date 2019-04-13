import javax.swing.JColorChooser;
import javax.swing.JFileChooser;
import static javax.swing.JOptionPane.*;
import javax.swing.filechooser.FileNameExtensionFilter;
import java.awt.Color;

Lienzo lienzo;
Panel panel;
Boton btnLapiz,btnElipse,btnRect,btnTriangle,btnFill,btnStroke,btnRubber,btnSave,btnOpen,btnText,btnBN,btnUmbral; //botones
Boton btnInvert,btnSatur,btnRestore,btnNew,btnTint,btnPixel; //botones
ArrayList<Boton> listaBtn; //lista de botones
static int opcion = -1; //Opcion seleccionada
File fichero;
PImage imgBorrador; //Imagen que se establece en el cursor cuando se selecciona la opcion de borrar
PImage imgSelected; // Imagen seleccionada
PFont f; // Fuente del texto
float x1 = 700; //rango de valores para la transparecia 
float x2= 700; //rango de valores para el grosor
String typing = ""; //String donde se escribe el texto
float grosor = 1; //Valor del grosor del trazo
float alfa = 0; //Transparencia del color de relleno


/**
    Funcion setup : 
              - Se establece a blanco el color de fondo y el tamaño de la ventana
              - Se crean los botones y se añaden a la lista de botones
              - Se establece la fuente para el texto
**/
void setup(){
    background(255);
    size(1000,600);
    listaBtn = new ArrayList<Boton>();
    int anchBoton = 60; //Anchura de cada boton
    int altBoton = 60; // Altura de cada boton
    btnNew = new Boton(0,0,anchBoton,altBoton,"Nuevo","new.png");
    listaBtn.add(btnNew);
    btnLapiz = new Boton(anchBoton,0,anchBoton,altBoton,"Lapiz","pencil.png");
    listaBtn.add(btnLapiz);
    btnElipse = new Boton(anchBoton*2,0,anchBoton,altBoton,"Elipse","elipse.png");
    listaBtn.add(btnElipse);
    btnRect = new Boton(anchBoton*3,0,anchBoton,altBoton,"Rectangulo","rectangulo.png");
    listaBtn.add(btnRect);
    btnTriangle = new Boton(anchBoton*4,0,anchBoton,altBoton,"Triangulo","triangle.png");
    listaBtn.add(btnTriangle);
    btnFill = new Boton(anchBoton*5,0,anchBoton,altBoton,"FillColor","fill2.png");
    listaBtn.add(btnFill);
    btnStroke = new Boton(anchBoton*6,0,anchBoton,altBoton,"StrokeColor","stroke.png");
    listaBtn.add(btnStroke);
    btnRubber = new Boton(anchBoton*7,0,anchBoton,altBoton,"Rubber","rubber.png");
    listaBtn.add(btnRubber);
    btnSave = new Boton(anchBoton*8,0,anchBoton,altBoton,"Save","save.png");
    listaBtn.add(btnSave);
    btnText = new Boton(0,altBoton,anchBoton,altBoton,"Texto","text.png");
    listaBtn.add(btnText);
    btnRestore = new Boton(anchBoton,altBoton,anchBoton,altBoton,"Restaurar","restore.png");
    listaBtn.add(btnRestore);
    btnBN = new Boton(anchBoton*2,altBoton,anchBoton,altBoton,"BlancoNegro","blancoNegro.png");
    listaBtn.add(btnBN);
    btnUmbral = new Boton(anchBoton*3,altBoton,anchBoton,altBoton,"Umbral","threshold.png");
    listaBtn.add(btnUmbral);
    btnInvert = new Boton(anchBoton*4,altBoton,anchBoton,altBoton,"Negativo","invert.png");
    listaBtn.add(btnInvert);
    btnSatur = new Boton(anchBoton*5,altBoton,anchBoton,altBoton,"Saturacion","satur.png");
    listaBtn.add(btnSatur);
    btnTint = new Boton(anchBoton*6,altBoton,anchBoton,altBoton,"Tinte","tinte.png");
    listaBtn.add(btnTint);
    btnPixel = new Boton(anchBoton*7,altBoton,anchBoton,altBoton,"Pixel","pixel.png");
    listaBtn.add(btnPixel);
    btnOpen = new Boton(anchBoton*8,altBoton,anchBoton,altBoton,"Open","openFile.png");
    listaBtn.add(btnOpen);
    //Se dibuja el lienzo 
    lienzo = new Lienzo();
    f = createFont("Arial",16,true);
    textFont(f,16);
}

/**
    Funcion draw:
        - Se dibuja el panel principal
        - Se dibujan los botones
        - Se dibujan los scrollbars que controlan la transparencia del color y el grosor del trazo 
**/

void draw(){
    //background(255);
    stroke(0);
    strokeWeight(1);
    Panel panel = new Panel(0,0,width,height/5);
    panel.display();
    int indent = width/2;
    noTint();
    
    for (int i=0;i< listaBtn.size();i++){
       listaBtn.get(i).display(); 
    }
    //Se dibujan los scrollbars
    strokeWeight(3);
    line(700,50,900,50);
    line(700,80,900,80);
    x1 = constrain(x1,700,900);
    x2 = constrain(x2,700,900);
    fill(0);
    rect(x1,45,10,10);
    rect(x2,75,10,10);
    //f = createFont("Arial",16,true);
    //textFont(f,16);
    text("Transparencia: ",580,50);
    text("Grosor: ",580,80);
    if (editorGrafico.opcion == 6){
      text(typing,indent-100,height/2);
    }
    
}

//Se comprueba si la posicion "y" del raton esta dentro del lienzo
boolean isDentroLienzo(){
   return mouseY >= height/5; 
}

/**
   Funcion de evento de raton 
       - Se comprueba que la posicion del raton esta dentro del limite de los scrollbars y se 
         asignan los valores de grosor y transparencia
       - En otro caso se trazan las lineas y distintas figuras geometricas 
**/
void mouseDragged(){
    if (mouseX >= 700 && mouseY >=40 && mouseY <=60){
       checkCursor();
       x1+= mouseX - pmouseX; 
       alfa = map(x1,700,900,0,255);
    }
    else if (mouseX >= 700 && mouseY>=70 && mouseY <=90){      
       checkCursor();
       x2+= mouseX - pmouseX; 
       grosor = map(x2,700,900,1,10);
    }
    else {
        lienzo.mouseDragged();  
    }
    
}

//Funcion de evento de raton : añade un caracter al texto que se escribe en el lienzo

void keyPressed(){
      typing = typing + key; 
}


//Funcion que trata el evento de raton presionado  

void mousePressed(){
   lienzo.mousePressed(); 
}

//Se establece la imagen del borrador en el cursor (si se selecciona la opcion de borrar) y se tratan otros casos
void mouseReleased(){
   if (editorGrafico.opcion == 4){
      cursor(imgBorrador,10,10);
   }
   lienzo.mouseReleased(); 
}

//Si esta seleccionada la opcion de borrar, reestablece el puntero del raton 

void checkCursor(){
   if (editorGrafico.opcion == 4){
      cursor(ARROW); 
   }
}

//Funcion para seleccionar una imagen y mostrarla en el lienzo

void abrirFichero(){
    
    JFileChooser fileChooser = new JFileChooser();
    fileChooser.showOpenDialog(null);
    //if (seleccion == JFileChooser.APROVE_OPTION){
    fichero = fileChooser.getSelectedFile();
    //}
    if (fichero == null){
        println("No se ha seleccionado ningun fichero"); 
    }
    else{
        lienzo.limpiarLienzo();
        imgSelected = loadImage(fichero.getAbsolutePath()); 
        //image(imgSelected,0,height/5,width,height-height/5);
        image(imgSelected,5,(height/5)+5);
     }
  
}

void showMessageInfo(){
    showMessageDialog(null,"Para aplicar un filtro seleccione previamente una imagen", 
    "Info", INFORMATION_MESSAGE);
}

/**
  Funcion de evento de raton:
      - En esta funcion se comprueba que boton ha sido pulsado y se realiza la accion asociada a ese boton 
**/
void mouseClicked(){
    if (btnLapiz.isDentroBoton()){
        checkCursor();
        editorGrafico.opcion = 0; //Opcion lapiz
    }
    else if (btnElipse.isDentroBoton()){
        checkCursor();
        editorGrafico.opcion = 1; //Opción elipse
    }
    else if (btnRect.isDentroBoton()){
        checkCursor();
        editorGrafico.opcion = 2; //opcion rectangulo 
    }
    else if (btnTriangle.isDentroBoton()){
        checkCursor();
        editorGrafico.opcion = 3; //Opcion triangulo
    }
    else if (btnFill.isDentroBoton()){ //Se establece el color de relleno
       checkCursor(); 
       Color selectedFill = JColorChooser.showDialog(null,"Paleta de colores",Color.white);
       if (selectedFill != null){
           lienzo.setFillColor(selectedFill);  
       }
       
    }
    else if (btnStroke.isDentroBoton()){ //Se establece el color del trazo
       checkCursor();
       Color selectedStroke = JColorChooser.showDialog(null,"Paleta de colores",Color.white);
       if (selectedStroke != null){
           lienzo.setStrokeColor(selectedStroke);  
       }
       
    }
    else if (btnRubber.isDentroBoton()){ 
      //if (editorGrafico.opcion != 4 ){
         print("Entra borrador");
         editorGrafico.opcion = 4; //Opcion borrar
         imgBorrador = loadImage("borrador.png");
         cursor(imgBorrador,10,10);
      //}
    }
    else if (btnSave.isDentroBoton()){ //Opcion de guardar
         checkCursor();
         editorGrafico.opcion = 5;
         //loadPixels();
         lienzo.saveImagen();
         showMessageDialog(null, "Guardado realizado correctamente", 
              "Info", INFORMATION_MESSAGE); 
    }
    else if (btnOpen.isDentroBoton()){ //Opcion de abrir fichero
         checkCursor();
         //selectInput("Selecciona un fichero para abrir","file");
         abrirFichero();
     }
      else if (btnText.isDentroBoton()){ //Opcion de escribir texto
          checkCursor();
          typing = "";
          println("Opcion editar texto");
          editorGrafico.opcion = 6; //Opcion texto
          
      }
      else if (btnRestore.isDentroBoton()){ //Opcion de restaurar una imagen
          checkCursor();
          if (imgSelected != null){
              lienzo.limpiarLienzo();
              image(imgSelected,5,(height/5)+5);
          }
          else{
             showMessageDialog(null, "Para restaurar selecciona previamente una imagen y aplica un filtro ", 
              "Info", INFORMATION_MESSAGE); 
          }
          
      }
      else if (btnNew.isDentroBoton()){ //Opcion de borrar el lienzo completo
            checkCursor();
            typing = "";
            lienzo.limpiarLienzo();
            imgSelected = null;
      }
      else if (btnBN.isDentroBoton()){ //Filtro de blanco y negro
          checkCursor();
          if (imgSelected != null){
              PImage copiaImg = loadImage(fichero.getAbsolutePath());
              copiaImg.loadPixels();
              for (int i=0;i< copiaImg.pixels.length; i++){
                  color c = copiaImg.pixels[i];
                  copiaImg.pixels[i] = color(red(c)*0.3+green(c)*0.59+blue(c)*0.11);
              }
              copiaImg.updatePixels();
              image(copiaImg,5,(height/5)+5);
          }
          else{
             showMessageInfo(); 
          }
          
      }
      else if (btnUmbral.isDentroBoton()){ //Filtro de umbralizacion
           checkCursor();
           if (imgSelected != null){
               PImage copiaImg = loadImage(fichero.getAbsolutePath());
               copiaImg.filter(THRESHOLD,0.7);
               image(copiaImg,5,(height/5)+5);  
           }
           else{
              showMessageInfo();
           }
           
      }
      else if (btnInvert.isDentroBoton()){
           checkCursor();
           if (imgSelected != null){
               PImage copiaImg = loadImage(fichero.getAbsolutePath());
               copiaImg.filter(INVERT);
               image(copiaImg,5,(height/5)+5);  
           }
           else {
             showMessageInfo();
           }
           
           
           //image(imgSelected,5,(height/5)+5);
      }
      else if (btnSatur.isDentroBoton()){ //Filtro de saturacion
          checkCursor();
          if (imgSelected != null){
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
          else{
             showMessageInfo(); 
          }
          
      }
      else if (btnTint.isDentroBoton()){ //Filtro de tinte 
        checkCursor();
        if (imgSelected != null){
            Color selectedColor = JColorChooser.showDialog(null,"Paleta de colores",Color.white);
            if (selectedColor != null){
              tint(selectedColor.getRGB());
            }
            //lienzo.limpiarLienzo();
            image(imgSelected,5,(height/5)+5);  
        }
        else {
           showMessageInfo(); 
        }
             
      }
      
      else if (btnPixel.isDentroBoton()){ //Filtro de pixelacion
         checkCursor();
         if (imgSelected != null){
           stroke(1);
           lienzo.limpiarLienzo();
           int resolution = 50;
           int xInc = imgSelected.width/resolution;
           int yInc = imgSelected.height/resolution;
           for (int x = 5; x< imgSelected.width; x+=xInc ){
              for (int y = (height/5)+5; y< imgSelected.height; y+=yInc ){
                  fill(imgSelected.get(x, y));                   
                  rect(x, y, xInc, yInc);
              }
           }
         }
         else {
            showMessageInfo(); 
         }
         
      }
    

} 
