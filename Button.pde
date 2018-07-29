class Button {
  String id;
  String label;
  float x;    // top left corner x position
  float y;    // top left corner y position
  float w;    // width of button
  float h;    // height of button

  Button(String _id, String labelB, float xpos, float ypos, float widthB, float heightB) {
    id = _id;
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
  }

  void draw() {
    fill(218);
    rect(x, y, w, h);
    textAlign(CENTER, CENTER);
    fill(0);
    text(label, x + (w / 2), y + (h / 2));
  }

  boolean isMouseOver() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      return true;
    }
    return false;
  }
}
