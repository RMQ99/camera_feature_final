import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

class AppRouter {
  static late FluroRouter router;

  // static Handler splashHandler = Handler(
  //     handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  //   return SplashPage();
  // });

  static void configureRoutes(FluroRouter fluroRouter) {
    fluroRouter.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const Center(
        child: Text('هذه الصفحة غير موجودة',
            style: TextStyle(
              fontSize: 25,
            )),
      );
    });
    // fluroRouter.define('/', handler: splashHandler);

    router = fluroRouter;
  }
}
