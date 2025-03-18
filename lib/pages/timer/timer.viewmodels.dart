import 'dart:async';

import 'package:flutter/material.dart';

// * Models
import 'timer.models.dart';

class TimerViewModel extends ChangeNotifier {
  // Valor por defecto del TimerModel
  TimerModel _timerModel = TimerModel(
    currentRound: 1,
    totalRounds: 12,
    roundTime: '03:00',
    breakTime: '01:00',
    currentTime: '02:56',
    elapsedTime: '00:19',
    pendingTime: '11:01',
    totalTime: '11:20',
  );
  TimerModel get timerModel => _timerModel;

  void setTimerModel(TimerModel newVal) {
    _timerModel = TimerModel(
      currentRound: newVal.currentRound,
      totalRounds: newVal.totalRounds,
      roundTime: newVal.roundTime,
      breakTime: newVal.breakTime,
      currentTime: newVal.currentTime,
      elapsedTime: newVal.elapsedTime,
      pendingTime: newVal.pendingTime,
      totalTime: newVal.totalTime,
    );

    notifyListeners(); // Notifica a los listeners para actualizar la UI
  }

  void setCurrentTime(String newVal) {
    _timerModel.currentTime = newVal;

    notifyListeners(); // Notifica a los listeners para actualizar la UI
  }
}

class TimerViewModel2 extends ChangeNotifier {
  // * Valor por defecto del TimerModel
  TimerModel2 _timerModel = TimerModel2();
  TimerModel2 get timerModel => _timerModel;

  // * Propiedades computadas
  int seconds = 0, minutes = 0;
  String digitSeconds = '00', digitMinutes = '00';
  bool started = false;

  // * Cronometro
  Timer? timer;

  // * Establece los valores de la vista
  void setTimerModel(TimerModel2 newVal) {
    _timerModel = newVal;

    notifyListeners();
  }

  // * Business Logic - Inicio
  void stop() {
    timer!.cancel();

    started = false;

    notifyListeners();
  }

  void reset({required String currentTime, required String pendingTime}) {
    timer!.cancel();
    _timerModel = TimerModel2(
      currentRound: 1,
      currentTime: currentTime, // '00:00',
      elapsedTime: '00:00',
      pendingTime: pendingTime, // 'mm:ss'
    );

    started = false;

    notifyListeners();
  }

  void start() {
    started = true;

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      int localCurrentRound = _timerModel.currentRound;

      int localSeconds = seconds + 1;
      int localMinutes = minutes;

      if (localSeconds > 59) {
        if (localMinutes > 59) {
          localCurrentRound++;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        }
      }

      _timerModel = TimerModel2(
        currentRound: localCurrentRound,
        currentTime:
            '${localMinutes >= 10 ? '$localMinutes' : '0$localMinutes'}:${localSeconds >= 10 ? '$localSeconds' : '0$localSeconds'}',
        elapsedTime: '',
        pendingTime: '',
      );

      notifyListeners();
    });
  }

  // * Business Logic - Fin
}
