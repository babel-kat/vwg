ArrayList<Line> lines = new ArrayList<Line>();  //every new line saved in lines
GUIInterface g;
RuleManager rm;
WalkerManager wl;
Keyboard keyboard;
PShape ls, ls2;
boolean clear = false;

int w = 1000;
int f = 2;
int h = w/f;            //500
int btnHeight = 50;    //50

float dim;

void setup() {
  size(1000, 550);  //w, H+h
  background(255);
  rm = new RuleManager(lines);
  wl = new WalkerManager(rm);
  g = new GUIInterface(lines, rm.getRules());
  keyboard = new Keyboard(lines, rm, wl);
  g.singleDraw();

  // first line
  dim = g.getSmallGridRectSize();
  Line l = new Line(width/2, h /2, width/2 + dim, h /2);     // set SAME in Reset (Keyboard)|| start: 0, 0, dim, dim // middle: width/2, h /2, width/2 + dim, h /2 + dim
  lines.add(l);
  l.drawLine();
}

void draw() {
  if (clear) {
    background(255);
    g.singleDraw();
  }
  g.draw();
}

void mousePressed() {
  clear = false;
  String btn_id = g.buttonPressed();

  if (btn_id == "random") {
    btn_id = rm.getRandomKey();
  }
  rm.applyRule(btn_id);
}

void keyPressed() {
  keyboard.onKeyPressed();
}
