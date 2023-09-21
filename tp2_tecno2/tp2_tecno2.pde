import processing.sound.*;
SoundFile  musica;
//SoundFile  golpe;


import fisica.*;
import oscP5.*;

OscP5 osc;

PImage  burrito_img, fondo, ok;

int pantallas = 0;

float amortiguacion = 0.9;
float umbralDistancia = 110;

PVector indice;
PVector pulgar;


PVector puntero;


boolean seTocan = false;
boolean antesSeTocaban = false;

boolean down = false;
boolean up = false;

float posX, posY;
float initPosX = 0;

int puntuacion;

FWorld mundo;
Burrito burrito;
FBox caja1;
FBox caja2;
FBox caja3;
FBox caja4;
FBox caja5;
FBox caja6;
FBox caja7;
FBox caja8;
FBox caja9;
FBox caja10;
FBox caja11;
FBox caja12;
FBox caja13;
FBox caja14;
FBox caja15;



String estado;

void setup() {
  size( 1200, 600 );

  musica = new SoundFile(this, "musica_fondo.mp3");
  //golpe = new SoundFile(this, "golpe.mp3");
  musica.play();

  fondo = loadImage("fondo.png");
  burrito_img = loadImage("Burrito.png");
  ok = loadImage("ok.png");
  //iniciar Fisica
  Fisica.init(this);

  textFont( createFont("Arial", 72) );
  textAlign( CENTER, CENTER );

  iniciar();

  osc = new OscP5(this, 8008);

  indice = new PVector(0, 0);
  pulgar = new PVector(width, height);
  puntero = new PVector(0, 0);
}
void draw() {


  seTocan = dist(pulgar.x, pulgar.y, indice.x, indice.y) < umbralDistancia;

  down = !antesSeTocaban && seTocan;
  up = antesSeTocaban && !seTocan;

  puntero.x =  lerp(pulgar.x, indice.x, 0.5);
  puntero.y =  lerp(pulgar.y, indice.y, 0.5);


  if (pantallas == 0) {
    image(fondo, 0-burrito.getX(), 0, 7000, height);
    text("La belarda saltarina", width/2, height/2);
    image(ok, 400, 500, 100, 100);

    push();
    textSize(20);
    text("Para comenzar", 600, 550);
    pop();

    if (seTocan) pantallas =1;
  }

  if (pantallas == 1) {
    puntuacion = floor(burrito.getX());
    image(fondo, 0-burrito.getX(), 0, 7000, height);
    burrito.attachImage(burrito_img);

    if (down) {
      initPosX = puntero.x;
    }
    posX = 300 - (initPosX - puntero.x);
    posY = puntero.y;


    if (down) burrito.estirar();
    if (up) burrito.disparar();

    if ( estado.equals("juega") ) {
      burrito.actualizar();
      mundo.step();
      translate( 300-burrito.getX(), 0 );
      fill(255);
      mundo.draw();
      burrito.dibujar();
    } else if ( estado.equals("perdiste")) {
      image(fondo, 0-burrito.getX(), 0, 7000, height);
      text( "Fin del juego", width/2, height/2 );
      text( "Tu puntuacion fue de " + puntuacion, width/2, 400 );

      image(ok, 400, 500, 100, 100);

      push();
      textSize(20);
      text("Para comenzar", 600, 550);
      pop();
      burrito.reiniciar();
      translate(0, 0);

      //if (seTocan) pantallas =0;
    }

    if ( estado.equals( "juega" ) ) {
      if (burrito.getY() >= 570 && burrito.getX()>100) {
        estado = "perdiste";
      }
    }

    antesSeTocaban = seTocan;
  }

  println(burrito.getX());
}

void contactStarted(FContact choque) {

  if ( estado.equals( "juega" ) ) {
    if ( hayColisionEntre( choque, "burrito", "plataforma" ) ) {
      estado = "perdiste";
    }
    if ( hayColisionEntre( choque, "burrito", "plataforma" ) ) {
      estado = "perdiste";
    }
  }
}






void oscEvent(OscMessage m) {

  if (m.addrPattern().equals("/annotations/thumb")) {
    pulgar.x = map( m.get(9).floatValue(), 0, 800, width, 0 );
    pulgar.y = map( m.get(10).floatValue(), 0, 600, 0, height );
  }
  if (m.addrPattern().equals("/annotations/indexFinger")) {
    indice.x = map( m.get(9).floatValue(), 0, 800, width, 0 );
    indice.y = map( m.get(10).floatValue(), 0, 600, 0, height );
  }
}
