
class Burrito extends FCircle {

  String estado;
  float xOriginal = 100;
  float yOriginal = 500 ;

  int tiempo = 500000;//espera de 5 segundos

  Burrito() {
    //llamando al constructor de la clase madre ( FCircle )
    super(30);
    setFill(0);
    //configura el rebote (entre 0 y 1)
    setRestitution(0.5);
    //configura la masa
    setDensity(100);
    //configuro el nombre
    setName("burrito");
    reiniciar();
    estado = "inicia";
  }

  void reiniciar() {
    estado = "inicia";
    //el proyectil no responde a las fuerzas
    setStatic(true);
    //pongo la velocidad en 0
    setVelocity(0, 0);
    //aplico una posicion inicial
    setPosition( xOriginal, yOriginal );
  }

  void actualizar() {
    if ( estado.equals("inicia") ) {
      setPosition( xOriginal, 500);
    } else if ( estado.equals("estira") ) {
    } else if ( estado.equals("movimiento") ) {
    }
  }

  void click() {
    if ( estado.equals("inicia") ) {
      estado = "estira";
    } else if ( estado.equals("estira") ) {
      disparar();
    }
  }

  void estirar() {
    if ( estado.equals("inicia") ) {
      estado = "estira";
    }
  }


  void dibujar() {
    if ( estado.equals("estira") ) {
      push();
      strokeWeight(10.0);
      line( getX(), getY(), posX, posY );
      line( posX, posY, posX-50, posY-20);
      line( posX, posY, posX-50, posY+20);
      pop();
    }
  }

  void disparar() {
    if (estado.equals("estira")) {

      //lo hago disponible para aplicar fuerzas
      setStatic( false );
      //defino el vector de fuerza
      float dx = getX()+posX;
      float dy = getY()+posY;

      //aplico movimiento en función del vector definido con el mouse

      setVelocity( dx*fuerza*20, dy*fuerza*20 );
      volando.play();
      estado = "movimiento";
    }
  }
}

/*
FBox crearPlataforma(float x, float y, float w, float h, color c, float g) {
  FBox main = new FBox(w, h); //w= width  --  h=height
  main.setPosition(x, y);
  main.setVelocity(0, 0);
  main.setFillColor(c);
  main.setStatic(true);
  float we = (w/20);
  float he = (h/20);
  main.setDensity(g/(we*he));
  main.setNoStroke();
  main.setName("plataforma");
  return main;
}


FBox crearPlataforma(float x, float y, float w, float h, color c) {
  return crearPlataforma(x, y, w, h, c, 30);
}
*/
