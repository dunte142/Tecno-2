FCircle crearBurrito(float x, float y, float t, color c, float g, boolean e) {
  FCircle main = new FCircle(t);
  push();
  imageMode(CENTER);
  main.setPosition(x, y);
  main.setVelocity(0, 0);
  main.setFillColor(c);
  main.setStatic(e);

  float r = (t/20)/2;
  main.setDensity(g/(PI*r*r));
  main.setNoStroke();
  pop();
  return main;
}

FBox crearPlataforma(float x, float y, float w, float h, color c, float g, boolean e) {
  FBox main = new FBox(w, h); //w= width  --  h=height
  main.setPosition(x, y); 
  main.setVelocity(0, 0);
  main.setFillColor(c); 
  main.setStatic(e);
  float we = (w/20);
  float he = (h/20);
  main.setDensity(g/(we*he));
  main.setNoStroke();
  return main;
}


FBox crearPlataforma(float x, float y, float w, float h, color c) {
  return crearPlataforma(x, y, w, h, c, 30, false);
}

FCircle crearBurrito(float x, float y, float t, color c) {
  return crearBurrito(x, y, t, c, 10, false);
}
