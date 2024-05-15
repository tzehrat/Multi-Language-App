import 'package:dbstech_ml_example/screen/first-page.dart';
import 'package:dbstech_ml_example/screen/second-page.dart';
import 'package:dbstech_ml_example/screen/select-language.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class RouteHelper {
  static const String selectLanguage = '/';
  static const String firstPage = '/firstPage';
  static const String secondPage='/secondPage';
  static String getFirstPage() => '$firstPage';
  static String getSelectLanguage()=>'$selectLanguage';
  static String getSecondPage()=>'$secondPage';

  static List<GetPage> routes = [

    GetPage(name: firstPage, page: () {
      return FirstPage();
    }),
    GetPage(name: selectLanguage, page:(){
      return SelectLanguage();
    }),
    GetPage(name:secondPage, page:(){
      return SecondPage();
    })
  ];


}