class Sorter {
  
  public ArrayList<Integer> toSort;
  
  public Sorter(int size) {
    toSort=new ArrayList<Integer>();
    for (int i=0;i<size;i++) {
      toSort.add((int) random(50)); //brightness
    }
  }
  
  public ArrayList<String> results=new ArrayList<String>();
  
  void setup() {
    size(5000,5000);
    background(0);
  }
  
  String toString(int[] array) {
    String s="";
    for (int el:array) {
      s+=el+",";
    }
    return s;
  }
  
  void clearResults() {
    results=new ArrayList<String>();
  }
  
  void selectionSort() {
    clearResults();
    results.add(toSort.toString());
    int minInd;
    for (int i=0; i<toSort.size();i++) {
      minInd=i;
      for (int j=i;j<toSort.size();j++) {
        if (toSort.get(j)<toSort.get(minInd)) {
          minInd=j;
        }
      }  
      int temp=toSort.get(minInd);
      toSort.set(minInd,toSort.get(i));
      //results.add(toSort.toString());
      toSort.set(i,temp);
      results.add(toSort.toString());
    }
  }
      
  void insertionSort() {
    clearResults();
    results.add(toSort.toString());
    int i,j;
    for (i=1;i<toSort.size();i++) {
      int temp=toSort.get(i);
      for (j=i-1;j>=0 && temp<toSort.get(j);j--) {
        toSort.set(j+1,toSort.get(j));
        results.add(toSort.toString());
      }
      toSort.set(j+1,temp);
      results.add(toSort.toString());
    }
  }
  
  //needs work
  /*void mergeSorter() {
    clearResults();
    toSort=mergeSort(toSort);
  }
  
  /*void mergeSort(int lo, int hi) {
    if (lo>=hi) {
      merge(lo,hi);
      return;
    } else {
      mergeSort(lo,hi/2);
      mergeSort(hi/2,hi));
    }
  }
  
  void merge(int lo, int hi) {
    
    
    /*
    } else {
      ArrayList<Integer> b=new ArrayList<Integer>();
      for (int i=0;i<ar.size()/2;i++) {
        b.add(ar.get(i));
      }
      ArrayList<Integer> c=new ArrayList<Integer>();
      for (int i=ar.size()/2;i<ar.size();i++) {
        c.add(ar.get(i)); 
      }
      mergeSort(b);
      mergeSort(c);
      results.add(b.toString()+c.toString());
      //results.add(merge(mergeSort(b),mergeSort(c)).toString());
      return merge(b,c);
    }
  
 ArrayList<Integer> merge(int x1, int y1, int x2, int y2) {
   
 /* ArrayList<Integer> merge(ArrayList<Integer> a,ArrayList<Integer> b) {
    
    ArrayList<Integer> r=new ArrayList<Integer>();
    while (a.size()>0 && b.size()>0) {
      if (a.get(0)<b.get(0)) {
        r.add(a.remove(0));
      } else {
        r.add(b.remove(0));
      }
    }
    while (a.size()>0) {
      r.add(a.remove(0));
    }
    while (b.size()>0) {
      r.add(b.remove(0));
    }
    return r;
  }*/
  
  void qsortHelp(ArrayList<Integer> a,int l, int h) {
    if (l>=h) return;
    int pi=h;
    int pval=a.get(h);
    int hi=h-1;
    int li=l;
    while (li<hi) {
      if (a.get(li)<=pval) {
        li++;
      } else {
        int tmp=a.get(li);
        a.set(li,a.get(hi));
        results.add(toSort.toString());
        a.set(hi,tmp);
        results.add(toSort.toString());
        hi--;
      }
    }
    if (a.get(li)<pval) {
      a.set(pi,a.get(li+1));
      results.add(toSort.toString());
      a.set(li+1,pval);
      results.add(toSort.toString());
      pi=li+1;
    } else {
      a.set(pi,a.get(li));
      results.add(toSort.toString());
      a.set(li,pval);
      results.add(toSort.toString());
      pi=li;
    }
    qsortHelp(a,pi+1,h);
    qsortHelp(a,l,pi-1);
  }
  
  void qsort() {
    clearResults();
    results.add(toSort.toString());
    qsortHelp(toSort,0,toSort.size()-1);
  }
  
  
}
