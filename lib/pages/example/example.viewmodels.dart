import 'package:flutter/material.dart';
import 'example.models.dart';

class ExampleViewModel extends ChangeNotifier {
  Example _example = Example(name: "John Doe", age: 25);
  Example get example => _example;

  void updateExample(String name, int age) {
    _example = Example(name: name, age: age);
    notifyListeners(); // Notifica a los listeners para actualizar la UI
  }
}
