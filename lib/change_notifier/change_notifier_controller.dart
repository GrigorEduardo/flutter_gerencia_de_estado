import 'dart:math';

import 'package:flutter/material.dart';

class ChangeNotifierController extends ChangeNotifier{

  var imc = 0.0;

  Future<void> calcularImc({required double peso, required double altura}) async {
    imc = 0;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    imc = peso / pow(altura, 2);
    notifyListeners();
  }

}