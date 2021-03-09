import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'home_page.dart';
import 'localization_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Multilanguage App',
      debugShowCheckedModeBanner: false,
      translations: LocalizationService(), // your translations
      locale: LocalizationService().getCurrentLocale(), // translations will be displayed in that locale
      fallbackLocale: Locale(
        'en',
        'US',
      ), // specify the fallback locale in case an invalid locale is selected.
      home: HomePage(),
    );
  }
}
