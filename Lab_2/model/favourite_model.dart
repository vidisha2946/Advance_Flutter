class Student{
  String? name;
  bool? isFav;

  Student({this.name , this.isFav = false});
}

class StudentModel{
  List<Student> _student = [
    Student(name: 'Vidisha '),
    Student(name: 'Nirav'),
    Student(name: 'Atmik'),
    Student(name: 'Diya'),
    Student(name : 'Rashi'),
  ];

  List<Student> get student => _student;
  void toggle(int index){
    _student[index].isFav = !_student[index].isFav!;
    print(":::::TOGGLE FIRED::::::::");
  }
}
