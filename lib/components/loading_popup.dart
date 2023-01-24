import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

void loadingPopup() {
  Grock.dialog(builder: (_) {
    return Center(
      child: CircularProgressIndicator(),
    );
  });
}
