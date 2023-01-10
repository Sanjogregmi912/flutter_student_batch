import 'dart:io';

import 'package:batch_student_starter/model/student.dart';
import 'package:batch_student_starter/model/batch.dart';
import 'package:batch_student_starter/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

import '../model/course.dart';

class ObjectBoxInstance {
// Store is used to create database
  late final Store _store;
  //Box is used to create database table
  late final Box<Batch> _batch;
  late final Box<Student> _student;
  late final Box<Course> _course;

// Constructor
  ObjectBoxInstance(this._store) {
    _batch = Box<Batch>(_store);
    _student = Box<Student>(_store);
    _course = Box<Course>(_store);

    insertBatches();
    insertCourses();
  }

// Initialization of ObjectBox

  static Future<ObjectBoxInstance> init() async {
    var dir = await getApplicationDocumentsDirectory();

    final store = Store(
      getObjectBoxModel(),
      directory: '${dir.path}/student_course',
    );
    return ObjectBoxInstance(store);
  }

//-------Batch Queries-----------------
  int addBatch(Batch batch) {
    return _batch.put(batch);
  }

  int addStudent(Student student) {
    return _student.put(student);
  }

  List<Batch> getAllBatch() {
    return _batch.getAll();
  }

  List<Student> getAllStudent() {
    return _student.getAll();
  }

  int addCourse(Course course) {
    return _course.put(course);
  }

  List<Course> getAllCourse() {
    return _course.getAll();
  }

  //login Student
  Student? loginStudent(String username, String password) {
    return _student
        .query(Student_.username.equals(username) &
            Student_.password.equals(password))
        .build()
        .findFirst();
  }

/* When app is opened for the first time,
  insert some batches in the database
 */

  void insertBatches() {
    List<Batch> lstBatches = getAllBatch();
    if (lstBatches.isEmpty) {
      addBatch(Batch("29-A"));
      addBatch(Batch("29-B"));
      addBatch(Batch("28-A"));
      addBatch(Batch("28-B"));
    }
  }

  void insertCourses() {
    List<Course> lstCourses = getAllCourse();
    if (lstCourses.isEmpty) {
      addCourse(Course('Web API'));
      addCourse(Course("Android Mobile"));
      addCourse(Course("AI"));
      addCourse(Course("Computing"));
      addCourse(Course("Design"));
    }
  }

  static Future<void> deleteDatabase() async {
    var dir = await getApplicationDocumentsDirectory();
    Directory('${dir.path}/student_course').deleteSync(recursive: true);
  }
}
