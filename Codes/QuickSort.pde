float[] values;

int count = 0;

void setup() {
  size(600, 400);
//  fullScreen();
  values = new float[width];
  for (int i = 0; i < values.length; i++) {
    values[i] = random(height);
  }
}

void draw() {
  background(0);
  
  if(count < width){
    quicksort(values, 0, values.length-1);
  }
  
  for (int i = 0; i < values.length; i++) {
    stroke(255);
    line(i, height, i, height - values[i]);
  }
  
  count++;
  
//  saveFrame("frames/QS_####.tif");
}

void quicksort(float[] arr, int lo, int hi) {
  if (lo < hi) {
    int mid = partition(arr, lo, hi);
    quicksort(arr, lo, mid-1);    
    quicksort(arr, mid+1, hi);
  }
}

int partition (float arr[], int left, int right) 
{ 
    float pivot = arr[right]; 
    int i = left - 1;
    int j;
    
    for(j = left; j <= right - 1; j++){
      if( arr[j] <= pivot){
        i++;
        if(arr[i] != arr[j]){
          swap(arr, i, j);
          break;
        }
      }
    }
    swap(arr, i+1, j);
    return i+1;
}

void swap(float[] arr, int a, int b) {
  float temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;
  redraw();
}
