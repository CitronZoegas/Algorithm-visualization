import peasy.*;
/**

BUBBLE SORT VISUALIZATION WITH PROCESSING.

**/
PeasyCam cam;

int i = 0;
int j = 0;

ArrayList<Float>values = new ArrayList<Float>();
float[] diagramValues;

void setup() {
  diagramValues = new float[200];
  
  windowMove(400,200);
  
  fullScreen(P3D);
  cam = new PeasyCam(this,700);
  
  for(int i =0; i< diagramValues.length; i++) { //<>//
    
    diagramValues[i] = map(i,0,random(20,50), random(20,50),0);
    }
  }

void draw() {
  
  background(192);

  if(i < diagramValues.length){
     //<>//
     for(int j = 0;j < diagramValues.length-i-1; j++) {
        float a = diagramValues[j];
        float b = diagramValues[j+1];
        
        if(a > b){
          swap(diagramValues,j,j+1);
          
        }
     }
  }
     
     i++;
  
     for(int i = 0; i < diagramValues.length; i++){
     
     translate(2,2,12);
     
     //stroke(255);
     //line(i,height,i,height-diagramValues[i]);
     box(diagramValues[i], diagramValues[i],15);
     
     }
}


void swap(float[]arr,int a, int b) {
    float temp = arr[a];
    arr[a] = arr[b];
    arr[b] = temp;
}
