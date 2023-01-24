import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restfull_api_riverpod/riverpod/login_riverpod.dart';

final loginRiverpod = ChangeNotifierProvider((_) => LoginRiverpod());
