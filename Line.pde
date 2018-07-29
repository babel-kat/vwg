class Line {
  float _x1;
  float _x2;
  float _y1;
  float _y2;
  PShape l;
  PVector p1;
  PVector p2;

  boolean rotate = false;

  Line (float x1, float y1, float x2, float y2) {
    _x1 = x1;
    _x2 = x2;
    _y1 = y1;
    _y2 = y2;
    createPShape(_x1, _y1, _x2, _y2);
  }

  void createPShape (float x1, float y1, float x2, float y2) {
    l = createShape(LINE, x1, y1, x2, y2);
    l.vertex(x1, y1);
    l.vertex(x2, y2);
    p1 = new PVector(x1, y1);
    p2 = new PVector(x2, y2);
  }

  void drawLine() {
    
    shape(l);
  }

  void scale(float s) {
    l.scale(s);
  }

  void rotate(float angle) {
    // pushMatrix();
    // translate(p1.x, p1.y);
    // rotate(a);
    // shape(l);
    // popMatrix();
  }

  //void remove() {
  //  stroke(255, 1);
  //}

  float[] getCordinates() {
    // float[] p1 = l.getVertex(0).array();
    // float[] p2 = l.getVertex(1).array();
    float[] coords = {p1.x, p1.y, p2.x, p2.y};
    return coords;
  }

  PVector[] getPoints() {
    PVector[] points = {p1, p2};
    return points;
  }

  void update(float x1, float y1, float x2, float y2) {
    l.setVertex(0, x1, y1);
    l.setVertex(1, x2, y2);
    l = createShape(LINE, x1, y1, x2, y2);
    p1 = new PVector(x1, y1);
    p2 = new PVector(x2, y2);
  }
}
