// LiveCode201902 2019-01-12 16:09:05

int HEIGHT = 260;
int WIDTH = 180;
int FONT_SIZE = 400;
//String values = "01";
//String values = "0123456789";
String values = "0123456789abcdef";

boolean video = false;

ArrayList<Number> numbers = new ArrayList();
PFont font;

void setup() {
  size(1600, 900);
  for (int y = HEIGHT ; y < height + HEIGHT ; y += HEIGHT) {
    for (int x = 0 ; x < width + WIDTH ; x += WIDTH) {
      numbers.add(new Number(x, y));
    }
  }
  //String[] fontList = PFont.list();
  //printArray(fontList);
  font = createFont("Ubuntu Mono Bold", FONT_SIZE);
}

void draw() {

  background(0);
  textFont(font);
  for (Number n : numbers) {
    n.draw();
  }





  // video stuff
  if (video) {
    saveFrame("frame#####.png");
    if (frameCount > 500) {
      exit();
    }
  }
}

class Number {
  float value;
  float delta;
  int x, y;
  color c;
  int s;
  
  Number(int x, int y) {
    this.x = x;
    this.y = y;
    value = 1;
    delta = random(.03);
    c = color(random(0, 256), random(0, 256), random(0, 256));
    s = (int)(random(-40, 40));
  }
  
  void draw() {
    value += delta;
    stroke(c);
    fill(c);
    textSize(FONT_SIZE + s);
    int v = (int)(value % values.length());
    text("" + values.substring(v, v + 1), x, y);
  }
}

// save a snapshot on keypress
void keyPressed() {
  saveFrame("snap####.png");
}