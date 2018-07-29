//x'=x*cosθ-y*sinθ
//y'=x*sinθ+y*cosθ


class Rotate implements Rule {

  float angle = 0;
  boolean clockwise = true;

  Rotate (float _angle, boolean _clockwise) {
    angle = _angle;
    clockwise = _clockwise;
  }

  Line apply(Line line) {
    //line.rotate(radians(30.0));
    PVector[] points = line.getPoints();
    PVector p1 = points[0];
    PVector p2 = points[1];

    // p1 is the point from which the line is rotated; the center point

    PVector new_pos = PVector.sub(p2, p1); // p2 relative to p1

    if(!clockwise) {
      angle = -angle;
    }

    float a = radians(angle);
    float sinAngle = sin(a);
    float cosAngle = cos(a);
    float nx = new_pos.x * cosAngle - new_pos.y * sinAngle;
    float ny = new_pos.x * sinAngle + new_pos.y * cosAngle;
    new_pos.x = nx;
    new_pos.y = ny;
    new_pos.add(p1);

    // float x = 0;
    // float y = 0;
    // float[] coords = line.getCordinates();
    // x = coords[2] * cos(angle) + coords[3] * sin(angle);
    // y = -coords[2] * sin(angle) + coords[3] * cos(angle);
    //
    // println(coords[0], coords[1],x,y);
    // println(cos(angle));

    float[] new_coords = {p1.x, p1.y, new_pos.x, new_pos.y};
    return new Line(new_coords[0], new_coords[1], new_coords[2], new_coords[3]);
  }

}
