class TimerModel {
  final int seconds, minutes;
  final String digitSeconds, digitMinutes;
  final int currentRound;
  final String digitCurrentRound;

  TimerModel({
    required this.seconds,
    required this.minutes,
    required this.digitSeconds,
    required this.digitMinutes,
    required this.currentRound,
    required this.digitCurrentRound,
  });
}
