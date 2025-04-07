import 'dart:async';

import 'package:flutter/material.dart';

// * Repositories
import 'timer.repository.dart';

// * Models
import '../timer.models.dart';

class RoundNoticeTimer extends ChangeNotifier implements ITimerRepository {
  TimerModel _timerModel = TimerModel(
    seconds: 0,
    minutes: 0,
    digitSeconds: '00',
    digitMinutes: '00',
  );
  bool _started = false;
  Timer? _timer;

  @override
  TimerModel get timerModel => _timerModel;

  @override
  bool get started => _started;

  @override
  void setTimerModel(TimerModel newVal) {
    _timerModel = newVal;

    notifyListeners();
  }

  @override
  void reset() {
    _timer!.cancel();

    _timerModel = TimerModel(
      seconds: 0,
      minutes: 0,
      digitSeconds: '00',
      digitMinutes: '00',
    );

    _started = false;

    notifyListeners();
  }

  @override
  void stop() {
    _timer!.cancel();

    _started = false;

    notifyListeners();
  }

  @override
  void start() {
    _started = true;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localSeconds = _timerModel.seconds - 1;

      if (localSeconds > 59) {
        localSeconds = 0;
      } else if (localSeconds < 1) {
        stop();
      }

      _timerModel = TimerModel(
        seconds: localSeconds,
        minutes: 0,
        digitSeconds: localSeconds >= 10 ? '$localSeconds' : '0$localSeconds',
        digitMinutes: '00',
      );

      notifyListeners();
    });
  }
}
