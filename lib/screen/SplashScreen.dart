// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_element

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _getDataFraomSharedPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? username = prefs.getString("username");
    final String? password = prefs.getString("password");
    print(username);
    print(password);

    if (username != null && password != null) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, "/dashboardScreen");
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, "/");
    }
  }

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      (() {
        print("open");
        _getDataFraomSharedPref();
      }),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: SizedBox(
                  child: Text("Splash Screen"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: const CircularProgressIndicator(
                  color: Colors.green,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
