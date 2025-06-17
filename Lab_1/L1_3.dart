class Person {
  void display() {
    print('I am a Vidu.');
  }
}
class Student extends Person {
  @override
  void display() {
    print('I am a Vidisha');
  }
}
void main() {
  Student s1 = Student();
  Person p1 = Person();
  p1.display();
  // s1.display();
}
