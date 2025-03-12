// * DTOs
import 'timer.dto.dart';

abstract class IAppTimerRepository {
  Future<CurrentTimerDto> getCurrentTimer();
}
