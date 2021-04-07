import 'dart:ui';

import 'package:flutter/material.dart';

class AppMethods {
  static void showBusy(BuildContext context, bool busy) {
    if (busy) {
      Navigator.of(context).push(PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) {
            return Scaffold(
              backgroundColor: Colors.black.withOpacity(0.6),
              body: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Center(child: CircularProgressIndicator())),
            );
          }));
    } else
      Navigator.of(context).pop();
  }
}