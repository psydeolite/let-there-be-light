int[] toSort;
void setup() {
  size(100,100);
  toSort=new int[15];
  for (int i=0;i<toSort.length;i++) {
    toSort[i]=(int) random(50); //brightness
  }
}

void selectionSort() {
  int minInd;
  for (int i=0; i<toSort.length;i++) {
    minInd=i;
    for (int j=i;j<toSort.length;j++) {
      if (toSort[j]<toSort[minInd]) {
        minInd=j;
      }
    }  
    int temp=toSort[minInd];
    toSort[minInd]=toSort[i];
    toSort[i]=temp;
  }
}

void insertionSort() {
  int i,j;
  for (i=1;i<toSort.length;i++) {
    int temp=toSort[i];
    for (j=i-1;j>=0 && temp<toSort[j];j--) {
      toSort[j+1]=toSort[j];
    }
    toSort[j+1]=temp;
  }
}

int[] mergeSort(int[] ar) {
  if (ar.length<=1) {
    return ar;
  } else {
    int[] b=new int[ar.length/2];
    for (int i=0;i<ar.length/2;i++) {
      b[i]=ar[i];
    }
    int[] c=new int[ar.length-b.length];
    int ct=0;
    for (int i=ar.length/2;i<ar.length;i++) {
      c[ct]=ar[i]; ct++;
    }
    int[] r1=mergeSort(b);
    int[] r2=mergeSort(c);
    return merge(b,c);
  }
}

int[] merge(int[] a,int[] b) {
  return null;
}

