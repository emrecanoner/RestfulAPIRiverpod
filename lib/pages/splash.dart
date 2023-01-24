import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grock/grock.dart';
import 'package:restfull_api_riverpod/pages/home_page.dart';
import 'package:restfull_api_riverpod/pages/login_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final box = GetStorage();
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      if (box.read('token') != null) {
        Grock.toRemove(HomePage());
      } else {
        Grock.toRemove(LoginPage());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'Hoş Geldiniz..',
        style: Theme.of(context).textTheme.headline4,
      )),
    );
  }
}
