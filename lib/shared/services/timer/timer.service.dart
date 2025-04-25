// * Repository
import 'dart:convert';

import 'timer.repository.dart';

// * DTOs
import 'package:flutter_boxing_timer/shared/services/timer/dtos/current_timer.dto.dart';

// * Storage
import 'package:shared_preferences/shared_preferences.dart';

class AppTimerService implements IAppTimerRepository {
  @override
  Future<CurrentTimerDto> getCurrentTimer() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // var data = prefs.get('currentTimer');

    // data != null CurrentTimerDto.fromJson(data)

    // var res = prefs.get('currentTimer') ?? CurrentTimerDto(roundTime: '03:00');
    var currentTimer = prefs.getString('currentTimer');

    var res =
        currentTimer != null
            ? jsonDecode(currentTimer) as CurrentTimerDto
            : defaultCurrentTimerDto;

    return res;
  }

  @override
  Future<CurrentTimerDto> getTimerByKey(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var timer = prefs.getString(key);

    var res =
        timer != null
            ? jsonDecode(timer) as CurrentTimerDto
            : defaultCurrentTimerDto;

    return res;
  }

  @override
  Future<List<String>> getTimers() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var timers = prefs.getKeys();

    return timers.toList();
  }

  @override
  Future<bool> setCurrentTimer(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var timer = getTimerByKey(key);

    bool res = await prefs.setString('currentTimer', jsonEncode(timer));

    return res;
  }

  @override
  Future<bool> createTimer(String key, CurrentTimerDto timer) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var res = await prefs.setString(key, jsonEncode(timer));

    return res;
  }

  @override
  Future<bool> removeTimer(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool res = await prefs.remove(key);

    return res;
  }
}
