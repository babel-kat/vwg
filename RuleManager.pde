class RuleManager {

  ArrayList<Line> lines;
  ArrayList<String> rules;

  RuleManager (ArrayList<Line> _lines) {
    lines = _lines;
    rules = new ArrayList<String>();
    registerRules();
  }

  void registerRules() {
    rules.add("reflectY");
    rules.add("reflectX");
    rules.add("scale");
    rules.add("translateRight");
    rules.add("translateLeft");
    rules.add("translateDown");
    rules.add("translateUp");
    rules.add("rotateCL");
    rules.add("rotateCCL");
    rules.add("random"); // random should be the last always
  }

  ArrayList<String> getRules() {
    return rules;
  }

  Line getLastLine() {
    return lines.get(lines.size() - 1);
  }

  void applyRule(String id) {
    Line lastLine = getLastLine();
    Line newLine = lastLine;

    PVector[] points = lastLine.getPoints();
        PVector p1 = points[0];
        PVector p2 = points[1];              //for Translations

    switch (id) {
      case "reflectY":
        Reflection refY = new Reflection(true);
        newLine = refY.apply(lastLine);
        break;
      case "reflectX":
        Reflection refX = new Reflection(false);
        newLine = refX.apply(lastLine);
        break;
      case "scale":
        Scale s = new Scale(random(0.9,1.3));
        newLine = s.apply(lastLine);
        lines.remove(lines.size() - 1);
        break;
      case "translateRight":
        p2.x = Math.round(p2.x*100.0)/100.0; // round to 2 decimals due to marginal errors
        p1.x = Math.round(p1.x*100.0)/100.0;
        float f = (p2.x == p1.x) ? g.getSmallGridRectSize() : p2.x - p1.x; // g is global declared in SG_4
        Translation trX = new Translation(true, f, false, false);
        newLine = trX.apply(lastLine);
        break;
      case "translateLeft":
        p2.x = Math.round(p2.x*100.0)/100.0; // round to 2 decimals due to marginal errors
        p1.x = Math.round(p1.x*100.0)/100.0;
        f = (p2.x == p1.x) ? g.getSmallGridRectSize() : p2.x - p1.x;
        Translation trX_up = new Translation(true, f, true, false);
        newLine = trX_up.apply(lastLine);
        break;
      case "translateDown":
        p2.y = Math.round(p2.y*100.0)/100.0; // round to 2 decimals due to marginal errors
        p1.y = Math.round(p1.y*100.0)/100.0;
        f = (p2.y == p1.y) ? g.getSmallGridRectSize() : p2.y - p1.y;
        Translation trY = new Translation(false, f, false, false);
        newLine = trY.apply(lastLine);
        break;
        case "translateUp":
        p2.y = Math.round(p2.y*100.0)/100.0; // round to 2 decimals due to marginal errors
        p1.y = Math.round(p1.y*100.0)/100.0;
        f = (p2.y == p1.y) ? g.getSmallGridRectSize() : p2.y - p1.y;
        Translation trY_left = new Translation(false, f, false, true);
        newLine = trY_left.apply(lastLine);
        break;
      case "rotateCL":
        int[] angles = { 45, 90 };
        int randomKey = (int)random(angles.length);
        Rotate rotCL = new Rotate(angles[randomKey], true); //in RADS : 30 = PI/6, 45 = PI/4 ... or float rad = radians(45.0);
        newLine = rotCL.apply(lastLine);
        lines.remove(lines.size() - 1);
        break;
      case "rotateCCL":
        int[] anglesCCL = { 45, 90 };
        int randomKeyCCL = (int)random(anglesCCL.length);
        Rotate rotCCL = new Rotate(anglesCCL[randomKeyCCL], false); //in RADS : 30 = PI/6, 45 = PI/4 ... or float rad = radians(45.0);
        newLine = rotCCL.apply(lastLine);
        lines.remove(lines.size() - 1);
        break;
      default:
        println("Unknown rule!");
        break;
    }

    //Line newLine = new Line(coords[0], coords[1], coords[2], coords[3]);
    lines.add(newLine);
  }

  String getRandomKey() {
    return (String) rules.get(int(random(rules.size() - 1)));
  }
}
