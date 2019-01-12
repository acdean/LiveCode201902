// LiveCode201902 2019-01-12 16:09:05

int HEIGHT = 50;
int WIDTH = 50;
String values = "0123456789ABCDEF";

boolean video = false;

ArrayList<Number> numbers = new ArrayList();

void setup() {
  size(640, 480);
  for (int y = 0 ; y < height ; y += HEIGHT) {
    for (int x = 0 ; x < width ; x += WIDTH) {
      numbers.add(new Number(x, y));
    }
  }
}

void draw() {

  background(0);
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
    text("" + (int)(value % values.length()), x, y);
  }
}

// save a snapshot on keypress
void keyPressed() {
  saveFrame("snap####.png");
}