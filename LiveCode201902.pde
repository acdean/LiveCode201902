// LiveCode201902 2019-01-12 16:09:05

int HEIGHT = 50;
int WIDTH = 50;
String nubers = "0123456789ABCDEF";

boolean video = false;

ArrayList<Number> number = new ArrayList();

void setup() {
  size(640, 480);
  for (int y = 0 ; y < height ; y += HEIGHT) {
    for (int x = 0 ; x < width ; y += WIDTH) {
    }
  }
}

void draw() {

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
  int value;
  int delta;
  int x, y;
}

// save a snapshot on keypress
void keyPressed() {
  saveFrame("snap####.png");
}