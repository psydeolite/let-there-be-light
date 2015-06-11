Sorter s=new Sorter(15);
    void setup() {
      println("test");
      println(s.toString());
      //s.qsort();
      s.mergeSorter();
      //s.selectionSort();
      //s.insertionSort();
      println(s.toString());
      System.out.println(s.results.toString());
      println(s.toSort.toString());
    }

 

