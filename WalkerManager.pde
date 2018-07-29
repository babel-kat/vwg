class WalkerManager {
  ArrayList<Walker> walkers = new ArrayList<Walker>();
  RuleManager rm;

  WalkerManager(RuleManager _rm) {
    rm = _rm;
    SimpleWalker w = new SimpleWalker(rm);
    walkers.add(w);
  }

  void pattern(int patternKey) {
    Walker w = walkers.get(patternKey);
    w.pattern();
  }
}
