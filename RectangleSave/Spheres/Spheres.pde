import peasy.*;

PeasyCam cam;
/**

MERGE SORT VISUALIZATION OF SPHERES

**/
int i = 0;
int j = 0;

ArrayList<Float>values = new ArrayList<Float>();
float[] diagramValues;

void setup() {
  diagramValues = new float[30];
  //windowMove(400,200);
  fullScreen(P3D);
  cam = new PeasyCam(this,700);
  
    for(int i =0; i< diagramValues.length; i++) {
        diagramValues[i] = map(i,0,random(5,15), random(5,15),0);
        System.out.println(diagramValues[i]);
    }
 }

void draw() {
  
  background(192);

     for(int j = 0;j < diagramValues.length; j++) {
         sort(diagramValues);
       }
    i++;
  
     for(int i = 0; i < diagramValues.length; i++){
     
       translate(2,2,10);
       
       //stroke(255);
       //line(i,height,i,height-diagramValues[i]);
       
       sphere(diagramValues[i]);
     
     
    
 }
}
