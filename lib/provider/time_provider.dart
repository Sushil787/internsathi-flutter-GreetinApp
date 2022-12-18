import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class TimeProvider extends ChangeNotifier {
  String _currentTime = DateFormat.Hm().format(DateTime.now());
  String get getCurrentTime => _currentTime;

  void updateTimer() {
    _currentTime = DateFormat.jms().format(DateTime.now());
    print(_currentTime);
    notifyListeners();
  }
}
