class Count {
  static int counter = 3;
}
class s1 {
  void incrementCounter() {
    Count.counter++;
  }
}
class s2 {
  void incrementCounter() {
    --Count.counter;
  }
}
void main() {
  s1 s = s1();
  s2 t = s2();
  s.incrementCounter();
  print('After s1: ${Count.counter}');
  t.incrementCounter();
  print('After s2: ${Count.counter}');
}
