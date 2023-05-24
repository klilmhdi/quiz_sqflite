import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void exitApp() {
  SystemNavigator.pop();
}

navTo(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));

navAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => Widget), (route) {
  return false;
});