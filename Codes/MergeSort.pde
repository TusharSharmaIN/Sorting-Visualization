float[] values ;
float[] temp ;

int wid = 1;
int len;

void setup(){
  size(800, 400);
//  fullScreen();
  values = new float[width];
  temp = new float[width];
  
  for(int i = 0; i < values.length; i++){
    values[i] = random(height);
  }
  
  len = values.length;
}

void draw(){
  
  background(0);
  
  if(wid < len){
    int it;
    
    for(it = 0; it < len; it = it + 2*wid){
      int left, mid, right;
      
      left = it;
      mid = it + wid;
      right = it + 2*wid;
      
      merge(values, left, min(mid, len), min(right, len), temp);
    }
  }
  
  wid = 2 * wid;

  for(int i = 0; i < len; i++){
    stroke(255);
    line(i, height, i, height - values[i]);
  }
  
//  saveFrame("frames/MS_####.tif");
}

void merge(float[] values, int iLeft, int iMid, int iRight, float[] temp){
  int i = iLeft;
  int j = iMid;
  int k = iLeft;
  
  while(i < iMid || j < iRight){
    if(i < iMid && j < iRight){
      
      if(values[i] < values[j]){
        temp[k++] = values[i++];
      }
      else{
        temp[k++] = values[j++];
      }
    }
    else if(i == iMid){
      temp[k++] = values[j++];
    }
    else if(j == iRight){
      temp[k++] = values[i++];
    }
  }
  
  for( i = iLeft; i < iRight; i++)
    values[i] = temp[i];
}
