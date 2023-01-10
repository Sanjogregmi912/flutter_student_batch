// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:batch_student_starter/repository/student_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:motion_toast/motion_toast.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: 'kiran');
  final _passwordController = TextEditingController(text: 'kiran123');
      _savetosharedprefernces(String username, String password) async {
      try {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("username", username);
        await prefs.setString("password", password);
      } catch (e) {
        debugPrint(e.toString());
      }
    }

  @override
  Widget build(BuildContext context) {
  
    _gotoAnotherPage() {
      Navigator.pushNamed(context, "/dashboardScreen");
    }

    _showMessage() {
      MotionToast.error(description: const Text("Invalid username or password"))
          .show(context);
    }



    _login() async {
      final student = await StudentRepositoryImp()
          .loginStudent(_usernameController.text, _passwordController.text);
      if (student != null) {
        _savetosharedprefernces(_usernameController.text,_passwordController.text);
        _gotoAnotherPage();
      } else {
        _showMessage();
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/logo.svg',
                      height: 200,
                      width: 200,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _usernameController,
                      onSaved: (newValue) {
                        setState(() {
                          _usernameController.text = newValue!;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Username',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _login();
                        }
                      },
                      child: const SizedBox(
                        height: 40,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Brand Bold",
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/registerScreen');
                      },
                      child: const SizedBox(
                        height: 40,
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Brand Bold",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
