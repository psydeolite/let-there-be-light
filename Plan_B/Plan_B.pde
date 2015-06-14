Sorter s;
ArrayList<Integer> ar=new ArrayList<Integer>();
void setup() {
  size(480,420);
  background(255);
  fill(255,0,0);
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
  s=new Sorter();
  for (int i=0;i<8;i++) {
    int r=int(random(256));
    ar.add(r);
    fill(r);
    stroke(255);  
    ellipse(240,130+(i*30),20,20);
  }
}

void draw() {
  if (mousePressed==true) {
    s.selectionSort(ar);
  } 
}
