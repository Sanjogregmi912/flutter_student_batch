import 'package:batch_student_starter/model/student.dart';
import 'package:objectbox/objectbox.dart';
// import 'package:batch_student_starter/objectbox.g.dart';

@Entity()
class Course{
  @Id(assignable: true)
  int courseID;
  String courseName;

  @Backlink()
  final student = ToMany<Student>();
  Course(this.courseName, {this.courseID=0});
}