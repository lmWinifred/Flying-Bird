//file is a first year student project, thus the code includes a very detailed comment section in German.
//name: fliegender_vogel_vs2
//content: flying bird; bird sort of flys over the screen by moving the cursor + getting closer by growing. 
//date of creation: October 2017
//license: GNU General Public License v3.0 and later
//creator: lmWinifred

///////////////////////////////////////////////////////

//VOREINSTELLUNGEN DAMIT ALLES FUNKTIONIERT

import processing.pdf.*;

int counter = 0;

boolean record=true;

PShape vogel;                  //"vogel" = Variabel; PShape entspricht in etwa einer Gruppierung wie in Photoshop
 
float a = 0.0;
float s;

float pastX;                  //"pastX" = Variabel der VORHERIGE MAUSZEIGERPOSITION -> damit Berechnung der Position des Jetzt-Mauszeigers nicht von Punkt 0 ausgehen muss (langsamer)
float pastY;                  //dito für Y


float breite = 110;           //DAS IST KEINE SCREEN-BREITE, sondern wie lang der Vogel im Urzustand ist 
float hoehe = 47.5;           //DAS IST KEINE SCREEN-HOEHE, sondern wie hoch der Vogel im Urzustand ist 

void setup() {
  
  size (450,250);             //SCREEN GROESSE in px
  
  frameRate(30);             //WIE FLUESSIG DER VOGEL GROESSER FLIEGT -> je groesser die Zahl, desto fluessiger; hier zB 30 frames pro Sekunde
  
}

void draw() {
/******************************PDF DRUCK FUNKTION ist inaktiv*********
//AUFNAHME/"DRUCK" MIT PDF
    
      if(counter == 0){            //COUNTER BRAUCHT ES DAMIT BESTIMMT WERDEN KANN WIE OFT EINE PDF GENERIERT WIRD
        beginRecord(PDF, "frame-####.pdf"); // #### IM NAME DER PDF SO LASSEN, STEHT FUER DEN ABGESPEICHERTEN FRAME
        println("beginRecord wurde ausgeführt!!");
      }
      if(counter == 5){
        endRecord();
        counter=-1;               //BEDEUTET, DASS COUNTER WIEDER BEI 0 STARTET, WENN NICHT GESCHRIEBEN, STARTET BEI 1
        println("endRecord wurde ausgeführt!!");
      }
      counter++;                 // ++ SAGT, DASS SICH DER COUNTER IMMER UM 1 ERHOEHT

*************************************************************************/

//VARIABELN FÜR MAUSPOSITION UND FORM DES VOGELS

  a = a + 0.1;                                       // SUMMIERUNG von "0.1" gibt an in welchen Stufen der Vogel waechst (ACHTUNG oben wurde definiert, dass die Zahl immer eine Nachkommastelle hat (nach ammerikanischer Art durch Punkt)
  s = a / 20;                                        // TEILUNG durch "20" sagt aus wie schnell der Vogel waechst -> je kleiner die Zahl im Nenner desto schneller
  
  float posX = mouseX;
  float posY = mouseY;
  
  translate(((pastX) - (posX))   , ((pastY) - (posY)) );    //JETZT-Mausposition soll nur auf Basis der VORHERIGEN-Mausposition berechnet werden
 
  scale(s);                                         //DEFINIERUNG DER GROESSENVERSCHIEBUNG ANHAND VON "s"
  

//VOGEL  
  
    stroke(0,50,200);                               //LINIENFARBE des Umrisses des Vogels nach RGB
    vogel = createShape();                          //Variabel "vogel" von 
    vogel.beginShape();
      strokeWeight(1);                              //DICKE DER LINIE in px
      fill(255);                                    //FARBE der Fuellung des Vogels nach RGB -> "255" = Kurzform fuer "255,255,255"
      ellipse(posX,posY,25,25);                     //Kopf
      triangle(posX+10,posY-6,posX+8,posY+8,posX+30,posY);     //Schnabel
    ellipse(posX+2,posY-3,2,2);                         //Auge
  
    beginShape();                                       //Flügel hinten
    vertex(posX-40,posY+10);
    vertex(posX-60,posY-0);
    vertex(posX-15,posY+8);
    endShape();
  
    ellipse(posX-25,posY+20,60,25);                     //Körper
  
    beginShape();                                       //Flügel vorne
    vertex(posX-36,posY+20);
    vertex(posX-60,posY+35);
    vertex(posX-15,posY+20);
    endShape(); 
  
  
    beginShape();                                       //Schwänzchen 
      vertex(posX-50,posY+10);
       vertex(posX-65,posY-3);
       vertex(posX-62,posY+5);
       vertex(posX-80,posY-2);
       vertex(posX-55,posY+15);
    endShape();
  
  pastX = posX;
  pastY = posY;
  
}