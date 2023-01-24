import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restfull_api_riverpod/riverpod/riverpod_management.dart';
import 'package:grock/grock.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: 20.allP,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
                controller: ref.read(loginRiverpod).email,
                decoration: InputDecoration(
                    hintText: 'E-Mail',
                    border: OutlineInputBorder(borderRadius: 10.allBR))),
            TextField(
                controller: ref.read(loginRiverpod).password,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Şifre',
                  border: OutlineInputBorder(borderRadius: 10.allBR),
                )),
            SizedBox(
                width: Grock.width,
                child: ElevatedButton(
                    onPressed: () => ref.read(loginRiverpod).fetch(),
                    child: Text('Login')))
          ],
        ),
      )),
    );
  }
}
