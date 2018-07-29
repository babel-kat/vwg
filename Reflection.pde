// Mirror Rules

/*for x1,y1 & x2, y2


x' =  x + 2 * dx
y' =  y + 2 * dy

*/

boolean overY = true;

class Reflection implements Rule {

  Reflection(boolean _overY){
    overY = _overY;
  }

// ekkremei h epilogh a3ona gia to reflection basei tou grid

  Line apply(Line line) {
    //float dx = x_axis - x;
    //float dy = y_axis - y;
    float[] coords = line.getCordinates();
    float dx = 0;
    float dy = 0;
    float x = 0;
    float y = 0;

    if (overY) {
      dx = coords[2] - coords[0]; // x2 - x1
    } else {
      dy = coords[3] - coords[1]; // y2 - y1
    }

    x = coords[0] + 2 * dx; // x1 + 2 * dx
    y = coords[1] + 2 * dy; // y1 + 2 * dy;
    float [] new_coords = {coords[2], coords[3], x, y};
    return new Line(new_coords[0], new_coords[1], new_coords[2], new_coords[3]);
  }
}
