import processing.serial.*;
Serial myPort;
Sorter s=new Sorter(5);
String val;
String out;
int i;

    void setup() {
       myPort = new Serial(this, "/dev/cu.usbmodem1421", 9600);
      //s.qsort();
      //s.mergeSorter();
      //s.selectionSort();
      s.selectionSort();
      //println(s.toString());
      i = 0;
      out = "";
    }
    
    void draw()
      {
      if (i == s.results.size())
      {
        myPort.write(out);
        println("Final: " + out);
        delay(5000);  
        myPort.write("5:5:5:5:5:5");
        i = 0;
      }
      else
      {
      out = out + s.results.get(i);
      println(out);
      myPort.write(out);
      i++;
      delay(1000);
      }
      out = "";
    }
 

