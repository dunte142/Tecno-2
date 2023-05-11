let x , y, mov
let figura,fondo 
let obra = {
  img : 0,
  x : 250,
  y : 250,
  ancho : 500,
  alto : 500,
}

function preload(){
  figura = loadImage('img/obra armada tecno.png')
  fondo = loadImage('img/fondo.jpg')
  

}

function setup() {
  createCanvas(windowWidth, windowHeight);
  obra.img = figura;

  push()
  imageMode(CORNER)
  image(fondo,0,0,windowWidth,windowHeight)
  pop()
  
  imageMode(CENTER)
  mov=0
}

function draw() {
  
  x = mouseX
  y = mouseY
 


    push() //superior izquierdo
      translate(250,250)
      rotate(radians(x))
      image(obra.img , 0+mov, 0, obra.ancho , obra.alto)
    pop()
    

    push() //inferior izquierdo
      translate(250,750)
      rotate(radians(x));
      image(obra.img , 0+mov, 0 , obra.ancho , obra.alto)
    pop()






    push()//superior derecho
      translate(windowWidth-250,windowHeight/4)
      rotate(radians(x));
      image(obra.img , 0-mov, 0 , obra.ancho , obra.alto)
    pop()

 
    push()//inferior derecho
      translate(windowWidth-250,windowHeight-250)
      rotate(radians(x));
      image(obra.img , 0-mov, 0 , obra.ancho , obra.alto)
    pop()



}




  /*
                push()//medio superior 
                  translate(windowWidth/2,windowHeight/2-200)
                  rotate(radians(mouseX));
                  image(obra.img , 0, 0 , obra.ancho , obra.alto)
                pop()

                push()//medio inferior 
                  translate(windowWidth/2,windowHeight/2+300)
                  rotate(radians(mouseX));
                  image(obra.img , 0, 0 , obra.ancho , obra.alto)
                pop()
      
  */






