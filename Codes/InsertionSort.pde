
float[] values;

int i = 1;
int j;

void setup(){
  size(800, 400);
//  fullScreen();
  values = new float[width];
  for(int i = 0; i < values.length; i++){
    values[i] = random(height);
  }
}

void draw(){
  background(0);
  
  if(i < values.length){
    float key = values[i];
    for(j = i - 1; j >= 0 && values[j] > key; j--){
      values[j+1] = values[j];
    }
    values[j+1] = key;
  }
  else{
    noLoop();
  }
  i++;
  
  for(int i = 0; i < values.length; i++){
    stroke(255);
    line(i, height, i, height - values[i]);
  }
}

void swap(float[] arr, int a, int b){
  float temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;
}
