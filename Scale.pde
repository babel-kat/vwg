//// Scale Rules

//scale factor = s
//x2,y2

//x2' = x * s
//y2' = y * s

class Scale implements Rule {
  float factor;
  Scale (float _factor) {
    factor = _factor;
  }

  Line apply(Line line) {
    float[] coords = line.getCordinates();
    float[] new_coords = {coords[0], coords[1], coords[0] + factor * (coords[2] - coords[0]), coords[1] + factor * (coords[3] - coords[1])}; //(x1 + λ(x2 − x1), y1 + λ(y2 − y1))
    return new Line(new_coords[0], new_coords[1], new_coords[2], new_coords[3]);
    //line.scale(factor);
    //return line;
  }

}
