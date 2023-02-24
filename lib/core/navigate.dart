import 'package:flutter/material.dart';

class Navigate {
  static navigateWithoutBack(context, to) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => to));
  }

  static navigateWithBack(context, to) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => to));
  }

  static navigateAndRemoveAll(context, to) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => to),
        (Route<dynamic> route) => false);
  }
}
