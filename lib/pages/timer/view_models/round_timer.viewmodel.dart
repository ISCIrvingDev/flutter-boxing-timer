import 'dart:async';

import 'package:flutter/material.dart';

// * Repositories
import 'timer.repository.dart';

// * Services
import 'package:flutter_boxing_timer/shared/services/player/player.repository.dart';

// * Models
import '../timer.models.dart';

class RoundTimerViewModel extends ChangeNotifier implements ITimerRepository {
  final IAppPlayerRepository appPlayerService;

  TimerModel _timerModel = TimerModel(
    seconds: 0,
    minutes: 0,
    digitSeconds: '',
    digitMinutes: '',
  );

  bool _started = false;

  Timer? _timer;

  @override
  TimerModel get timerModel => _timerModel;

  @override
  bool get started => _started;

  RoundTimerViewModel({required this.appPlayerService});

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
      int localMinutes = _timerModel.minutes;

      if (localMinutes > 0 && localSeconds < 1) {
        localMinutes--;
        localSeconds = 59;
      } else if (localMinutes < 1 && localSeconds < 1) {
        appPlayerService.play();
        stop();
      }

      _timerModel = TimerModel(
        seconds: localSeconds,
        minutes: localMinutes,
        digitSeconds: localSeconds >= 10 ? '$localSeconds' : '0$localSeconds',
        digitMinutes: localMinutes >= 10 ? '$localMinutes' : '0$localMinutes',
      );

      notifyListeners();
    });
  }
}
