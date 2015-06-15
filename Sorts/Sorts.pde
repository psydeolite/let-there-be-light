import java.util.*;
import java.io.*;
class Sorter {
  // Sorting algorthms
  public ArrayList<Double> toSort;
  
  public Sorter(int size) {
    ArrayList<Double> a = new ArrayList<Double>(size);
    for (int i = 0; i < size; i++)
    {
      a.add((double) i);
    }
    toSort = new ArrayList<Double>(size);
    for (int j = 0; j < size; j++)
    {
      toSort.add(a.remove((int) random(a.size())));
    }
    
  }
  
  public ArrayList<String> results=new ArrayList<String>();
  
  void setup() {
    size(5000,5000);
    background(0);
  }
  String toString()
  {
    return this.toString(toSort);
  }
  
  String toString(ArrayList<Double> array) {
    String s="";
    for (double el:array) {
      s+= (int) el+":";
    }
    return s.substring(0,s.length());
  }
  
  void clearResults() {
    results=new ArrayList<String>();
  }
  
  void selectionSort() {
    clearResults();
    results.add(this.toString(toSort));
    int minInd;
    for (int i=0; i<toSort.size();i++) {
      minInd=i;
      for (int j=i;j<toSort.size();j++) {
        if (toSort.get(j)<toSort.get(minInd)) {
          minInd=j;
        }
      }  
      double temp=toSort.get(minInd);
      toSort.set(minInd,toSort.get(i));
      //results.add(this.toString(toSort));
      toSort.set(i,temp);
      results.add(this.toString(toSort));
    }
  }
      
  void insertionSort() {
    clearResults();
    results.add(this.toString(toSort));
    int i,j;
    for (i=1;i<toSort.size();i++) {
      double temp=toSort.get(i);
      for (j=i-1;j>=0 && temp<toSort.get(j);j--) {
        toSort.set(j+1,toSort.get(j));
      }
      toSort.set(j+1,temp);
      results.add(this.toString(toSort));
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
  
  void qsortHelp(ArrayList<Double> a,int l, int h) {
    if (l>=h) return;
    int pi=h;
    double pval=a.get(h);
    int hi=h-1;
    int li=l;
    while (li<hi) {
      if (a.get(li)<=pval) {
        li++;
      } else {
        double tmp=a.get(li);
        a.set(li,a.get(hi));
        results.add(this.toString(toSort));
        a.set(hi,tmp);
        results.add(this.toString(toSort));
        hi--;
      }
    }
    if (a.get(li)<pval) {
      a.set(pi,a.get(li+1));
      results.add(this.toString(toSort));
      a.set(li+1,pval);
      results.add(this.toString(toSort));
      pi=li+1;
    } else {
      a.set(pi,a.get(li));
      results.add(this.toString(toSort));
      a.set(li,pval);
      results.add(this.toString(toSort));
      pi=li;
    }
    qsortHelp(a,pi+1,h);
    qsortHelp(a,l,pi-1);
  }
  
  void qsort() {
    clearResults();
    results.add(this.toString(toSort));
    qsortHelp(toSort,0,toSort.size()-1);
  }
  
  
}
