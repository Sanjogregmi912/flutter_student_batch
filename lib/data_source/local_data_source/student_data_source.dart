import 'package:batch_student_starter/helper/objectbox.dart';
import 'package:batch_student_starter/model/student.dart';
import 'package:batch_student_starter/state/objectbox_state.dart';

class StudentDataSource {
  ObjectBoxInstance get objectBoxInstance => ObjectBoxState.objectBoxInstance!;
  // OR
  // ObjectBoxInstance objectBoxInstance2 = ObjectBoxState.objectBoxInstance!;

  Future<int> addStudent(Student student) async {
    try {
      return objectBoxInstance.addStudent(student);
    } catch (e) {
      return Future.value(0);
      // return 0;
    }
  }

  Future<List<Student>> getStudent() async {
    try {
      return objectBoxInstance.getAllStudent();
    } catch (e) {
      throw Exception("error in getting all student");
      // return [];
    }
  }

  // Future<Student?> loginStudent(Student username, String password) {}

  Future<Student?> loginStudent(username, password) {
    try {
      return Future.value(objectBoxInstance.loginStudent(username, password));
    } catch (e) {
      return Future.value(null);
      // or 
      // return 0;
    }
  }
}
