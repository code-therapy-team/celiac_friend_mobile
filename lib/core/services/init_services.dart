import 'package:celus_fe/core/services/get_it.dart';
import 'package:flutter/material.dart';

import 'shared_pref.dart';

class InitServices {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initializationGetIt();
    await SharedPref.initSharedPreferences();
  }
}
