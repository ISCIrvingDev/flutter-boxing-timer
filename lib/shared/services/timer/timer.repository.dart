// * DTOs
import 'dtos/current_timer.dto.dart';

abstract class IAppTimerRepository {
  Future<CurrentTimerDto> getCurrentTimer();
  // Future<CurrentTimerDto> getTimerById(int id);
}
