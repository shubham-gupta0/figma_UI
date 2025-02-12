import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webui/app/routes/app_routes.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.feedback,
    getPages: AppPages.routes,
  ));
}