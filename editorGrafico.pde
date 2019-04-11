import javax.swing.JColorChooser;
import javax.swing.JFileChooser;
import javax.swing.filechooser.FileNameExtensionFilter;
import java.awt.Color;

JColorChooser paleta;
Lienzo lienzo;
Panel panel;
Boton btnLapiz,btnElipse,btnRect,btnTriangle,btnFill,btnStroke,btnRubber,btnSave,btnOpen,btnText,btnBN,btnUmbral;
Boton btnInvert,btnSatur,btnRestore,btnNew,btnTint,btnPixel;
ArrayList<Boton> listaBtn;
static int opcion = -1;
File fichero;
PImage imgBorrador;
PImage imgSelected;
PFont f;
int anchBoton = 60;
int altBoton = 60;
float x1 = 700;
float x2= 700;
String typing = "";
float grosor = 1;
float alfa = 0;


void setup(){
    background(255);
    size(1000,600);
    listaBtn = new ArrayList<Boton>();
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
    lienzo = new Lienzo(0,height/5,width,(height-height/5));
    //lienzo.display();
    f = createFont("Arial",16,true);
    textFont(f,16);
}

void draw(){
    //background(255);
    stroke(0);
    strokeWeight(1);
    Panel panel = new Panel(0,0,width,height/5);
    panel.display();
    int indent = width/2;
    paleta = new JColorChooser();
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

boolean isDentroLienzo(){
   return mouseY >= height/5; 
}


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

void keyPressed(){
    // Si se pulsa return key se salva el string y se borra
    
      // En otro caso se concatena el caracter tecleado
      typing = typing + key; 
}

void mousePressed(){
   lienzo.mousePressed(); 
}

void mouseReleased(){
   if (editorGrafico.opcion == 4){
      cursor(imgBorrador,10,10);
   }
   lienzo.mouseReleased(); 
}



void checkCursor(){
   if (editorGrafico.opcion == 4){
      cursor(ARROW); 
   }
}

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
       if (selectedFill != null){
           lienzo.setFillColor(selectedFill);  
       }
       
    }
    else if (btnStroke.isDentroBoton()){
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
    else if (btnSave.isDentroBoton()){
         checkCursor();
         editorGrafico.opcion = 5;
         //loadPixels();
         lienzo.saveImagen();
    }
    else if (btnOpen.isDentroBoton()){
         checkCursor();
         //selectInput("Selecciona un fichero para abrir","file");
         abrirFichero();
     }
      else if (btnText.isDentroBoton()){
          checkCursor();
          typing = "";
          println("Opcion editar texto");
          editorGrafico.opcion = 6; //Opcion texto
          
      }
      else if (btnRestore.isDentroBoton()){
          checkCursor();
          if (imgSelected != null){
              lienzo.limpiarLienzo();
              image(imgSelected,5,(height/5)+5);
          }
          
      }
      else if (btnNew.isDentroBoton()){
            checkCursor();
            typing = "";
            lienzo.limpiarLienzo();
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
           //image(imgSelected,5,(height/5)+5);
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
      else if (btnTint.isDentroBoton()){
        checkCursor();
        lienzo.limpiarLienzo();
        Color selectedColor = JColorChooser.showDialog(null,"Paleta de colores",Color.white);
        if (selectedColor != null){
            tint(selectedColor.getRGB());
            if (imgSelected != null){
                image(imgSelected,0,height/5);  
            }
             
        }
      }
      else if (btnPixel.isDentroBoton()){
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
         
      }
    

} 
