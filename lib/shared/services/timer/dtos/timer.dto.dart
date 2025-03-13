class TimerDto {
  final int id;
  final int totalRounds;
  final String roundTime;
  final String roundNoticeTime;
  final String breakTime;
  final String breakNoticeTime;

  TimerDto({
    required this.id,
    required this.totalRounds,
    required this.roundTime,
    required this.roundNoticeTime,
    required this.breakTime,
    required this.breakNoticeTime,
  });

  // Parse from JSON
  factory TimerDto.fromJson(Map<String, dynamic> json) {
    return TimerDto(
      id: json['id'] ?? defaultTimerDto.id,
      totalRounds: json['totalRounds'] ?? defaultTimerDto.totalRounds,
      roundTime: json['roundTime'] ?? defaultTimerDto.roundTime,
      roundNoticeTime:
          json['roundNoticeTime'] ?? defaultTimerDto.roundNoticeTime,
      breakTime: json['breakTime'] ?? defaultTimerDto.breakTime,
      breakNoticeTime:
          json['breakNoticeTime'] ?? defaultTimerDto.breakNoticeTime,
    );
  }

  // Convert to JSON for sending data to an API
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'totalRounds': totalRounds,
      'roundTime': roundTime,
      'roundNoticeTime': roundNoticeTime,
      'breakTime': breakTime,
      'breakNoticeTime': breakNoticeTime,
    };
  }
}

final defaultTimerDto = TimerDto(
  id: 0,
  totalRounds: 3,
  roundTime: '03:00',
  roundNoticeTime: '15s',
  breakTime: '01:00',
  breakNoticeTime: '10s',
);
