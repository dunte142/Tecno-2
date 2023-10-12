
void inicio() {

  musica = new SoundFile(this, "musica.wav");
  choque = new SoundFile(this, "choque.wav");
  volando = new SoundFile(this, "volando.wav");
  puntaje = new SoundFile(this, "puntaje.wav");
  rebote = new SoundFile(this, "rebote.wav");



  fondo = loadImage("fondo.png");
  burrito_img = loadImage("Burrito.png");
  ok = loadImage("ok.png");
  puntaje_ = loadImage("puntaje.png");
  metros = loadImage("metros.png");

  //iniciar Fisica
  Fisica.init(this);

  letra = createFont("Lemon Days.ttf", 72);
  textFont(letra);
  textAlign( CENTER, CENTER );

  iniciar();

  osc = new OscP5(this, 8008);

  indice = new PVector(0, 0);
  pulgar = new PVector(width, height);
  puntero = new PVector(0, 0);
  musica.play();
}

void Juego() {

  println(estado);


  seTocan = dist(pulgar.x, pulgar.y, indice.x, indice.y) < umbralDistancia;

  down = !antesSeTocaban && seTocan;
  up = antesSeTocaban && !seTocan;

  puntero.x =  lerp(pulgar.x, indice.x, 0.5);
  puntero.y =  lerp(pulgar.y, indice.y, 0.5);


  if (pantallas == 0) {
    if ( estado.equals("inicio") ) {

      image(fondo, 0-burrito.getX(), 0);
      text("i Vola de aca !", width/2, height/2);
      image(ok, 400, 500, 100, 100);

      push();
      textSize(20);
      text("Para comenzar", 600, 550);
      pop();


      if (seTocan) {
        estado = "juega";
        pantallas =1;
      }
    }
  }

  if (pantallas == 1 ) {

    puntuacion = floor(burrito.getX());
    image(fondo, 0-burrito.getX(), 0);
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

      push();
      translate(0, 0);
      image(metros, 0+burrito.getX(), 0);
      puntuacion = floor(burrito.getX());

      fill(0);
      textSize(50);
      text(puntuacion, 300+burrito.getX(), 30);
      pop();
      mundo.draw();
      burrito.dibujar();

      if (fuerza <=80) {
        fuerza++;
      } else if (fuerza>=81) {
        fuerza=1;
      }
      controladorFuerza(160, 440, 30, 80);
    } else if ( estado.equals("perdiste")) {
      image(fondo, 0, 0);
      push();
      image(puntaje_, 0, 0);
      puntuacion = floor(burrito.getX());
      fill(0);
      textSize(30);
      text(puntuacion, width/2, 350);
      pop();



      translate(0, 0);

      if (seTocan) {

        reiniciar_();
      }
    }

    if ( estado.equals( "juega" ) ) {
      if (burrito.getY() >= 570 && burrito.getX()>100) {
        choque.play();
        puntaje.play();
        estado = "perdiste";
      }
    }

    antesSeTocaban = seTocan;
  }
}
