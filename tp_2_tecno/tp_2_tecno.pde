import fisica.*;

FWorld mundo;
FCircle pelota;
FBox caja1;
FBox caja2;
FBox caja3;

PImage fondo, pj, burrito;
int x_=0;

float angulo;
float fuerza;
float angulo_m;
float fuerza_m;
boolean lock = false; //booleano que permite pasar de un estado a otro

void setup() {

  fondo = loadImage("fondo.png");
  //pj = loadImage("");
  burrito = loadImage("Burrito.png");



  size(1000, 700);
  Fisica.init(this);
  mundo = new FWorld();
  mundo.setEdges(); //paredes del mundo

  //creo el burrito
  pelota = crearBurrito(50, height-50, 80, color(0, 255, 50)); //crea el objeto esfera
  pelota.setGrabbable(false);
  pelota.setName("Burrito");
  //lo meto al mundo
  mundo.add(pelota); //añade la esfera al mundo

  //creo plataformas
  caja1 = crearPlataforma(width/2+450, height-110, 100, 20, color(255, 0, 0));
  caja2 = crearPlataforma(width/2, height-110, 100, 20, color(255, 0, 0));
  caja3 = crearPlataforma(width/2+200, height-110, 100, 20, color(255, 0, 0));
  //lo meto al mundo
  mundo.add(caja1);
  mundo.add(caja2);
  mundo.add(caja3);
}

void draw() {
  //background(255);

  image(fondo, x_, 0, 7000, height);


  mundo.step();
  mundo.drawDebug();
  
  //dibujarInterfaz
  pushStyle();
  noFill();
  imageMode(CENTER);

  image(burrito, pelota.getX(), pelota.getY()); //esto deberia ser con attachImage

  if (lock) {

    fuerza_m++; //Defino la fuerza
    if (fuerza_m>=50) {
      fuerza_m = 0;
    }

    float lx = pelota.getX()+40*cos(angulo);
    float ly = pelota.getY()+40*sin(angulo);
    line(pelota.getX(), pelota.getY(), lx, ly);
    ellipse(pelota.getX(), pelota.getY(), 40+fuerza_m, 40+fuerza_m); //circulo de fuerza (golpe)
  } else {

    angulo_m+=0.1;
    float lx = pelota.getX()+40*cos(angulo_m);
    float ly = pelota.getY()+40*sin(angulo_m);
    line(pelota.getX(), pelota.getY(), lx, ly); //linea de direccion
  }

  if (pelota.getX() >50 ) { //si ya le pegaste a la pelota solo podes hacer que baje
    angulo_m=900;
    x_-=10;
  }

  popStyle();
}

void keyPressed() {

  if (lock) { // si estoy en lock = true  defino la fuerza y disparo con addImpulse

    fuerza = fuerza_m;
    fuerza_m = 0;

    //con cordenadas polares
    float x = cos(angulo)*fuerza*150;
    float y = sin(angulo)*fuerza*150;

    pelota.addImpulse(x, y); //con impulse para que sea como un "golpe"
    lock = false  ;
  } else { //si lock = false   defino el angulo

    angulo =angulo_m;
    angulo_m = 0;
    lock = true; //y devuelvo lock
  }
}
