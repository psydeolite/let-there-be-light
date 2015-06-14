class Sorter {
  
  //public ArrayList<Integer> toSort;
  
  /*public Sorter(int size) {
    toSort=new ArrayList<Integer>();
    for (int i=0;i<size;i++) {
      toSort.add((int) random(50)); //brightness
    }
  }*/
  
  public ArrayList<String> results=new ArrayList<String>();
  
  void setup() {
    size(5000,5000);
    background(0);
  }
  
  void drawArray(ArrayList<Integer> toSort) {
    for (int i=0;i<toSort.size();i++) {
    fill(toSort.get(i));
    stroke(255);  
    ellipse(240,130+(i*30),20,20);
    }
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
  
  void selectionSort(ArrayList<Integer> toSort) {
    //clearResults();
    //results.add(toSort.toString());
    drawArray(toSort);
    int minInd;
    for (int i=0; i<toSort.size();i++) {
      delay(100);
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
      drawArray(toSort);
      //results.add(toSort.toString());
    }
  }
      
  void insertionSort(ArrayList<Integer> toSort) {
    //clearResults();
    //results.add(toSort.toString());
    int i,j;
    for (i=1;i<toSort.size();i++) {
      int temp=toSort.get(i);
      for (j=i-1;j>=0 && temp<toSort.get(j);j--) {
        toSort.set(j+1,toSort.get(j));
        //results.add(toSort.toString());
      }
      toSort.set(j+1,temp);
      //results.add(toSort.toString());
    }
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
        //results.add(toSort.toString());
        a.set(hi,tmp);
        //results.add(toSort.toString());
        hi--;
      }
    }
    if (a.get(li)<pval) {
      a.set(pi,a.get(li+1));
      //results.add(toSort.toString());
      a.set(li+1,pval);
      //results.add(toSort.toString());
      pi=li+1;
    } else {
      a.set(pi,a.get(li));
      //results.add(toSort.toString());
      a.set(li,pval);
      //results.add(toSort.toString());
      pi=li;
    }
    qsortHelp(a,pi+1,h);
    qsortHelp(a,l,pi-1);
  }
  
  void qsort(ArrayList<Integer> toSort) {
    //clearResults();
    //results.add(toSort.toString());
    qsortHelp(toSort,0,toSort.size()-1);
  }
  
  
}
