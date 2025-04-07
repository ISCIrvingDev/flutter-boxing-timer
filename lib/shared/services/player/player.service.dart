import 'package:audioplayers/audioplayers.dart';

// * Repository
import 'player.repository.dart';

class AppPlayerService implements IAppPlayerRepository {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  Future<void> play() async {
    try {
      await _audioPlayer.play(AssetSource('sounds/boxing-bell.mp3'));
    } catch (e) {
      print('Error playing sound: $e');
    }
  }
}
