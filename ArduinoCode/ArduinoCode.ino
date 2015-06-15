#include <Adafruit_NeoPixel.h>
/*
Initializes Arduino, adds strip of LEDs. Makes an array to store color values
*/
 #define PIN 6
Adafruit_NeoPixel strip = Adafruit_NeoPixel(5, PIN, NEO_GRB + NEO_KHZ800);
int color[5];
int i;
void setup() 
{
 Serial.begin(9600);
 strip.begin();
 strip.show();
}

void loop()
{
  
  /*
  Parses string sent by serial, puts in color array  
  */
  for (int i = 0; i < 5; i++)
  {
    String colorString = Serial.readStringUntil(':');
    if (colorString!="")
    {
      color[i] = colorString.toInt();
    }
  }
  // Depending on the value in the color array, the LED is set to a certain color
  for (int j = 0; j < 5; j++)
  {
    switch (color[j])
    {
      case 0: 
        strip.setPixelColor(j,  255, 0, 0);
        break;
      case 1:
        strip.setPixelColor(j, 238, 100, 0);
        break;
      case 2:
        strip.setPixelColor(j, 255, 255, 0);
        break;
      case 3:
        strip.setPixelColor(j, 0, 255, 0);
        break;
      case 4:
        strip.setPixelColor(j, 0, 0, 255);
        break;
      default:
        strip.setPixelColor(j, 0, 0, 0);
    }
  }
  delay(200);
  strip.show();

  
} 
  

    

