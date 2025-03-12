// * Repository
import 'timer.repository.dart';

// * DTOs
import 'package:flutter_boxing_timer/shared/services/timer/timer.dto.dart';

// * Storage
import 'package:shared_preferences/shared_preferences.dart';

class AppTimerService implements IAppTimerRepository {
  @override
  Future<CurrentTimerDto> getCurrentTimer() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // var data = prefs.get('currentTimer');

    // data != null CurrentTimerDto.fromJson(data)

    // var res = prefs.get('currentTimer') ?? CurrentTimerDto(roundTime: '03:00');
    var res =
        prefs.get('currentTimer') != null
            ? prefs.get('currentTimer') as CurrentTimerDto
            : defaultCurrentTimerDto;

    return res;
  }
}
