#include <Adafruit_NeoPixel.h>

 #define PIN 1
Adafruit_NeoPixel strip = Adafruit_NeoPixel(1, PIN, NEO_GRB + NEO_KHZ800);
int brightness[1];
int color[3];
String s = "";
void setup() 
{
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
      s = String(Serial.read());
    }
  }
  Serial.println(s);
  /*
  String sent is "rrr,ggg,bbb:b1,b2,b3,...bn:bool1,bool2,bool3,...booln"
  First split it into two strings, c and b
  Then read the strings into two arrays, then read those arrays to the pixels
  The bools determine whether an LED blinks or not
  */
 
  String c = s.substring(0,s.indexOf(":"));
  s = s.substring(s.indexOf(":") + 1);
   for (int j = 0; j < 3; j++)
    {
      int index = c.indexOf(",");
      color[j] = atol(c.substring(0, index).c_str());
      c = c.substring(index +1);
    }
  String b = s;
  s = s.substring(s.indexOf(":"));
    for (int j = 0; j < 1; j++)
    {
      int index = b.indexOf(",");
      brightness[j] = atol(b.substring(0, index).c_str());
      b = b.substring(index +1);
      strip.setPixelColor(j, brightness[j] * color[0], brightness[j] * color[1], brightness[j] * color[2]); 
    }
  String bl = s;
  for (int j = 0; j < 1; j++)
   {
     int index = bl.indexOf(",");
     if (atol(bl.substring(0, index).c_str()) == 1)
     {
       strip.setPixelColor(j, 0, 0, 0);
     }
     bl = bl.substring(index +1);
   }
  delay(1000);
    
}

