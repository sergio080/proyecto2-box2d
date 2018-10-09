class  Catapulta {
  RevoluteJoint joint;
  Box box1;
  Box box2;

  Catapulta (float x, float y) {

    box1 = new Box(x, y-20, 120, 10, false); 
    box2 = new Box(x, y, 10, 40, true); 
    RevoluteJointDef rjd = new RevoluteJointDef();

    rjd.initialize(box1.body, box2.body, box1.body.getWorldCenter());
    FixtureDef fd = new FixtureDef();
    fd.density = 100;
    fd.friction = 0;
    fd.restitution = 0; 

    joint = (RevoluteJoint) box2d.world.createJoint(rjd);
  }
  

  void toggleMotor() {
    joint.enableMotor(!joint.isMotorEnabled());
  }

  boolean motorOn() {
    return joint.isMotorEnabled();
  }
  void display() {
    box2.display();
    box1.display();

    Vec2 anchor = box2d.coordWorldToPixels(box1.body.getWorldCenter());
    fill(255,100,0);
    stroke(0);
    ellipse(anchor.x, anchor.y, 4, 4);
  }
}
