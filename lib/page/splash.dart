import 'dart:developer';

import 'package:api_bloc/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var token = sharedPref.getString("TOKEN");
    log(token.toString());
    if (token != null) {
      Future.delayed(
          const Duration(seconds: 3),
          () => {
                Get.off(
                  const HomePage(),
                ),
              });
    } else {
      Future.delayed(
          const Duration(seconds: 3),
          () => {
                Get.off(
                  const LoginForm(),
                ),
              });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/images/logo/vep_joj_logo.png'),
          width: 180.0,
        ),
      ),
    );
  }
}
