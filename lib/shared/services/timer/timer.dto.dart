class CurrentTimerDto {
  final int id;
  final int totalRounds;
  final String roundTime;
  final String roundNoticeTime;
  final String breakTime;
  final String breakNoticeTime;

  CurrentTimerDto({
    required this.id,
    required this.totalRounds,
    required this.roundTime,
    required this.roundNoticeTime,
    required this.breakTime,
    required this.breakNoticeTime,
  });

  // Parse from JSON
  factory CurrentTimerDto.fromJson(Map<String, dynamic> json) {
    return CurrentTimerDto(
      id: json['id'] ?? defaultCurrentTimerDto.id,
      totalRounds: json['totalRounds'] ?? defaultCurrentTimerDto.totalRounds,
      roundTime: json['roundTime'] ?? defaultCurrentTimerDto.roundTime,
      roundNoticeTime:
          json['roundNoticeTime'] ?? defaultCurrentTimerDto.roundNoticeTime,
      breakTime: json['breakTime'] ?? defaultCurrentTimerDto.breakTime,
      breakNoticeTime:
          json['breakNoticeTime'] ?? defaultCurrentTimerDto.breakNoticeTime,
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

final defaultCurrentTimerDto = CurrentTimerDto(
  id: 0,
  totalRounds: 3,
  roundTime: '03:00',
  roundNoticeTime: '15s',
  breakTime: '01:00',
  breakNoticeTime: '10s',
);
