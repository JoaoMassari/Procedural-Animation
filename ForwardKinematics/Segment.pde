class Segment {
  //just a vector
  PVector a;
  float len;
  float angle;
  float selfAngle;
  
  //perly noise
  float t; //0 for sin wave__and that for xoff noise_ random(1000);
  float sw;
  
  //b is what you calculate based on where a is , what the angle is and what the length is
  PVector b;
  //we need to make a awarened of the segment connections , who is connected with who
  //parent = posição x , y do ponto A do seg1
  Segment parent = null;
  //chield é o "next" ou proximo segment
  Segment child = null;
  
   //Instead of taking x and y on length and angle , its going to take another segment on length and angle//This is a constructor and we java we can have TWOO
  Segment(Segment parent_ , float len_ , float angle_,float t_,float sw_){
    parent = parent_;
    
   // a = new PVector(parent.b.x,parent.b.y);... Lembrando aqui que a posição a do seg2 é a mesma posição b do seg1... lembrando que aqui definimos que isso é um parent
   a = parent.b;
    len = len_;
    angle = angle_;  
    selfAngle = angle;
    t = t_;
    sw = sw_;
    calculateB();
  }
  
  
  //when I create Segment , what do I need?...//This is a constructor and we java we can have TWOO
  Segment(float x , float y , float len_ , float angle_,float t_,float sw_){
    a = new PVector(x,y);
    len = len_;
    angle = angle_;   
    t = t_;
    sw = sw_;
    calculateB();
    parent = null;
  }
  
  void wiggle() {
    
    //lets make the range of angle , small for sin and a bit bigger for perlin noise
    float maxAngle = 0.1;
    float minAngle = -0.1;
    
    //doing some perlyn noise for rotation
    selfAngle = map(noise(t),0,1,maxAngle,minAngle);
    //selfAngle = map(sin(t),-1,1,maxAngle,minAngle);
    
    t += 0.03;
   
  }
  
  void update() {
    angle = selfAngle;
    if(parent != null) {
      //new vector from parent.b... E CONECTANDO OS DOIS SEGMENTOS , dizendo que a posição a é igual a posição b do seg1 conforme ela rotaciona
     a = parent.b;   
      //we also want to pass the parents angle
      angle += parent.angle;
      //child tentacles
    }else {
    
      angle += -PI/2;
      
    }    
   calculateB();
  }
  
  void calculateB() {
    //calculando o ponto B do segmento , Figura no caderno
    float dx = len * cos(angle);
    float dy = len * sin(angle);
    //saving the values dx and dy in a vector.
    b = new PVector(a.x+dx , a.y+dy);
  
  }
  
  
  void show() {
    stroke(255);
    strokeWeight(sw);
    line(a.x , a.y , b.x , b.y);
  
  }
  
  
}