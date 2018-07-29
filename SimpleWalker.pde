class SimpleWalker implements Walker{
  RuleManager rm;

  SimpleWalker(RuleManager _rm) {
    rm = _rm;
  }

  // pattern 1 //void pattern() {

  //  // choose from rules: reflect scale ...
  //  // iterate N times (choose from keyboard)
  //  rm.applyRule("reflectY");
  //  rm.applyRule("reflectY");
  //  rm.applyRule("scale");
  //}
  
  void loop_square1(){
    rm.applyRule("scale");
    rm.applyRule("reflectX");
    rm.applyRule("reflectY");
    rm.applyRule("reflectX");
  }
  
  void loop_square2(){
    rm.applyRule("scale");
    rm.applyRule("reflectX");
    rm.applyRule("reflectY");
    rm.applyRule("reflectX");
  }
  
  void loop_rhombus(){
    for (int i=0; i<3; i++){
      rm.applyRule("translateDown");
      rm.applyRule("reflectX");
      rm.applyRule("translateDown");
      rm.applyRule("reflectY");
    }
  }
  
  void moveRight(int t){
    for (int i=0; i<t; i++){
      rm.applyRule("translateRight");
    }
  }

   void moveLeft(int t){
      for (int i=0; i<t; i++){
        rm.applyRule("translateLeft");
   
      }
    
  }
  
  void newLine_vertical(float t){
    lines.add(new Line(width/2, g.getGridRectSize()* t , dim, height/2));  // width/2, g.getGridRectSize() * t , dim, height/2)
  }
  
  //  void pattern() { //pattern 2
  //  // choose from rules: reflect scale ...
  //  // iterate N times (choose from keyboard)
    
    
  //  for (int j=1; j < g.getRowNumber()+1; j++) {                         // g.getRowNumber()+1
  //    newLine_vertical(j);
  //    stroke(255, 0, 0);
  //    println(j);
  //    for (int i=0; i < g.getColumnNumber() * g.getSGFactor(); i++){   // g.getColumnNumber() * g.getSGFactor()
  //      println(i);
  //      moveLeft(i);
  //      loop_rhombus();
  //      stroke(0,255,40, 5);
  //      //moveRight(i);
  //   } 
     
  //   //newLine_vertical(j);
  //  }
    
  //}
  
  void pattern() {
    // choose from rules: reflect scale ...
    // iterate N times (choose from keyboard)
    
    
    for (int j=1; j < 3; j++) { 
      for (int i=1; i < j; i++) {
        loop_square1();
        rm.applyRule("rotateCCL");
      }
        loop_square2();
        rm.applyRule("rotateCL");
     } 
     
     //newLine_vertical(j);
    
  }
}
