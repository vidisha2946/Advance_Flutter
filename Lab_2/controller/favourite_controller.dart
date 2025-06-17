import '../model/favourite_model.dart';

class StudentController{
  StudentModel _student = StudentModel();

  List<Student> get studentValue => _student.student;

  void toggle(int index) => _student.toggle(index);

}