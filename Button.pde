class Button
{
    boolean pressed;
    String text;
    int height, width;
    // note that processing determines the position of a button by the location of its top left corner
    int[] coords;
    Button(int w, int h, String s, int[] c)
    {
	height = h;
	width = w;
	coords = c;
	text = s;
	pressed = false;
    }
    Button(int w, int h, String s, int x, int y)
    {
	coords = new int[] {x, y};
	width = w;
	height = h;
	text = s;
	pressed = false;
    }
    Button()
    {
	coords = new int[2];
	width = 1;
	height = 1;
	text = new String();
	pressed = false;
    }
    
       
}
