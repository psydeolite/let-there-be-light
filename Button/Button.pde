class button 
{ 
   boolean pressed;
   String text;
   int height, width;
   // note that processing determines the position of a button by the location of its top left corner
   int[] coords;
  button(int h, int w, String s, int[] c)
  {
    height = h;
    width = w;
    coords = c;
    text = s;
    pressed = false;
  }
  button(int h, int w, String s, int x, int y)
  {
    coords = new int[] {x, y};
    width = w;
    height = h;
    text = s;
    pressed = false;
  }
  button()
  {
    coords = new int[2];
    width = 1;
    height = 1;
    text = new String();
    pressed = false;
   }
   boolean bounds(int x, int y)
   {
    return x > coords[0] && x < coords[0] + width && y > coords[1] && y < coords[1] + height;
   }            
}
