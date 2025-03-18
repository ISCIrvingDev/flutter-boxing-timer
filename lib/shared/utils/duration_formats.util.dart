// * Utilidad para el formateo de valores de tipo "Duration"

class DurationFormatsUtil {
  // Formatea un "Duration" a "mm:ss"
  String formatDuration(Duration duration) {
    var newVal =
        '${duration.inMinutes.toString().padLeft(2, '0')}:${duration.inSeconds.toString().padLeft(2, '0')}';

    return newVal;
  }

  // Formatea un String con formato "15s" a "mm:ss"
  String formatSecondsStringTime(String stringTime) {
    var newVal = '00:${stringTime.replaceAll('s', '').padLeft(2, '0')}';

    return newVal;
  }
}
