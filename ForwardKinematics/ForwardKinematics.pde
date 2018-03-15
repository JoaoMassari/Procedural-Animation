Segment tentacle;
//new segment connected with the first one
//Segment seg2;
void setup() {
  size(600,400);
  
  float t = 0;//random(1000);
  float sw =34;
  
  //parameters: position , length , angle
  tentacle = new Segment(width/2,400,10,0,t,sw);
  //dizendo que o current é = tentacle pq no caso tentacle vai ser o primeiro segmento
  Segment current = tentacle;
  for (int i = 0; i< 30; i++) {
    t += 0.1;
    sw -=1;
    //basicamente fazendo com que os novos tentaculos tornem-se o current
    Segment next = new Segment(current,10,0,t,sw);
    
    current.child = next;
    
    current = next;
    
  }
  
  //in java we can have two different constructors , so we have two different ways to make a segment

}
void draw() {
  background(51);
  
  Segment next = tentacle;
  while(next !=null){
  
  next.wiggle();
  next.update();
  next.show();
  next = next.child;
  
  }
}