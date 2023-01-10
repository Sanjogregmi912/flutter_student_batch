import 'package:batch_student_starter/helper/objectbox.dart';
import 'package:batch_student_starter/state/objectbox_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Create an object for ObjectBoxInstanc

  ObjectBoxState.objectBoxInstance = await ObjectBoxInstance.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((value) =>
    
    runApp(
    const MyApp(),
  ));

  
}
