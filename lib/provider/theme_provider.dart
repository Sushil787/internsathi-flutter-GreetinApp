import 'package:approvider/assets_class.dart';
import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black));

ThemeData light = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.red));

List<String> messages = [
  "good moring",
  "good afternoon",
  "good evening",
  "good night"
];
List<String> messagePhotos = [];

class ThemeNotifier extends ChangeNotifier {
  bool _darkTheme = true;
  String _message = "hello";
  String _image = AssetClass.goodMorning;

  bool get darkTheme => _darkTheme;
  String get getImage => _image;
  String get getMessage => _message;


  ThemeNotifier() {
    loadDateTime();
  }

  void loadDateTime() {
    final timeInHr = DateTime.now().hour.toInt();
    if (timeInHr >= 5 && timeInHr <= 12) {
      _message = messages[0];
      _image = AssetClass.goodMorning;
      _darkTheme = false;
    } else if (timeInHr > 12 && timeInHr <= 17) {
      _message = messages[1];
      _image = AssetClass.goodAfternoon;
      _darkTheme = false;
    } else if (timeInHr > 17 && timeInHr <= 20) {
      _message = messages[2];
      _image = AssetClass.goodEvening;
      _darkTheme = true;
    } else {
      _message = messages[3];
      _image = AssetClass.goodNight;
      _darkTheme = true;
    }
    notifyListeners();
  }
}
