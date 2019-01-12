// LiveCode201902 2019-01-12 16:09:05

int HEIGHT = 160;
int WIDTH = 130;
String values = "0123456789ABCDEF";

boolean video = false;

ArrayList<Number> numbers = new ArrayList();
PFont font;

void setup() {
  size(1600, 900);
  for (int y = 0 ; y < height + HEIGHT ; y += HEIGHT) {
    for (int x = 0 ; x < width + WIDTH ; x += WIDTH) {
      numbers.add(new Number(x, y));
    }
  }
  font = createFont("Courier", 200);
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
    delta = random(.01);
    c = color(random(0, 128), random(0, 128), random(0, 128));
    s = (int)(random(-40, 40));
  }
  
  void draw() {
    value += delta;
    stroke(c);
    fill(c);
    textSize(200 + s);
    int v = (int)(value % values.length());
    text("" + values.substring(v, v + 1), x, y);
  }
}

// save a snapshot on keypress
void keyPressed() {
  saveFrame("snap####.png");
}