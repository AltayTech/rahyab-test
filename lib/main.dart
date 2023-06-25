import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Core/widgets/main_wrapper.dart';
import 'home_bindig.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();

  runApp(DevicePreview(
    // enabled: kDebugMode,
    enabled: false,
    builder: (context) {
      return GetMaterialApp(
        home: MainWrapper(),
        initialBinding: HomeBinding(),
      );
    },
  ));
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}