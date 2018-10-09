class Basura {
  //atributos
  float ancho;
  float alto;
  Body b;
  color c;
  
  //métodos
  //constructor
  Basura (float x_, float y_,float ancho_, float alto_){
    this.ancho = ancho_;
    this.alto = alto_;
     color(0);
    
    //primero: definir mi body: posición inicial y el tipo de cuerpo
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x_,y_));
    
    // segundo: crear el body
    b = box2d.createBody(bd);
    
    // tercer: definir la forma de mi objeto
    PolygonShape ps = new PolygonShape();
    float anchoAjustado = box2d.scalarPixelsToWorld(ancho_/2);
    float altoAjustado = box2d.scalarPixelsToWorld(alto_/2);
    ps.setAsBox(anchoAjustado,altoAjustado);
    
    //cuarto: definir el fixture de mi objeto
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = .2;
    fd.friction = 0;
    fd.restitution = 0; 
   
    
    //quinto: Agregar todo al body
    b.createFixture(fd);
    //b.setLinearVelocity(new Vec2(10,20));
    b.setAngularVelocity(10);
  }
  
  boolean estaEnPantalla(){
    Vec2 posicion = box2d.getBodyPixelCoord(b);
   if(posicion.y>height+max(this.ancho,this.alto)){
      eliminarBody();
     return false;
   }
   else{
     return true;
   }
  }
  
  void eliminarBody(){
    box2d.destroyBody(b);  
  }
  
  //display
  void display(){
    Vec2 posicion = box2d.getBodyPixelCoord(b);
    float angulo =b.getAngle();
    pushMatrix();
    translate(posicion.x,posicion.y);
    rotate(-angulo);
    noStroke();
    fill(this.c);
    rectMode(CENTER);
    rect(0,0,ancho,alto);
    popMatrix();    
  }
  
}
