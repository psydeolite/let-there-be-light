import java.util.*;
import java.io.*;
int[] ar;
int sy1=30; int sy2=100; 
int iy1=120; int iy2=190;
int qy1=210; int qy2=280;
int ax1=30; int ax2=130;

int bx1=330; int bx2=430;
int by1=30; int by2=100;
void setup() {
  size(480,420);
  background(255);
  drawTie();
  drawButtons();
  ar=new int[8];
  shuffle();
}

void drawTie() {
  fill(0);
  beginShape();
  vertex(220,30);
  vertex(260,30);
  vertex(250,60);
  vertex(280,350);
  vertex(240,400);
  vertex(200,350);
  vertex(230,60);
  vertex(220,30);
  endShape();
  line(230,60,250,60);
}

void drawButtons() {
  rectMode(CORNERS);
  
  fill(200);
  rect(ax1,sy1,ax2,sy2);
  textSize(16);
  fill(0);
  text("selection",40,70);
  
  fill(200);
  rect(ax1,iy1,ax2,iy2);
  textSize(16);
  fill(0);
  text("insertion",40,160);
  
  fill(200);
  rect(ax1,qy1,ax2,qy2);
  textSize(16);
  fill(0);
  text("quick",40,250);
  
  fill(200);
  rect(bx1,by1,bx2,by2);
  textSize(16);
  fill(0);
  text("reshuffle",340,70);
}

void shuffle() {
  ArrayList<Integer> colors=new ArrayList<Integer>(
    Arrays.asList(30,60,90,120,150,180,210,240));
  println(colors.toString());
  for (int i=0;i<8;i++) {
    ar[i]=colors.remove(int(random(colors.size())));
  }
}
void draw() {
  background(255);
  drawTie();
  drawButtons();
  drawArray();
  if (mousePressed) {
    if (mouseX>ax1 && mouseX<ax2 && mouseY>sy1 && mouseY<sy2) {
      println("selection");
      thread("selectionSort");
    } else if (mouseX>ax1 && mouseX<ax2 && mouseY>iy1 && mouseY<iy2) {
      println("insertion");
      thread("insertionSort");
    } else if (mouseX>ax1 && mouseX<ax2 && mouseY>qy1 && mouseY<qy2) {
      println("quick");
      thread("qsort");
    } else if (mouseX>bx1 && mouseX<bx2 && mouseY>by1 && mouseY<by2) {
      println("shuffle");
      thread("shuffle");
    } else {
      println("nothing");
    }
  }
}
  
void drawArray() {
  for (int i=0;i<ar.length;i++) {
    fill(255,0,0,ar[i]);
    //fill(ar[i]);
    stroke(255);
    ellipse(240,130+(i*30),20,20);
  }
}

void selectionSort() {
    int minInd;
    for (int i=0; i<ar.length;i++) {
      minInd=i;
      for (int j=i;j<ar.length;j++) {
        if (ar[j]<ar[minInd]) {
          minInd=j;
        }
      }  
      int temp=ar[minInd];
      ar[minInd]=ar[i];
      ar[i]=temp;
      delay(1000);
    }
  }
  
 void insertionSort() {
    int i,j;
    for (i=1;i<ar.length;i++) {
      int temp=ar[i];
      for (j=i-1;j>=0 && temp<ar[j];j--) {
        ar[j+1]=ar[j];
      }
      ar[j+1]=temp;
      delay(1000);
    }
  }
  
 void qsortHelp(int[] a,int l, int h) {
    if (l>=h) return;
    int pi=h;
    int pval=a[h];
    int hi=h-1;
    int li=l;
    while (li<hi) {
      if (a[li]<=pval) {
        li++;
      } else {
        int tmp=a[li];
        a[li]=a[hi];
        a[hi]=tmp;
        hi--;
      }
    }
    if (a[li]<pval) {
      a[pi]=a[li+1];
      a[li+1]=pval;
      pi=li+1;
      delay(1000);
    } else {
      a[pi]=a[li];
      a[li]=pval;
      pi=li;
      delay(1000);
    }
    delay(1000);
    qsortHelp(a,pi+1,h);
    qsortHelp(a,l,pi-1);
  }
  
  void qsort() {
    qsortHelp(ar,0,ar.length-1);
  }

