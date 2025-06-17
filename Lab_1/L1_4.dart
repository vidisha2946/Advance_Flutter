abstract class Person {
  void display();
}
class Student extends Person {
  @override
  void display() {
    print('I am a vidisha.');
  }
}
void main()
{
  Student s1 = Student();
  s1.display();
}
