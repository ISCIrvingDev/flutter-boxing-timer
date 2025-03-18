class TimerModel {
  int currentRound = 1;
  int totalRounds = 12;
  String roundTime = '03:00';
  String breakTime = '01:00';
  String currentTime = '02:56';
  String elapsedTime = '00:19';
  String pendingTime = '11:01';
  String totalTime = '11:20';

  TimerModel({
    required this.currentRound,
    required this.totalRounds,
    required this.roundTime,
    required this.breakTime,
    required this.currentTime,
    required this.elapsedTime,
    required this.pendingTime,
    required this.totalTime,
  });
}

class TimerModel2 {
  int currentRound;
  String currentTime, elapsedTime, pendingTime;

  TimerModel2({
    this.currentRound = 0,
    this.currentTime = '',
    this.elapsedTime = '',
    this.pendingTime = '',
  });
}
