import processing.sound.*;
SoundFile  musica;
SoundFile  choque;
SoundFile  volando;
SoundFile  puntaje;
SoundFile  rebote;

import fisica.*;
import oscP5.*;

OscP5 osc;

PImage  burrito_img, fondo, ok, puntaje_, metros;
PFont letra;

int pantallas = 0;
int fuerza = 1;

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
/*
FBox caja1;
FBox caja2;
FBox caja3;
FBox caja4;
FBox caja5;
FBox caja6;
*/

String estado;
