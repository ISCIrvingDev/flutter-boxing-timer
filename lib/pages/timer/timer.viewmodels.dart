import 'package:flutter/material.dart';

// * Models
import 'timer.models.dart';

class TimerViewModel extends ChangeNotifier {
  TimerModel _timerModel = TimerModel(
    currentRound: 1,
    currentTime: '02:56',
    elapsedTime: '00:19',
    pendingTime: '11:01',
    totalTime: '11:20',
  );
  TimerModel get timerModel => _timerModel;

  void updateTimerModel(TimerModel newVal) {
    _timerModel = TimerModel(
      currentRound: newVal.currentRound,
      currentTime: newVal.currentTime,
      elapsedTime: newVal.elapsedTime,
      pendingTime: newVal.pendingTime,
      totalTime: newVal.totalTime,
    );
    notifyListeners(); // Notifica a los listeners para actualizar la UI
  }
}
