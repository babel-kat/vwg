class _Grid {

  float w;
  float h;
  int total_rows, total_columns;
  float total_rows_small, total_columns_small;
  float r_size, c_size, factor, r_size_small, c_size_small;

  Grid (float _width, float _height, int _total_rows, int _total_columns, float _factor) {
    w = _width;
    h = _height;
    factor = _factor;
    total_rows = _total_rows;
    total_columns = _total_columns;
    total_rows_small = total_rows / factor;
    total_columns_small = total_columns / factor;
    r_size = h / total_rows;
    c_size = w / total_columns;
    r_size_small = h / (total_rows / factor);
    c_size_small = w / (total_columns / factor);
  }


  void draw () {
    stroke(30, 20, 55, 55);
    for (int i = 0; i < total_rows; i++ ) { // rows
      for ( int j = 0; j < total_columns; j++ ) { // columns
        rect( i * c_size , j * r_size, c_size, r_size );
      }
    }

    stroke(0);
    noFill();

    for (int i = 0; i < total_rows_small; i++ ) {
      for ( int j = 0; j < total_columns_small; j++ ) {
      rect( i * c_size_small , j * r_size_small, c_size_small, r_size_small );
      }
    }
  }
}
