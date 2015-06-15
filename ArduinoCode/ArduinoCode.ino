#include <Adafruit_NeoPixel.h>

 #define PIN 6
Adafruit_NeoPixel strip = Adafruit_NeoPixel(5, PIN, NEO_GRB + NEO_KHZ800);
int brightness[5];
int color[3];
int i;
void setup() 
{
 
 Serial.begin(9600);
 strip.begin();
 strip.show();
  // put your setup code here, to run once:
  i = 0;
}

void loop() {
  for(int i=0;i<3;i++){
        String colorString = Serial.readStringUntil(':');
        if(colorString!=""){
            //here you could check the servo number
            color[i]  = colorString.toInt();
            digitalWrite(7, HIGH);
            delay(1000);
            digitalWrite(7, LOW);
            delay(1000);
        }
    }
  for (int j = 0; j < 5; j++)
  {
    strip.setPixelColor(j, color[0], color[1], color[2]);
    strip.show();
  }
    
  
  /*
  String sent is "rrr,ggg,bbb:b1,b2,b3,...bn:bool1,bool2,bool3,...booln"
  First split it into two strings, c and b
  Then read the strings into two arrays, then read those arrays to the pixels
  The bools determine whether an LED blinks or not

  String c = s.substring(0,s.indexOf(":"));
  s = s.substring(s.indexOf(":") + 1);
   for (int j = 0; j < 3; j++)
    {
      int index = c.indexOf(",");
      color[j] = atol(c.substring(0, index).c_str());
      c = c.substring(index +1);
    }
  String b = s;
  Serial.println(b);

    for (int j = 0; j < 5; j++)
    {
      int index = b.indexOf(",");
      brightness[j] = atol(b.substring (0, index).c_str());
      b = b.substring(index +1);
      strip.setPixelColor(j, brightness[j] * color[0], brightness[j] * color[1], brightness[j] * color[2]); 
      strip.show();
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
   */
    
}

