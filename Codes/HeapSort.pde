float[] values;

int i;
int len;

void setup(){
  
  size(800, 400);
//  fullScreen();
  
  values = new float[width];
  for(int i = 0; i < values.length; i++){
    values[i] = random(height);
  }
  
  len = values.length;
  i = len - 1;
  
  maxHeapify(values, len);
}

void draw(){
  
  background(0);
  
  if(i >= 0){
     swap(values, 0, i);
     heapify(values, i, 0);
  }
  
  i--;
  
  for(int i = 0; i < values.length; i++){
    stroke(255);
    line(i, height, i, height - values[i]);
  }
  
//  saveFrame("frames/HS_####.tif");
}

void heapify(float[] values, int size, int i){
  int largest = i;
  int left = 2*i + 1;
  int right = 2*i + 2;
  
  if(left < size && values[left] > values[largest])
    largest = left;
  
  if(right < size && values[right] > values[largest])
    largest = right;
    
  if(largest != i)
  {
    swap(values, i, largest);
    
    heapify(values, size, largest);
  }

}

void maxHeapify(float[] values, int size){
  int i = 0;
  
  for( i = (size - 1)/2; i >= 0; i--)
  {
    heapify(values, size, i);
  }
}


void swap(float[] values, int a, int b){
  float temp = values[a];
  values[a] = values[b];
  values[b] = temp;
}
