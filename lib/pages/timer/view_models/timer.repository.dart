import 'package:flutter_boxing_timer/pages/timer/timer.models.dart';

abstract class ITimerRepository {
  TimerModel get timerModel;
  bool get started;
  void setTimerModel(TimerModel newVal);
  void reset();
  void stop();
  void start();
}
