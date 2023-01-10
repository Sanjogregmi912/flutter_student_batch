
import 'package:batch_student_starter/state/objectbox_state.dart';


import '../../helper/objectbox.dart';
import '../../model/course.dart';

class CourseDataSource{
  ObjectBoxInstance get objectBoxInstance => ObjectBoxState.objectBoxInstance!;

  Future<int> addCourse(Course course) async{
    try{
      return objectBoxInstance.addCourse(course);
    } catch(e){
      return Future.value(0);
      // or
      // return 0;
    }
  }

  Future<List<Course>> getCourse() async{
    try{
      return objectBoxInstance.getAllCourse();
    } catch (e){
      throw Exception("error in getting all student");
      // or
      // return 0;
    }
  }
}