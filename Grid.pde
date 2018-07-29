class Grid {

  float w;
  float h;
  int rnum;
  int cnum;
  float total_r;
  float total_c;
  float factor;
  float total_rs;
  float total_cs;

  Grid (float _width, float _height, int _cnum, int _rnum, float _factor) {
    w = _width;
    h = _height;

    cnum = _cnum;                       //column number
    rnum = _rnum;                        //row number

    total_c = w / cnum;
    total_r = h / rnum;

    factor = _factor;
    total_rs = (total_r / factor);
    total_cs = (total_c / factor);
  }


  void draw () {                  //small grid
    stroke(0);
    noFill();
    for (int i = 0; i < total_r; i++ ) {             // rows
      for ( int j = 0; j < total_c; j++ ) {         // columns
        rect( i * total_c , j * total_r, total_c, total_r );
      }
    }

    stroke(30, 20, 55, 55);

    for (int i = 0; i < total_rs * rnum; i++ ) {
      for ( int j = 0; j < total_cs * cnum; j++ ) {
      rect( i * total_cs , j * total_rs, total_cs, total_rs );
      }
    }
  }
  

}
