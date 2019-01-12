// LiveCode201902 2019-01-12 16:09:05

boolean video = false;

void setup() {
}

void draw() {







  // video stuff
  if (video) {
    saveFrame("frame#####.png");
    if (frameCount > 500) {
      exit();
    }
  }
}

// save a snapshot on keypress
void keyPressed() {
  saveFrame("snap####.png");
}
