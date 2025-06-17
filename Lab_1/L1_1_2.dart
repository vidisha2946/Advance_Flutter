class Person {
  String name = '';
  int age = 0;

  void displayPersonDetails() {
    print('Name: $name');
    print('Age: $age');
  }
}

class Student extends Person {
  String grade = '';

  void display() {
    displayPersonDetails();
    print('Grade: $grade');
  }
}

void main() {
  Student student = Student();
  student.name = 'Vidisha';
  student.age = 20;
  student.grade = 'A';
  student.display();
}
