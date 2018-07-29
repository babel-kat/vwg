//GUI Specifications - grid/sub-grid and buttons

class GUIInterface {

  Grid g;
  ArrayList<Line> lines;
  ArrayList<String> ruleKeys;
  ArrayList<Button> buttons;

  GUIInterface(ArrayList<Line> _lines, ArrayList<String> _ruleKeys) {
    lines = _lines;
    ruleKeys = _ruleKeys;
    int n = 6;                                 // choose an even num
    int subGridRatio = 5;                     // smallgrid
    g = new Grid(w, h, n * f, n, subGridRatio);
    buttons = new ArrayList<Button>();
    generateButtons();
  }

  void generateButtons() {
    int counter = 1;
    float btnWidth = (float)width / ruleKeys.size();
    for (String rk : ruleKeys) {
		    buttons.add(new Button(rk, rk, counter*btnWidth - btnWidth, height - 50, btnWidth, 50));
        counter++;
		}
  }

  void singleDraw() {
    strokeWeight(1);
    g.draw();
  }

  void draw () {
    strokeWeight(1);
    stroke(0);
    drawButtons();
    strokeWeight(2);
    //stroke(random(255),random(255),random(255));
    stroke(255,0,0);
    drawLines();
  }

  void drawLines() {
    for (Line l : lines) {
			l.drawLine();
		}
  }

  void drawButtons() {
    for (Button btn : buttons) {
			btn.draw();
		}
    noFill();
  }

  String buttonPressed() {
    for (Button btn : buttons) {
			if (btn.isMouseOver()) {
        return btn.id;
      }
		}

    return "";
  }

  float getGridRectSize(){
    return g.total_r;
  }
  
  float getSmallGridRectSize(){
    return g.total_rs;
  }
  
  float getSGFactor(){
    return g.factor;
  }
  
  float getRowNumber(){
   return g.rnum;
  }
  
  float  getColumnNumber(){
   return g.cnum;
  }
 
}
