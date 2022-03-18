import peasy.*;

int balls = 180;

PeasyCam cam;

ArrayList<PVector> listOfCalculations = new ArrayList<PVector>();

class Spherical {
  
   float r, theta, phi;
   Spherical(float r, float theta, float phi){
     this.r = r;
     this.theta = theta;
     this.phi = phi;
  }
}

Spherical spherical(float x,float y, float z) {
    float r = sqrt(x*x + y*y + z*z);
    float theta = atan2( sqrt(x*x + y*y),z);
    float phi = atan2(y,x);
    return new Spherical(r,theta,phi);
}

void setup() {
  boolean isEdge = false;
  size(1200,900,P3D);
  windowMove(500,80);
  cam = new PeasyCam(this,700);
  
  for(int i = 0; i < balls;i++){
    for(int j = 0; j < balls;j++) {
      for(int k = 0; k < balls;k++){
      
      float x = map(i,0,balls,-1,1);
      float y = map(j,0,balls,-1,1);
      float z = map(k,0,balls,-1,1);
      
      PVector thetaZ = new PVector(0,0,0);
      
      int n=2; 
      int maxIT = 10;
      int currentIT = 0;
      
      while(true) {      
        
        Spherical sphere = spherical(thetaZ.x,thetaZ.y,thetaZ.z);
        
        float anotherX = pow(sphere.r,n) * sin(sphere.theta*n) * cos(sphere.phi*n);
        float anotherY = pow(sphere.r,n) * sin(sphere.theta*n) * sin(sphere.phi*n);
        float anotherZ = pow(sphere.r,n) * cos(sphere.theta*n);
        
        thetaZ.x = anotherX + x;//THE C
        thetaZ.y = anotherY + y;//THE C
        thetaZ.z = anotherZ + z;//THE C
        
        currentIT++;
        
        if(sphere.r >18) {
          if(isEdge){
            
            listOfCalculations.add(new PVector(x*100,y*100,z*100));
            isEdge =false;
            
          }
          break;
        }
           if(currentIT > maxIT){
             if(!isEdge){
                 isEdge = true;
             }
             break;
          }
        }//while end
        
      }
    }
  }
}



void draw() {
  background(0);
  for(PVector vector:listOfCalculations){
    stroke(255);
    point(vector.x,vector.y,vector.z);
  }
}
