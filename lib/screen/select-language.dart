import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/language_controller.dart';
import '../controllers/language_widget.dart';
import '../utils/app-routes.dart';
import '../utils/app_constants.dart';

class SelectLanguage extends StatefulWidget {


   SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:GetBuilder<LocalizationController>(builder: (localizationController) {
          return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:  2,
                  childAspectRatio: 1,
                ),
                itemCount: 2,//localizationController.languages.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => LanguageWidget(
                  languageModel: localizationController.languages[index],
                  localizationController: localizationController, index: index,
                )
            ),
            ElevatedButton(onPressed: (){
              if(localizationController.languages.length > 0 && localizationController.selectedIndex != -1) {
                localizationController.setLanguage(Locale(
                  AppConstants.languages[localizationController.selectedIndex].languageCode,
                  AppConstants.languages[localizationController.selectedIndex].countryCode,
                ));



              }
              if(localizationController.selectedIndex==0){
                Get.offNamed(RouteHelper.getFirstPage());
              }
              if(localizationController.selectedIndex==1){
                Get.offNamed(RouteHelper.getFirstPage());
              }
            }, child: Text("continue".tr))
          ],
        );}),
      ),
    );
  }
}
