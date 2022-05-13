import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_auth/app/core/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Auth",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: Colors.amber,

      ),
    ),
  );
}
