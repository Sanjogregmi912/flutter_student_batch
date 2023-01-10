import 'package:batch_student_starter/data_source/local_data_source/student_data_source.dart';
import 'package:batch_student_starter/model/student.dart';

abstract class StudentRepositiory {
  Future<List<Student>>getStudent();

  Future<int> addStudent(Student student);
  Future<Student?> loginStudent(String username, String password);
}

class StudentRepositoryImp extends StudentRepositiory {
  @override
  Future<int> addStudent(Student student) {
    return StudentDataSource().addStudent(student);
  }

  @override
  Future<List<Student>> getStudent(){
    return StudentDataSource().getStudent();
  }

  @override
  Future<Student?> loginStudent(String username, String password){
    return StudentDataSource().loginStudent(username,password);
  }
}
