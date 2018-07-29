//// Translation Rules

//x1' = x1 + dx
//y1' = y1 + dy

//x2' = x2 + dx
//y2' = y2 + dy

class Translation implements Rule {
  float factor = 0.0;
  boolean xTranslation = true;
  boolean left = true;
  boolean up = true;

  Translation (boolean _xTranslation, float _factor, boolean _left, boolean _up) {  // constructor
    xTranslation = _xTranslation;
    factor = _factor;
    left = _left;
    up = _up;
  }


  Line apply(Line line) {
    float[] coords = line.getCordinates();
    float x1 = coords[0];
    float y1 = coords[1];
    float x2 = coords[2];
    float y2 = coords[3];

    if(xTranslation) {
      if (left) {
        x1 = x1 - factor;
        x2 = x2 - factor;
      } else {
      x1 = x1 + factor;
      x2 = x2 + factor;}
    } else {                //yTranslation
      if (up) {
        y1 = y1 - factor;
        y2 = y2 - factor;
      } else {
      y1 = y1 + factor;
      y2 = y2 + factor;
      }
    }

    float[] new_coords = {x1, y1, x2, y2};
    return new Line(new_coords[0], new_coords[1], new_coords[2], new_coords[3]);
  }

}
