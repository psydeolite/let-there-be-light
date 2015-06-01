class Sorter {
  
  ArrayList<Integer> toSort;
  
  public Sorter(int size) {
    toSort=new ArrayList<Integer>();
    for (int i=0;i<size;i++) {
      toSort.add((int) random(50)); //brightness
    }
  }
  
  void setup() {
    size(5000,5000);
    background(0);
  }
  
  String toString() {
    String s="";
    for (int el:toSort) {
      s+=el+",";
    }
    return s;
  }
  
  void selectionSort() {
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
      toSort.set(i,temp);
    }
  }
  
  void insertionSort() {
    int i,j;
    for (i=1;i<toSort.size();i++) {
      int temp=toSort.get(i);
      for (j=i-1;j>=0 && temp<toSort.get(j);j--) {
        toSort.set(j+1,toSort.get(j));
      }
      toSort.set(j+1,temp);
    }
  }
  
  //needs work
  ArrayList<Integer> mergeSorter() {
    return mergeSort(toSort);
  }
  
  ArrayList<Integer> mergeSort(ArrayList<Integer> ar) {
    if (ar.size()<=1) {
      return ar;
    } else {
      ArrayList<Integer> b=new ArrayList<Integer>();
      for (int i=0;i<ar.size()/2;i++) {
        b.add(ar.get(i));
      }
      ArrayList<Integer> c=new ArrayList<Integer>();
      for (int i=ar.size()/2;i<ar.size();i++) {
        c.add(ar.get(i)); 
      }
      ArrayList<Integer> r1=mergeSort(b);
      ArrayList<Integer> r2=mergeSort(c);
      return merge(b,c);
    }
  }
  
  ArrayList<Integer> merge(ArrayList<Integer> a,ArrayList<Integer> b) {
    ArrayList<Integer> r=new ArrayList<Integer>();
    int ia=0;int ib=0;
    while (ia<a.size() && ib<b.size()) {
      if (a.get(ia)<b.get(ib)) {
        r.add(a.get(ia));
        ia++;
      } else {
        r.add(b.get(ib));
        ib++;
      }
    }
    while (ib<b.size()) {
      r.add(b.get(ib));
      ib++;
    }
    while (ia<a.size()) {
      r.add(a.get(ia));
      ia++;
    }
    return r;
  }
  
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
        a.set(hi,tmp);
        hi--;
      }
    }
    if (a.get(li)<pval) {
      a.set(pi,a.get(li+1));
      a.set(li+1,pval);
      pi=li+1;
    } else {
      a.set(pi,a.get(li));
      a.set(li,pval);
      pi=li;
    }
    qsortHelp(a,pi+1,h);
    qsortHelp(a,l,pi-1);
  }
  
  void qsort() {
    qsortHelp(toSort,0,toSort.size()-1);
  }
}
