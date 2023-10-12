

void iniciar() {

  //inicializando el mundo
  mundo = new FWorld(0, 0, 7000, 700); // rango donde las cosas "viven"

  //configuro los bordes
  mundo.setEdges( 0, 0, 7000, height );
  //configurar la gravedad

  mundo.setGravity(0, 1000);

  //creo plataformas
  /*
  caja1 = crearPlataforma(1600, 550, 200, 30, color(255, 0, 0));
   caja1 = crearPlataforma(1600, 550, 200, 30, color(255, 0, 0));
   
   caja2 = crearPlataforma(3200, 550, 100, 20, color(255, 0, 0));
   
   caja3 = crearPlataforma(4800, 550, 100, 20, color(255, 0, 0));
   
   caja4 = crearPlataforma(6400, 550, 200, 30, color(255, 0, 0));
   
   caja5 = crearPlataforma(8000, 550, 100, 20, color(255, 0, 0));
   
   caja6 = crearPlataforma(900, 550, 100, 20, color(255, 0, 0));
   
   */

  //creo el burrito
  burrito = new Burrito();
  //agrego el burro al mundo
  mundo.add( burrito );

  //meto las cajas al mundo
  /*
  mundo.add(caja1);
   mundo.add(caja2);
   mundo.add(caja3);
   mundo.add(caja4);
   mundo.add(caja5);
   mundo.add(caja6);
   */

  estado = "inicio";
}


boolean hayColisionEntre( FContact contact, String nombreUno, String nombreDos ) {
  //por defecto supongo que no se dio el contacto buscado
  boolean resultado = false;

  //le pido al contacto que me devuelva los cuerpos que participaron
  FBody uno = contact.getBody1();
  FBody dos = contact.getBody2();

  //pregunto por los nombres de los cuerpos
  String etiquetaUno = uno.getName();
  String etiquetaDos = dos.getName();

  //verifico que ambos cuerpos tengan nombres
  if ( etiquetaUno != null && etiquetaDos != null ) {

    //si coinciden los nombres de los cuerpos con las etiquetas buscadas
    if (
      ( nombreUno.equals( etiquetaUno ) && nombreDos.equals( etiquetaDos ) ) ) {
      //entonces se dio el contacto buscado
      resultado = true;
    }
  }
  return resultado;
}

void reiniciar_() {
  estado = "inicio";
  burrito.reiniciar();
  fuerza=1;
  pantallas=0;
}

void controladorFuerza(int x1, int y2, int anch, int alt) {
  push();
  rect(x1, y2, anch, alt);
  pop();


  push();
  fill(255, 0, 0);
  rect(x1, y2-20, anch, alt-40 );
  pop();

  push();
  fill(0, 255, 0);
  rect(x1, y2+20, anch, alt-40 );
  pop();

  push();
  fill(0, 0, 255);
  rect(x1, y2+50, anch, alt-40 );
  pop();

  push();
  fill(0);
  line(x1, y2+80-fuerza, x1+30, y2+80-fuerza);
  pop();
}

/*
void contactStarted(FContact choque) {
 
 if ( estado.equals( "juega" ) ) {
 if ( hayColisionEntre( choque, "burrito", "plataforma" ) ) {
 float x = cos(110)*fuerza*200;
 float y = sin(110)*fuerza*200;
 burrito.setVelocity(x, y);
 }
 }
 }
 */


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
