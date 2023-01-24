import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restfull_api_riverpod/models/model.dart';
import 'package:restfull_api_riverpod/services/service.dart';

final controller = ChangeNotifierProvider((ref) => Controller());

class Controller extends ChangeNotifier {
  PageController pageController = PageController(initialPage: 0);
  bool? isloading;
  List<UserModelData?> users = [];
  List<UserModelData?> saved = [];

  void getData() {
    Service.fetch().then((value) {
      if (value != null) {
        users = value.data!;
        isloading = true;
        notifyListeners();
      } else {
        isloading = false;
        notifyListeners();
      }
    });
  }

  void addSaved(UserModelData model) {
    saved.add(model);
    users.remove(model);
    notifyListeners();
  }

  notSavedButton() {
    pageController.animateToPage(0,
        duration: const Duration(microseconds: 500), curve: Curves.easeInExpo);
  }

  savedButton() {
    pageController.animateToPage(1,
        duration: const Duration(microseconds: 500), curve: Curves.easeInExpo);
  }
}
