

void iniciar() {

  //inicializando el mundo
  mundo = new FWorld(0, 0, 7000, 700); // rango donde las cosas "viven"

  //configuro los bordes
  mundo.setEdges( 0, 0, 7000, height );
  //configurar la gravedad

  mundo.setGravity(0, 1000);

  //creo plataformas
  caja1 = crearPlataforma(1600, 550, 200, 30, color(255, 0, 0));

  caja2 = crearPlataforma(3200, 550, 100, 20, color(255, 0, 0));

  caja3 = crearPlataforma(4800, 550, 100, 20, color(255, 0, 0));

  caja4 = crearPlataforma(6400, 550, 200, 30, color(255, 0, 0));

  caja5 = crearPlataforma(8000, 550, 100, 20, color(255, 0, 0));

  caja6 = crearPlataforma(900, 550, 100, 20, color(255, 0, 0));

  // caja7 = crearPlataforma(1700, 550, 200, 30, color(255, 0, 0));
  // caja8 = crearPlataforma(1050, 550, 100, 20, color(255, 0, 0));
  // caja9 = crearPlataforma(2050, 550, 100, 20, color(255, 0, 0));
  //  caja10 = crearPlataforma(1700, 550, 200, 30, color(255, 0, 0));
  // caja11 = crearPlataforma(1050, 550, 100, 20, color(255, 0, 0));
  // caja12 = crearPlataforma(2050, 550, 100, 20, color(255, 0, 0));
  // caja13 = crearPlataforma(1700, 550, 200, 30, color(255, 0, 0));
  // caja14 = crearPlataforma(1050, 550, 100, 20, color(255, 0, 0));
  // caja15 = crearPlataforma(2050, 550, 100, 20, color(255, 0, 0));

  //creo el burrito
  burrito = new Burrito();
  //agrego el burro al mundo
  mundo.add( burrito );

  //meto las cajas al mundo
  mundo.add(caja1);
  mundo.add(caja2);
  mundo.add(caja3);
  mundo.add(caja4);
  mundo.add(caja5);
  mundo.add(caja6);

  estado = "juega";
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
