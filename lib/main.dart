import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restfull_api_riverpod/pages/home_page.dart';
import 'package:grock/grock.dart';
import 'package:restfull_api_riverpod/pages/login_page.dart';
import 'package:restfull_api_riverpod/pages/splash.dart';

void main() async {
  await GetStorage.init();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Grock.navigationKey,
      scaffoldMessengerKey: Grock.scaffoldMessengerKey,
      title: 'Riverpod',
      home: Splash(),
    );
  }
}
