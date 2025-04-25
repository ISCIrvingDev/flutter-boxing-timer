// * DTOs
import 'dtos/current_timer.dto.dart';

abstract class IAppTimerRepository {
  // * Obtiene el Timer actual
  Future<CurrentTimerDto> getCurrentTimer();

  // * Obtiene un Timer por medio de su ID
  Future<CurrentTimerDto> getTimerByKey(String key);

  // * Obtiene una lista de todos los Timers
  Future<List<String>> getTimers();

  // * Establece un timer como el Timer actual por medio de su Key
  Future<bool> setCurrentTimer(String key);

  // * Crea un nuevo Timer
  Future<bool> createTimer(String key, CurrentTimerDto timer);

  // * Elimina un Timer por medio de su Key
  Future<bool> removeTimer(String key);
}
