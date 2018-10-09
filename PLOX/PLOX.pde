import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
ArrayList <Catapulta> catapultas;
int pantalla = 0;
int ancho,alto;
int x,y;
int x_ , ancho_, alto_, y_;  
ArrayList<Particle> particles;
ArrayList<Obstaculo> obstaculos;
ArrayList<Basura> basuras;
PImage inicio,instrucciones, ultima,bote;

void setup() {
  size(500,300);
  smooth();
  
  inicio   = loadImage("inicio.gif"); 
  instrucciones = loadImage("instrucciones.gif");
  ultima   = loadImage("ultima.gif");
  bote         = loadImage("bote.jpg");
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
//  catapulta = new Catapulta(100,250);
 particles = new ArrayList<Particle>();
  obstaculos = new ArrayList<Obstaculo>();
 // obstaculos.add(new Obstaculo(255,10,120,10,-90));
 // obstaculos.add(new Obstaculo(255,270,120,10,360));
  basuras = new ArrayList<Basura>();
 // basuras.add(new Basura (100,224,20,20));
  catapultas = new ArrayList <Catapulta>();
  
  
}
void draw() {
  background(255);
  box2d.step();
  if(pantalla==0){
  image(inicio,0,0,500,300);
  if(mousePressed && (mouseX>200) && (mouseX < 200+235) && (mouseY>200) &&(mouseY<200+80))
  {
  pantalla=1;
}}
 if(pantalla==1){
  image(instrucciones,0,0,500,300);
  if(mousePressed && (mouseX>300) && (mouseX < 300+235) && (mouseY>200) &&(mouseY<200+80))
  {
  pantalla=2;
}
 }
 if(pantalla==2){
  image(bote,400,220,50,50);
   obstaculos.add(new Obstaculo(255,10,120,10,-90));
   obstaculos.add(new Obstaculo(255,270,120,10,360));
    basuras.add(new Basura (100,224,20,20));
    catapultas.add( new Catapulta(100,250));
  
  if(mousePressed && (mouseX>100) && (mouseX < 100+235) && (mouseY>200) &&(mouseY<200+80))
  {
  pantalla=3;
}
 }
  for (Basura b : basuras){
      b.display();
      

  if (mousePressed) {
    float sz =(10);
    particles.add(new Particle(random(150,250),.10,sz));
  }
for (Catapulta ca: catapultas){
  ca.display();}
  for (Obstaculo wall: obstaculos){
    wall.display();
  }
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.display();
   
    if (p.done()) {
      particles.remove(i);
    }
   
    }
  }
  
}
