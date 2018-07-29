//Keyboard Controls  - Initial line position (N), UP, DOWN, LEFT, RIGHT, s, r, R, w, d, 1 for Branch specified in Simple Walker

class Keyboard {
  ArrayList<Line> lines;
  RuleManager rm;
  WalkerManager _wl;

  Keyboard (ArrayList<Line> _lines, RuleManager _rm, WalkerManager _wl) {
    lines = _lines;
    rm = _rm;
    wl = _wl;
  }

  void onKeyPressed () {
    if (key == 'n' || key == 'N') {
      clear = true;
      lines.clear();
      Line l = new Line(width /2 , h /2, width /2 + dim , h /2 + dim);      //<-- Reset / right-middle: width - 2 * dim, h /2, width - dim , h /2 + dim
      lines.add(l);
      l.drawLine();
    }

    if (key == CODED && keyCode == UP) {
      rm.applyRule("translateUp");
    }

    if (key == CODED && keyCode == DOWN) {
      rm.applyRule("translateDown");
    }

    if (key == CODED && keyCode == LEFT) {
      rm.applyRule("translateLeft");
    }

    if (key == CODED && keyCode == RIGHT) {
      rm.applyRule("translateRight");
    }

    if (key == 's' || key == 'S') {
      rm.applyRule("scale");
    }

    if (key == 'r') {
      rm.applyRule("rotateCL");
    }

    if (key == 'R') {
      rm.applyRule("rotateCCL");
    }

    if (key == 'w' || key == 'W') {
      rm.applyRule("reflectY");
    }

    if (key == 'd' || key == 'D') {
      rm.applyRule("reflectX");
    }
 
    if (key == '1') {
      wl.pattern(0);
    }
  }
}
