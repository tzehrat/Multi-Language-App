import 'package:dbstech_ml_example/screen/select-language.dart';
import 'package:dbstech_ml_example/utils/app-routes.dart';
import 'package:dbstech_ml_example/utils/app_constants.dart';
import 'package:dbstech_ml_example/utils/messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'utils/dep.dart' as dep;
import 'controllers/language_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Map<String,Map<String,String>> _languages=await dep.init();
  runApp( MyApp(languages: _languages));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.languages});
  final Map<String, Map<String, String>> languages;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetBuilder<LocalizationController>(builder: (localizationController){
    return GetMaterialApp(
      locale: localizationController.locale,
      translations: Messages(languages: languages),
      fallbackLocale: Locale(AppConstants.languages[0].languageCode,
          AppConstants.languages[0].countryCode),
      initialRoute: RouteHelper.getSelectLanguage(),
      getPages: RouteHelper.routes,    );});
  }
}

