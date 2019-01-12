// LiveCode201902 2019-01-12 16:09:05

int HEIGHT = 80;
int WIDTH = 65;
String values = "0123456789ABCDEF";

boolean video = false;

ArrayList<Number> numbers = new ArrayList();
PFont font;

void setup() {
  size(640, 480);
  for (int y = 0 ; y < height + HEIGHT ; y += HEIGHT) {
    for (int x = 0 ; x < width + WIDTH ; x += WIDTH) {
      numbers.add(new Number(x, y));
    }
  }
  font = createFont("Courier", 100);
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
  
  Number(int x, int y) {
    this.x = x;
    this.y = y;
    value = 1;
    delta = random(.01);
  }
  
  void draw() {
    value += delta;
    stroke(0, 255, 0);
    fill(0, 255, 0);
    text("" + (int)(value % values.length()), x, y);
  }
}

// save a snapshot on keypress
void keyPressed() {
  saveFrame("snap####.png");
}