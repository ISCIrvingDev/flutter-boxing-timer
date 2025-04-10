class TimerDto {
  final int id;
  final String name;
  final int totalRounds;
  final String getReadyTime;
  final String roundTime;
  final String roundNoticeTime;
  final String breakTime;
  final String breakNoticeTime;

  TimerDto({
    required this.id,
    required this.name,
    required this.totalRounds,
    required this.getReadyTime,
    required this.roundTime,
    required this.roundNoticeTime,
    required this.breakTime,
    required this.breakNoticeTime,
  });

  // Parse from JSON
  factory TimerDto.fromJson(Map<String, dynamic> json) {
    return TimerDto(
      id: json['id'] ?? defaultTimerDto.id,
      name: json['name'] ?? defaultTimerDto.name,
      totalRounds: json['totalRounds'] ?? defaultTimerDto.totalRounds,
      getReadyTime: json['getReadyTime'] ?? defaultTimerDto.getReadyTime,
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
      'name': name,
      'totalRounds': totalRounds,
      'getReadyTime': getReadyTime,
      'roundTime': roundTime,
      'roundNoticeTime': roundNoticeTime,
      'breakTime': breakTime,
      'breakNoticeTime': breakNoticeTime,
    };
  }
}

final defaultTimerDto = TimerDto(
  id: 0,
  name: 'Box Amateur',
  totalRounds: 3,
  getReadyTime: '15s',
  roundTime: '03:00',
  roundNoticeTime: '10s',
  breakTime: '01:00',
  breakNoticeTime: '10s',
);
