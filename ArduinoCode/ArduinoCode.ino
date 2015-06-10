#include <Adafruit_NeoPixel.h>

 #define PIN 1
Adafruit_NeoPixel strip = new Adafruit_NeoPixel(5, PIN, NEO_GRB + NEO_KHZ800);
int[] brightness;
int r,b,g;
String s = new String();
void setup() {
  brightness = new int[5];
 Serial.begin(9600);
 strip.begin();
 strip.show();
  // put your setup code here, to run once:
 
}

void loop() {
  int i = 0;
  if (Serial.available())
  {
    while (Serial.available())
    {
      s = Serial.read();
    }
  }
  if (s.substring(0, 1).equals("0")
  {
    r = atol(s.substring(1, 2).c_str());
    g = atol(s.substring(2, 3).c_str());
    b = atol(s.substring(3, 4).c_str());
  }
  if (s.substring(0,1).equals('1');
  {
    s = s.substring(1);
    for (int j = 0; j < 5; j++)
    {
      
      int index = s.indexOf(",");
      brightness[j] = atol(s.substring(0, index).c_str());
      s = s.substring(index +1);
      strip.setPixelColor(j, brightness[j] * r, brightness[j] * g, brightness[j] * b); 
  // put your main code here, to run repeatedly:
    }
  }
}
